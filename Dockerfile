FROM node:4.4.2
ADD /bin/bash /bin
WORKDIR /src
ADD . /src
RUN cd /src \
 && npm install \
 && npm rebuild node-sass \
 && npm run build \
 && npm cache clear \
 && rm -rf ~/.npm \
 && rm -rf /var/lib/apt/lists/*

EXPOSE 4040
ENTRYPOINT ["npm", "run", "dashboard"]
