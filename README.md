# GRRB Live — 全球实际资源篮子

纯前端单文件应用(实物资源美元篮子指数)。部署在 **GitHub Pages**(main 分支根目录静态托管),无需后端、无构建步骤。

- 线上地址:https://0xmurphyf.github.io/grrb-live/

## 数据来源
- 商品行情(能源/农产品/金属):经 Cloudflare Worker 代理 `https://grrb-proxy.murphyf919.workers.dev/yahoo/<SYMBOL>` 穿透 Yahoo Finance(绕开浏览器/云 IP 的 429 限流)。
- 贵金属(银/钯/铂):`api.gold-api.com`(无需 key)。
- 无实时源的品种(砂石/磷矿/钾肥/原木/锂/稀土):用近期固定参考价(界面不标注,详见各品种 src 链接)。
- 8 小时前端缓存 + 立即更新按钮。

## 本地预览
直接用任意静态服务器打开 `index.html` 即可(需能访问上面的 Worker / Gold-API):
```bash
python3 -m http.server 8080
# 打开 http://localhost:8080
```

## 说明
- 篮子数量 = 全球实际年消耗量(权威机构口径,见每项 src 链接);价格随市场变动,权重由"市场价 × 实际消耗"自然涌现。
- 能源只计"燃料采出市值"(已删电力/汽油/柴油/一次能源总计等重复计价项)。
- 金属只收下游可交易成品(钢/铝/铜/锌/镍),不收矿石。
- 砂石骨料是物质流第一大头(按吨计市值不大),单独披露。
