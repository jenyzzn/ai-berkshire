#!/usr/bin/env bash
#
# AI Berkshire 安装脚本
# 把 skills/ 下的投研 Skill 部署为各 AI 编程工具的可调用能力。
#
# 各工具的扩展机制不同：
#   - Cursor       → 斜杠命令：~/.cursor/commands/<name>.md
#   - Claude Code  → 斜杠命令：~/.claude/commands/<name>.md
#   - Codex（新版） → 技能：    ~/.codex/skills/<name>/SKILL.md（带 YAML frontmatter）
#
# 注意：新版 Codex（带 threads/skills/plugins 的桌面版/CLI）只识别 ~/.codex/skills/，
#       不再从 ~/.codex/prompts/ 加载斜杠命令，因此 codex 目标安装为 skill。
#
# 用法：
#   ./install.sh                 # 安装到全部受支持的工具
#   ./install.sh cursor codex    # 只安装到指定工具（可多选：cursor / codex / claude）
#   ./install.sh --uninstall     # 卸载本仓库安装的内容
#
# 说明：Skill 中引用的 tools/*.py 相对路径会被改写为本仓库绝对路径，
#       这样在任意项目目录下调用都能找到工具脚本。
#
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$REPO_DIR/skills"

CURSOR_DIR="$HOME/.cursor/commands"
CLAUDE_DIR="$HOME/.claude/commands"
CODEX_SKILLS_DIR="$HOME/.codex/skills"
CODEX_PROMPTS_DIR="$HOME/.codex/prompts"

# 安装清单：记录所安装的条目以便卸载（F:文件 / D:目录）
MANIFEST="$REPO_DIR/.install-manifest"

# 把工具脚本路径改写为本仓库绝对路径后输出到 stdout。
# 源文件里存在两种写法：`~/ai-berkshire/tools/x.py` 和裸 `tools/x.py`，
# 需分别处理且避免对已是绝对路径的 `/.../tools/x.py` 重复拼接。
rewrite_paths() {
  sed -E \
    -e "s#~/ai-berkshire/#${REPO_DIR}/#g" \
    -e "s#([^/])tools/([A-Za-z0-9_]+\.py)#\1${REPO_DIR}/tools/\2#g" \
    "$1"
}

# 各技能的描述（用于 Codex skill 的 frontmatter，决定何时触发）
describe() {
  case "$1" in
    investment-research)      echo "对单家上市公司做巴菲特/芒格/段永平/李录四大师综合深度投资研究。当用户要求研究或分析某公司是否值得投资时使用。" ;;
    investment-team)          echo "多Agent并行投研团队：4个大师视角同时研究一家公司并由Team Lead综合。需要最全面、最快速的公司投研时使用。" ;;
    investment-checklist)     echo "巴菲特买入前六关Checklist快速筛选，支持多公司对比。10分钟判断一家或多家公司是否值得深入研究。" ;;
    industry-research)        echo "产业链全景扫描：从一个投资主题出发，按产业链环节切片研究整条链的投资机会。" ;;
    industry-funnel)          echo "行业漏斗筛选：全市场扫描→粗筛≤10家→终选3家深度分析，输出核心/卫星/期权组合建议。" ;;
    quality-screen)           echo "去劣快速筛选：用7条硬指标排除非一流公司，支持个股/行业/指数/主题批量筛。" ;;
    management-deep-dive)     echo "管理层纵深研究：当管理层是核心投资变量时，深挖创始人与高管的能力、资本配置与诚信。" ;;
    private-company-research) echo "未上市公司深度研究：用侦探式方法研究字节/SpaceX等信息稀缺的非上市公司并做多方法估值。" ;;
    deep-company-series)      echo "深度系列长文：把一家公司拆成8篇公众号级长文（从认知重置到决策闭环）。" ;;
    earnings-review)          echo "财报精读：只读一手原始财报，像巴菲特读年报一样解读某公司某期财报。" ;;
    earnings-team)            echo "财报精读团队：四大师并行解读财报→编辑润色→读者评审→产出可发布的公众号文章。" ;;
    portfolio-review)         echo "投资组合管理与优化：审视仓位、集中度与再平衡，从研究单公司升级到管理整个组合。" ;;
    thesis-tracker)           echo "投资论文追踪：买入后的纪律系统，持续跟踪投资逻辑是否被证伪。" ;;
    news-pulse)               echo "股价异动快速归因：股价大涨/大跌时，10-15分钟内搞清楚发生了什么。" ;;
    dyp-ask)                  echo "段永平问答：以段永平的思维方式回答任何商业、投资、人生问题。" ;;
    financial-data)           echo "财务数据获取与交叉验证规范：确保关键数据来自至少2个独立来源、误差超1%时告警。" ;;
    bottleneck-hunter)        echo "瓶颈猎手：扫描产业链中的瓶颈/卡脖子环节，定位高议价权的投资机会。" ;;
    wechat-article)           echo "公众号文章写作：把投研内容改写成可直接发布的公众号文章。" ;;
    *)                        echo "AI Berkshire 价值投资研究技能（巴菲特·芒格·段永平·李录框架）。" ;;
  esac
}

# 安装为斜杠命令目录（Cursor / Claude Code 通用）
install_command_dir() {
  local target="$1" label="$2"
  mkdir -p "$target"
  local count=0 f name
  for f in "$SKILLS_DIR"/*.md; do
    [ -e "$f" ] || continue
    name="$(basename "$f")"
    rewrite_paths "$f" > "$target/$name"
    echo "F:$target/$name" >> "$MANIFEST"
    count=$((count + 1))
  done
  echo "✅ ${label}: 已安装 ${count} 个命令 → ${target}"
}

# 安装为 Codex 技能：每个 skill 一个目录，内含带 frontmatter 的 SKILL.md
install_codex_skills() {
  mkdir -p "$CODEX_SKILLS_DIR"
  local count=0 f stem desc dir
  for f in "$SKILLS_DIR"/*.md; do
    [ -e "$f" ] || continue
    stem="$(basename "$f" .md)"
    desc="$(describe "$stem")"
    dir="$CODEX_SKILLS_DIR/$stem"
    mkdir -p "$dir"
    {
      printf -- '---\n'
      printf 'name: %s\n' "$stem"
      printf 'description: "%s"\n' "$desc"
      printf -- '---\n\n'
      rewrite_paths "$f"
    } > "$dir/SKILL.md"
    echo "D:$dir" >> "$MANIFEST"
    count=$((count + 1))
  done
  echo "✅ Codex: 已安装 ${count} 个技能 → ${CODEX_SKILLS_DIR}"
}

# 清理早期错误安装到 ~/.codex/prompts/ 的同名文件（新版 Codex 不识别）
cleanup_legacy_codex_prompts() {
  [ -d "$CODEX_PROMPTS_DIR" ] || return 0
  local f stem removed=0
  for f in "$SKILLS_DIR"/*.md; do
    [ -e "$f" ] || continue
    stem="$(basename "$f")"
    if [ -f "$CODEX_PROMPTS_DIR/$stem" ]; then
      rm -f "$CODEX_PROMPTS_DIR/$stem"
      removed=$((removed + 1))
    fi
  done
  if [ "$removed" -gt 0 ]; then
    echo "🧹 已清理旧版 codex prompts 残留：${removed} 个"
  fi
}

uninstall() {
  if [ ! -f "$MANIFEST" ]; then
    echo "未找到安装清单（$MANIFEST），无需卸载。"
    return 0
  fi
  local line kind path removed=0
  while IFS= read -r line; do
    [ -n "$line" ] || continue
    kind="${line%%:*}"
    path="${line#*:}"
    if [ "$kind" = "D" ] && [ -d "$path" ]; then
      rm -rf "$path"
      removed=$((removed + 1))
    elif [ "$kind" = "F" ] && [ -f "$path" ]; then
      rm -f "$path"
      removed=$((removed + 1))
    fi
  done < "$MANIFEST"
  rm -f "$MANIFEST"
  echo "🧹 已卸载 ${removed} 项。"
}

main() {
  if [ "${1:-}" = "--uninstall" ]; then
    uninstall
    return
  fi

  : > "$MANIFEST"

  local targets=("$@")
  if [ ${#targets[@]} -eq 0 ]; then
    targets=(cursor codex claude)
  fi

  local t
  for t in "${targets[@]}"; do
    case "$t" in
      cursor) install_command_dir "$CURSOR_DIR" "Cursor" ;;
      claude) install_command_dir "$CLAUDE_DIR" "Claude Code" ;;
      codex)  cleanup_legacy_codex_prompts; install_codex_skills ;;
      *) echo "⚠️  未知目标：$t（可选：cursor / codex / claude）" ;;
    esac
  done

  echo ""
  echo "完成。使用方式："
  echo "  - Cursor / Claude Code：输入 / 选择命令，例如 /investment-research 腾讯"
  echo "  - Codex：作为技能自动按需触发，或直接说『用 investment-research 技能研究腾讯』"
  echo "  （Codex 若未生效，请重启 Codex 让其重新加载 ~/.codex/skills/）"
}

main "$@"
