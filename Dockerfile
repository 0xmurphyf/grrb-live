# 静态托管 GRRB Live —— 纯前端单文件,nginx 服务即可
FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
# 单文件应用:所有逻辑内联在 index.html,SPA 式回退无需额外路由
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
