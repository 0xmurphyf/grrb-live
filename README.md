# GRRB Live — 全球实际资源篮子

纯前端单文件应用(实物资源美元篮子指数)。部署在 Dokploy(Dockerfile → nginx 静态服务)。

## 数据来源
- 22 个商品(能源/农产品/金属):经 Cloudflare Worker 代理 `https://grrb-proxy.murphyf919.workers.dev/yahoo/<SYMBOL>` 穿透 Yahoo Finance(绕开浏览器/云 IP 的 429 限流)。
- 3 个贵金属(银/钯/铂):`api.gold-api.com`(无需 key)。
- 8 小时前端缓存 + 立即更新按钮。

## 本地预览
```
docker build -t grrb . && docker run -p 8080:80 grrb
# 打开 http://localhost:8080
```

## Dokploy 部署
1. 连此 GitHub 仓库(`0xmurphyf/grrb-live`),Branch `main`。
2. Build Type:`Dockerfile`(仓库自带)。
3. 暴露端口 80 → 绑域名 / sslip.io。
4. Deploy。

> Worker 端点若需更换,改 `index.html` 里的 `PROXY_BASE` 常量后重新 push。
