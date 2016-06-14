FROM python:2.7
ENV goagent_dir /tmp/goagent
RUN pip install gevent pyOpenSSL dnslib supervisor
ADD vps /opt/goagent
RUN mkdir -p /opt/goagent/log/
RUN echo '*/10 * * * * root sh /opt/goagent/goagentvps.sh restart' >> /etc/crontab
COPY run.sh /run.sh
RUN chmod +x /run.sh
EXPOSE 443
CMD ["/run.sh"]
