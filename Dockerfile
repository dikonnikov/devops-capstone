FROM nginx:mainline-alpine

COPY webcontent/index.html /usr/share/nginx/html/
COPY webcontent/logo_code.png /usr/share/nginx/html/

EXPOSE 80