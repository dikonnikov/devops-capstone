FROM nginx:mainline-alpine

ADD webcontent/index.html /usr/share/nginx/html/
ADD webcontent/logo_code.png /usr/share/nginx/html/

EXPOSE 80