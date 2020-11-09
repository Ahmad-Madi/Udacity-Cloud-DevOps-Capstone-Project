FROM nginx:alpine
COPY ./miniPaint /usr/share/nginx/html
sd
EXPOSE 80