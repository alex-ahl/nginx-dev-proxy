FROM alpine:3.16
RUN apk add --update --no-cache openssh \
    && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
    && sed -i s/GatewayPorts.*/GatewayPorts\ yes/ /etc/ssh/sshd_config \
    && sed -i s/AllowTcpForwarding.*/AllowTcpForwarding\ yes/ /etc/ssh/sshd_config \
    && echo "root:root" | chpasswd

ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 22 80
COPY entrypoint.sh /