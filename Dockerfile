FROM amazon/aws-cli

ADD app .

# Non-secret environment vars. You still need to execute with the necessary aws CLI env vars and SNS ARN.
# https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html
ENV TIMEOUT=30
ENV INTERVAL=60
ENV URL="https://mau5hop.com/"
ENV SEARCH="(SIGNED|AUTOGRAPH|AUTOGRAPHED|INITIAL|INITIALS|SIGNATURE)"

RUN yum install -y jq

ENTRYPOINT ["bash"]

CMD ["app.sh"]
