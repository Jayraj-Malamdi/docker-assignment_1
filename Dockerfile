# FROM Is used to define which base image should be used
FROM node:14-alpine

# WORKDIR defines the working directory for our container
WORKDIR /task1

# COPY is used to copy package.json to our working directory in container
COPY package.json .

# RUN is used to create new layer and is executed during build stage
RUN npm install

# COPY is used to copy all source code in our container working directory
COPY .  .

# ARG is used for setting dynamic environment values, ARG can't be accessed once image is built.
ARG mode

#ENV  are available during build and run stage
ENV ENV_NODE=$mode

# EXPOSE is used to hint that this port is useful and used by docker.
EXPOSE 5000

# CMD is used when we run the image
CMD ["npm" , "start"]