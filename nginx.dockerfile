FROM nginx:stable-alpine
RUN rm /etc/nginx/conf.d/default.conf
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
## This line was commented in order to resolv ---> nginx: [error] open() "/var/run/nginx.pid" failed
#CMD [ "nginx", "-s" ,"reload" ]
CMD ["nginx", "-g", "daemon off;"]
