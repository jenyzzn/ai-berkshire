# 供应链瓶颈总地图（持续更新）

最后更新：2026-05-26（早间扫描）

---

## 地缘政治S级瓶颈（战争/政治驱动，区别于结构性产能瓶颈）

### 0a. 半导体级氦气（Qatar/伊朗战争）【2026-05-26 新增】
**核心数据**：Qatar占全球氦气33%供应（USGS）；2026-02-28伊朗导弹打击Ras Laffan，Qatar停产；韩国65%氦气进口依赖Qatar（三星、SK Hynix所在地）；修复周期3-5年；晶圆制造中氦气冷却**无可替代**；主要DRAM厂商现有库存仅"数月"（2-4个月估计）
**紧张程度**：极高——非产能不足，而是物理断供，资本开支无法解决
**瓶颈判定**：供给集中🔴（Qatar 33%）| 扩产周期🔴（3-5年修复）| 替代难度🔴（无替代）| 产能利用率🔴（停产）| 需求增速🔴（持续）= **S级**
**风险因子**：美国、俄罗斯、澳大利亚是替代供应来源，若战争6个月内结束+替代快速启动，缺口可控
**投资意义**：无直接投资标的（氦气供应为工业气体巨头附属业务，Air Products/Linde太大），但须监控三星/SK Hynix库存状态；如库存耗尽，HBM/DRAM供给将直接收缩
**来源**：[Fortune](https://fortune.com/2026/03/21/iran-war-helium-shortage-qatar-chip-supply-chains-ai-boom/) | [CNBC](https://www.cnbc.com/2026/03/19/the-iran-war-is-threatening-supply-helium-what-it-means-for-markets.html)

---

### 0b. 溴化物/HBr气体（以色列ICL Group）【2026-05-26 新增，A级候选升S级路径】
**核心数据**：以色列ICL Group控全球溴35%；以色列+约旦合计占全球产量约2/3；韩国97.5%溴进口依赖以色列；半导体刻蚀工艺使用氢溴酸（HBr）——DRAM/NAND晶体管图案刻蚀的核心化学品；Samsung/SK Hynix现有库存**仅2-3周**；建立新纯化产能需数年
**紧张程度**：高——gasworld称"比氦气更危险"，库存更短
**相关公司**：ICL Group（NYSE:ICL，~$80亿美元，但溴化物业务占比待核实）
**来源**：[gasworld](https://www.gasworld.com/story/bromine-supply-risk-more-dangerous-than-helium-for-chip-industry/2246847.article/) | [Digitimes](https://www.digitimes.com/news/a20260415VL213/supply-chain-materials-production-manufacturing-logistics.html)

---

## S级瓶颈（单点故障级）

### 1. InP衬底（磷化铟衬底）
**核心数据**：全球需求260-300M片/年 vs 有效产能约75M片（缺口>70%）  
**紧张程度**：最高——2027年前难以逆转  
**关键原因**：
- 全球五大供应商（Sumitomo、AXT/Tongmei、Freiberger、JX Nippon、Visual Photonics Epitaxy）集中度极高，合计市占约70%
- 全球首家6英寸InP光子芯片产业晶圆厂刚于荷兰Eindhoven破土（2026-03）
- 中国2024年扩大铟化合物出口管制，加剧西方供应链压力
- 下游需求：EML激光器→800G/1.6T光模块，AI数据中心急需
- **AXT估值警告**（2026-05-25更新）：AXT/AXTI市值已达$6.88-9.21B，P/S 84x，分析师平均目标价$22.80，股价已透支。瓶颈是真实的，但主要标的估值已极度高估。

**相关公司**：AXT Inc (AXTI，纳斯达克，S级主标的但估值极高), Sumitomo Electric (5802，东交所), Freiberger（未上市）

**来源**：[新浪财经磷化铟断供危机](https://finance.sina.cn/stock/jdts/2026-05-08/detail-inhxcyyr4274198.d.html) | [华尔街见闻](https://www.fxbaogao.com/detail/5416292)

---

### 2. EML激光器（电吸收调制激光器）
**核心数据**：全球800G光模块需求2026年达6300万套（同比+160%），EML是每个模块的核心光源  
**紧张程度**：最高——Nvidia已锁定主要供应商产能至2027年  
**关键原因**：
- 生产门槛极高，InP芯片+调制功能单片集成，良率要求苛刻
- 全球供应商仅Lumentum、Coherent、Mitsubishi Electric、Sumitomo、Broadcom寥寥几家
- 2026-03-02：Nvidia宣布向Lumentum、Coherent各投资$20亿美元并签署多年采购协议
- Lumentum 2026-05-19再下单多台Aixtron G10-AsP MOCVD系统扩产InP激光器

**相关公司**：Lumentum (LITE), Coherent (COHR), Mitsubishi Electric（未单独上市）

**来源**：[SDxCentral激进采购](https://www.sdxcentral.com/news/nvidias-aggressive-laser-procurement-spurs-supply-chain-fears/) | [Lumentum订购Aixtron设备](https://www.semiconductor-today.com/news_items/2026/may/aixtron-200526.shtml)

---

### 3. 数据中心电力/变压器基础设施 【2026-05-25 升级：A→S】
**核心数据**：美国变压器交期**已达4年**（2026-05-11最新），140个数据中心项目约12GW容量被阻；配电变压器供应缺口6%，电力变压器缺口30%  
**升级原因**：早间报告引用数据为18个月，午后验证发现已恶化至4年。物理基础设施，2029年前无法快速解决  
**关键分项**：
- 超高压变压器交期4年（美国），中国厂商交期10个月（低关税窗口关闭风险）
- 开关柜/配电系统：Powell Industries $400M+大单，积压$18亿
- 中国标的新发现：金盘科技（688676.SH）AIDC收入+337%，已向AWS/微软供货

**相关公司**：GE Vernova (GEV，大市值), Eaton (ETN，大市值), Powell Industries (POWL，$5.6B), 金盘科技 (688676.SH，~$20亿美元小市值★), 许继电气 (000400.SZ，~$55亿)

**来源**：[美国变压器交期4年 — pv-magazine-usa](https://pv-magazine-usa.com/2026/05/11/u-s-transformer-market-faces-severe-supply-constraints-as-lead-times-extend-to-four-years/) | [12GW数据中心被阻 — Energy News Beat](https://energynewsbeat.co/ai/more-than-half-of-the-data-centers-may-be-delayed-due-to-lack-of-transformers-and-electrical-equipment-2/)

---

## A级瓶颈（严重受限）

### 4. CoWoS先进封装
**核心数据**：TSMC CoWoS月产能从~80K片扩至年底约140K片，Nvidia预订60%  
**紧张程度**：高——TSMC满产，OSAT（ASE、Amkor）在紧急扩产

### 5. HBM（高带宽内存）
**核心数据**：SK Hynix + Samsung + Micron全部产能售罄至2026年底，部分客户已锁定2027年配额  
**主要供应商**：SK Hynix (000660), Samsung (005930), Micron (MU)

### 6. ABF基板 + ABF原材料（Layer 3升级） 【2026-05-26 更新：发现L3瓶颈】
**核心数据（L2基板层）**：Semco 2026年产能全被大科技公司预订；价格涨幅预期上调至30-35%；新产能最早2028年落地  
**核心数据（L3材料层，新发现）**：
- **味之素ABF膜（Ajinomoto Build-up Film）**：Ajinomoto（TYO:2802）控**95%+**全球ABF材料市场份额
- 已通知IC载板厂Q3 2026涨价**30%**（Digitimes 2026-05-13确认）
- AI GPU封装层数从3+3升至11+11→13+13，推动ABF膜需求加速
- **T-glass（高端玻纤布）** H2 2026供应缺口预计>40%（ABF基板上游另一瓶颈）
- Morgan Stanley预计2027年ABF严重短缺
**重要性**：ABF瓶颈已从"基板产能"（L2）传导到"原材料垄断"（L3），Ajinomoto的定价权决定整个ABF链成本
**投资意义**：Ajinomoto是大型食品公司（MSG主业），ABF非主业，非纯正投资标的；但此信号对Ibiden（TYO:4062）、欣兴（TW:3037）等基板厂的成本结构有直接负面影响
**主要供应商**：Samsung Electro-Mechanics (009150), Ibiden (4062), Shinko Electric (6967), Unimicron (3037)  
**原材料供应商**：Ajinomoto（TYO:2802，ABF膜95%份额，食品多元化，非纯正标的）
**来源**：[Digitimes ABF膜涨价](https://www.digitimes.com/news/a20260513PD230/ic-substrate-abf-substrate-demand-substrate-2026.html) | [BigGo ABF 30%](https://finance.biggo.com/news/ZU2KJZ4BpwxG186NIOsE)

### 7. 晶圆级探针卡（Probe Card）
**核心数据**：FormFactor Q1 2026收入$226M（+32% YoY），DRAM收入+70%；管理层称2026年产能满产；HBM4被定为"重大拐点"  
**估值警告**（2026-05-25）：FORM市值~$4B，P/E 208x，是历史中位数5倍，不在买入区间  
**竞争变化**：Technoprobe赢得TSMC 2nm 30%份额，FormFactor市场份额受压  
**主要供应商**：FormFactor (FORM，~$40亿，A级主标的但估值偏高), Cohu (COHU), Japan Electronic Materials, Technoprobe (意大利，未上市)

**来源**：[FORM Q1 2026记录营收](https://www.stocktitan.net/news/FORM/form-factor-inc-reports-2026-first-quarter-ptznafssjeh9.html)

### 8. InP MOCVD外延设备 【2026-05-25 新增 A级】
**核心数据**：
- Aixtron（AIXA）持有全球InP/光子MOCVD**70-90%市场份额**
- MOCVD反应炉材料专用（InP≠GaN），不可临时调配
- Q1 2026订单积压€359M（+17%），订单量€171M（+30%）；2026年全年指引上调至€560M
- Lumentum 2026-05-19刚下单多台G10-AsP MOCVD系统
- Veeco宣布$2.5亿+InP设备订单（2026-05-05），定位#2供应商
- 设备交期估计12-24个月

**关键洞察**：这是InP扩产链中被市场忽视的"底层之底层"——任何InP晶圆产能扩张都必须先等MOCVD设备，而Aixtron控制了70-90%的阀门。相比已被炒至P/S 84x的AXT，Aixtron是更合理的入口。

**主要供应商**：Aixtron (AIXA，法兰克福，70-90%份额，★核心关注), Veeco (VECO，纳斯达克，#2)

**来源**：[Aixtron Q1 2026业绩](https://finance.yahoo.com/markets/stocks/articles/aixtron-q1-earnings-call-highlights-160408260.html) | [Lumentum订购Aixtron](https://www.semiconductor-today.com/news_items/2026/may/aixtron-200526.shtml) | [Veeco $2.5亿InP订单](https://www.globenewswire.com/news-release/2026/05/05/3288217/0/en/Veeco-Announces-250-Million-in-Equipment-Orders-for-Manufacturing-Indium-Phosphide-Lasers.html)

### 9. 国防精确制导弹药供应链（能量材料）【2026-05-26 强化：硝化纤维素中国断供确认】
**核心数据**：固体火箭发动机（SRM）和高能炸药（HMX/RDX）是NATO精确制导弹药的物理上游瓶颈；美国SRM产能仅有Aerojet和Northrop两大供应商；DOD已直接向Aerojet投资$2.16亿扩产  
**2026-05-26 新增数据（硝化纤维素断供）**：
- 中国2024年8月限制硝化纤维素(NC)对NATO出口，NATO欧洲此前70%依赖中国棉短绒来源
- 欧洲NATO内NC自产能力：4500-10000吨/年；实际需求（含乌克兰供应）：>20000吨/年；**缺口>50%**
- BAE Systems正在开发不需NC/硝化甘油的替代推进剂技术，但仍处pilot阶段，**预计2026年底才达工业成熟**
- 意义：Chemring等欧洲国内能量材料供应商护城河显著加深

**相关公司**：
- Chemring (CHG.L，伦敦，£1.3B，能量材料65%收入，★纯正标的)
- Aerojet Rocketdyne (AJRD，纽交所，$4.7B，美国SRM两大供应商之一)
- Kratos Defense (KTOS，纳斯达克，$10.5B，Prometheus JV扩产中)
- Mercury Systems (MRCY，纳斯达克，$5.9B，导引头处理器)

**催化剂**：L3Harris Missile Solutions IPO（S-1已提交，2026H2目标上市，DoD $10亿股权投资）

**来源**：[Chemring 2025年报](https://www.chemring.com/~/media/Files/C/Chemring-V3/docs/chemring-annual-report-and-accounts-2025-v1.pdf) | [L3Harris IPO计划](https://www.gurufocus.com/news/8831123/l3harris-lhx-moves-forward-with-ipo-plans-for-missile-solutions-business) | [EPC.EU硝化纤维素报告](https://www.epc.eu/publication/running-on-empty-the-chemical-shortage-undermining-european-defence/)

---

## B级瓶颈（有压力但供应侧在快速响应）

### 10. 液冷系统（CDU/浸没式）
**核心数据**：市场2025-2026年CAGR约59%，2026年全球约$165亿美元  
**注意**：竞争者快速涌入，CDU市场有饱和迹象，不是纯正瓶颈  
**中国政策驱动**：工信部要求2026年底新建大型数据中心液冷渗透率>60%

### 11. 核电劳动力/设备
**核心数据**：核电重启面临核级焊工、检测师严重短缺；SMR供应链仍在建立  
**注意**：劳动力瓶颈不易直接投资；长期趋势，短期催化剂不明确

---

## 已解除/降级的瓶颈

*（暂无）*

---

## 变更日志

| 日期 | 变化 | 说明 |
|------|------|------|
| 2026-05-25（早） | 建档 | 首次创建瓶颈总地图 |
| 2026-05-25（早） | 新增 | InP衬底列为S级（缺口>70%，2027年前难逆转） |
| 2026-05-25（早） | 新增 | EML激光器列为S级（Nvidia锁定产能至2027年后） |
| 2026-05-25（早） | 新增 | 探针卡（Probe Card）列为A级 |
| 2026-05-25（午） | **升级 A→S** | 数据中心电力/变压器：美国交期恶化至4年，12GW被阻，升为单点故障级 |
| 2026-05-25（午） | **新增 A级** | InP MOCVD外延设备：Aixtron 70-90%份额，Lumentum刚下单，交期12-24月 |
| 2026-05-25（午） | 估值修正 | AXT (AXTI) 市值已达$9.2B（P/S 84x），早间$7-10亿估计严重低估；添加估值警告 |
| 2026-05-25（午） | 新增 | 国防能量材料（A级）：Chemring确认为纯正标的 |
| 2026-05-25（午） | 新增标的 | 金盘科技（688676.SH）进入数据中心变压器关注 |
| 2026-05-26（早） | **新增 地缘政治S级** | 半导体级氦气：Qatar停产，全球供应-33%，韩国65%依赖，三星/SK库存数月，修复3-5年 |
| 2026-05-26（早） | **新增 A级候选** | 溴化物/HBr：ICL Group控35%全球供应，韩国97.5%依赖以色列，仅2-3周库存 |
| 2026-05-26（早） | **升级 ABF L3** | ABF原材料层：Ajinomoto 95%垄断ABF膜，Q3 2026涨价30%；T-glass H2缺口>40% |
| 2026-05-26（早） | **强化 国防** | 硝化纤维素：中国已切断NATO供应，欧洲自产仅满足需求<50%，BAE替代技术2026底才就绪 |
