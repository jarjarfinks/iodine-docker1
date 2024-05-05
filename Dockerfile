FROM ubuntu:22.04
RUN apt-get update -y
RUN apt-get install -y iodine openssh-server  net-tools
RUN useradd -ms /bin/bash  sshproxy
RUN echo  "sshproxy:sshproxy"|chpasswd
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
COPY ./start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT ["sh"]
CMD [ "/start.sh"]
