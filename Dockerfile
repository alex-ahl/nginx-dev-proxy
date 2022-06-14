FROM alpine:3.16

RUN apk add --update --no-cache openssh \
    && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
    && sed -i s/GatewayPorts.*/GatewayPorts\ yes/ /etc/ssh/sshd_config \
    && sed -i s/AllowTcpForwarding.*/AllowTcpForwarding\ yes/ /etc/ssh/sshd_config \
    && sed -i s/.*PasswordAuthentication.*/PasswordAuthentication\ no/ /etc/ssh/sshd_config \
    && passwd -u root

RUN ssh-keygen -A

RUN mkdir ~/.ssh \
    && chmod 700 ~/.ssh \
    && touch ~/.ssh/authorized_keys \
    && chmod 600 ~/.ssh/authorized_keys

ARG ssh_pub_key
RUN echo "$ssh_pub_key" > /root/.ssh/authorized_keys

EXPOSE 22 80

CMD ["/usr/sbin/sshd", "-D", "-e"]