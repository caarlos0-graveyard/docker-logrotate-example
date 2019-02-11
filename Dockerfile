FROM alpine
RUN apk add logrotate
COPY run.sh /
COPY logrotate.conf /etc/logrotate.d/app

RUN chmod 0444 /etc/logrotate.d/app

RUN mkdir /etc/periodic/10min && \
  crontab -l | { cat; echo "*/10    *       *       *       *       run-parts /etc/periodic/10min"; } | crontab - && \
  ln -s /etc/periodic/daily/logrotate /etc/periodic/10min/logrotate

CMD ["/run.sh"]
