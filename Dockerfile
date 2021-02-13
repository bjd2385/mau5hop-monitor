FROM amazon/aws-cli

ADD app .

ENV INTERVAL=60
ENV URL="https://mau5hop.com/"

ENTRYPOINT ["bash"]

CMD ["app.sh"]