### A super simple app for monitoring the Mau5hop for new autographed content
To build the app -
```shell
$ docker build -t mau5hop .
```
then execute it with [AWS environment variables](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html) -
```shell
$ docker run -itd --name mau5hop -e "SEARCH=(SIGNED|AUTOGRAPH|AUTOGRAPHED|INITIAL|INITIALS|SIGNATURE|ART PRINT)" --env-file .env mau5hop
2ba15a6b1502fc04cf2ea8aad59cf17c9b0a7cd6a7dd9cc19378d373952f6641
...
$ docker ps
CONTAINER ID   IMAGE     COMMAND         CREATED         STATUS        PORTS     NAMES
2ba15a6b1502   mau5hop   "bash app.sh"   3 seconds ago   Up 1 second             mau5hop
```
**Important:** be sure to set the `SNS_ARN` in the `.env` as there is no default.

I also tend to restrict the available CPU and memory to a very small space, since it's just essentially a bash script (say, `25M` and `0.2` CPUs).
