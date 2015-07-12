FROM python:2.7
ENV goagent_dir /tmp/goagent
RUN pip install gevent pyOpenSSL dnslib supervisor
RUN git clone https://github.com/goagent/goagent.git $goagent_dir \
 && cp -r ${goagent_dir}/server/vps/ /opt/goagent \
 && mkdir -p /opt/goagent/log/ \
 && cp $goagent_dir/local/proxylib.py /opt/goagent/ \
 && echo '*/10 * * * * root sh /opt/goagent/goagentvps.sh restart' >> /etc/crontab
RUN rm -rf $goagent_dir
COPY run.sh /run.sh
RUN chmod +x /run.sh
EXPOSE 443
CMD ["/run.sh"]
