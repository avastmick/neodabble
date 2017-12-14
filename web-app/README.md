# A simple web app to interact with a Neo contract

- Using [Meteor](https://meteor.com)
- Create meteor skeleton

```bash
# Use docker to create meteor skeleton
alias app='docker run -it --rm --name=app -v "$(pwd)":/app -p 3000:3000 golden/meteor-dev'

```



```bash
docker run --rm \
  -e ROOT_URL=http://testsite.com \
  -v "$(pwd)":/home/meteor/src \
  -e MONGO_URL=mongodb://mymongoserver.com:27017/appdb \
  -e MONGO_OPLOG_URL=mongodb://mymongoserver.com:27017/local \
  ulexus/meteor:build
```
