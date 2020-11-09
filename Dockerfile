FROM nginx:alpine
COPY ./miniPaint /usr/share/nginx/html

EXPOSE 80