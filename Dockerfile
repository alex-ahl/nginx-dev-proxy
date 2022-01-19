FROM alpine:3.15.0
RUN apk add --update --no-cache openssh \
    && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
    && echo "root:root" | chpasswd   

RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
RUN echo "GatewayPorts yes" >> /etc/ssh/sshd_config


ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 22 80
COPY entrypoint.sh /