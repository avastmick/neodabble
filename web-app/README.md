# A simple web app to interact with a Neo contract

- Using [Meteor](https://meteor.com)
- Create meteor skeleton

```bash
alias meteor='docker run -it --rm --name=meteor -v $PWD:/app -p 3000:3000 avastmick/development:meteor'
```



```bash
docker run --rm \
  -e ROOT_URL=http://testsite.com \
  -v "$(pwd)":/home/meteor/src \
  -e MONGO_URL=mongodb://mymongoserver.com:27017/appdb \
  -e MONGO_OPLOG_URL=mongodb://mymongoserver.com:27017/local \
  ulexus/meteor:build
```
