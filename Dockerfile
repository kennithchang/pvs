FROM 10.1.2.179/library/base_ubuntu1604:1.1
MAINTAINER chang.fa
ENV LC_ALL C.UTF-8
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 安装mongodb

# ENV MONGODB_TGZ https://fastdl.mongodb.org/linux/mongodb-shell-linux-x86_64-ubuntu1604-3.4.24.tgz
# RUN set -x \
#     && wget -O /tmp/mongodb.tgz $MONGODB_TGZ \
#     && mkdir -p /opt/mongodb \
#     && tar zxf /tmp/mongodb.tgz -C /opt/mongodb --strip-components=1 \
#     && rm -rf /tmp/mongodb.tgz

# ENV PATH /opt/mongodb/bin:$PATH

RUN mkdir -p /opt/xunfeng
COPY . /opt/xunfeng

RUN set -x \
    && python2.7 -m pip install --upgrade pip \
    && pip2.7 install -r /opt/xunfeng/requirements.txt \
    && ln -s /usr/lib/x86_64-linux-gnu/libpcap.so /usr/lib/x86_64-linux-gnu/libpcap.so.1

RUN set -x \
    && chmod a+x /opt/xunfeng/masscan/linux_64/masscan \
    && chmod a+x /opt/xunfeng/dockerconf/start.sh

RUN chmod -R 777 /var/log

WORKDIR /opt/xunfeng

VOLUME ["/data"]

ENTRYPOINT ["/opt/xunfeng/dockerconf/start.sh"]

EXPOSE 8889

CMD ["/usr/bin/tail", "-f", "/dev/null"]
