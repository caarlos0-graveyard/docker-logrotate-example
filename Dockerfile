FROM alpine
RUN apk add logrotate
COPY run.sh /
COPY logrotate.conf /etc/logrotate.d/app
RUN chmod 0444 /etc/logrotate.d/app
RUN ln -s /etc/periodic/daily/logrotate /etc/periodic/15min/logrotate
CMD ["/run.sh"]
