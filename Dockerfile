FROM nginx:alpine

# 빌드된 정적 파일 복사
COPY dist/ /usr/share/nginx/html/

# SPA 라우팅을 위한 nginx 설정
RUN echo 'server { \
    listen 80; \
    root /usr/share/nginx/html; \
    index index.html; \
    location / { \
        try_files $uri $uri/ /index.html; \
    } \
}' > /etc/nginx/conf.d/default.conf

EXPOSE 80
