FROM python:2.7
ENV goagent_dir /tmp/goagent
RUN pip install gevent pyOpenSSL dnslib supervisor
ADD vps /opt/goagent
RUN \cp -f /opt/goagent/limits.conf /etc/security/limits.conf
RUN mkdir -p /opt/goagent/log/
RUN echo '*/10 * * * * root sh /opt/goagent/goagentvps.sh restart' >> /etc/crontab
RUN echo 'session required pam_limits.so' >> /etc/pam.d/common-session
RUN echo 'session required pam_limits.so' >> /etc/pam.d/common-session-noninteractive
COPY run.sh /run.sh
RUN chmod +x /run.sh
EXPOSE 443
CMD ["/run.sh"]
