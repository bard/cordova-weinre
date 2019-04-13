FROM node:10-alpine
WORKDIR /var/app
COPY . .
RUN apk add --no-cache python2 git zip apache-ant && \
    cd weinre.build && ant build-archives && \
    apk del python2 git zip apache-ant
CMD ["./weinre.server/weinre", "--boundHost", "0.0.0.0", "--debug"]
