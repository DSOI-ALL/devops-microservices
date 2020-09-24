FROM node:12.2.0 as build
WORKDIR /app
ADD . /app/

RUN npm install @angular/cli -g
RUN npm install 
WORKDIR /app/microservices/node
RUN npm install

WORKDIR /app
RUN ng build

FROM nginx:alpine

# Copy custom nginx config
COPY ./.docker/nginx.conf /etc/nginx/nginx.conf

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
