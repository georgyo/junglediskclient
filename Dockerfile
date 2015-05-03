FROM centos:centos6

RUN yum clean all && \
    yum install -y xorg-x11-fonts-Type1

RUN curl -o /tmp/junglediskservermanagement.rpm https://downloads.jungledisk.com/jungledisk/junglediskservermanagement-3160-0.x86_64.rpm && \
    yum localinstall -y /tmp/junglediskservermanagement.rpm && \
    rm /tmp/junglediskservermanagement.rpm

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/shammas && \
    echo "shammas:x:${uid}:${gid}:shammas,,,:/home/shammas:/bin/bash" >> /etc/passwd && \
    echo "shammas:x:${uid}:" >> /etc/group && \
    echo "shammas ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    chown ${uid}:${gid} -R /home/shammas


USER shammas
ENV HOME /home/shammas
CMD /usr/local/bin/junglediskservermanagement
