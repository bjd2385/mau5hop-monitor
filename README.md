### A super simple app for monitoring the Mau5hop for new autographed content
To build the app -
```shell
docker build -t mau5hop .
```
then execute it with AWS environment variables -
```shell
# docker run -itd --env-file .env --name mau5hop mau5hop
...
# docker ps
CONTAINER ID   IMAGE      COMMAND         CREATED       STATUS       PORTS     NAMES
e41039deeb77   mau5hop   "bash app.sh"   3 hours ago   Up 3 hours             mau5hop
```