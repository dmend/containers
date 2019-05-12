FROM fedora:30

RUN dnf upgrade -y --refresh
RUN dnf install -y znc

ADD znc.conf /var/lib/znc/.znc/configs/znc.conf
ADD znc.pem /var/lib/znc/.znc/znc.pem

RUN chown -R znc:znc /var/lib/znc/.znc
USER znc

EXPOSE 6697

CMD ["znc", "--foreground"]
