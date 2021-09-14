FROM registry.access.redhat.com/ubi8/ubi-minimal
RUN rm -rf /var/cache/yum && microdnf install jq -y && microdnf clean all
COPY oc /usr/bin/oc
COPY start-script.sh /etc/
RUN chmod +x /usr/bin/oc && chmod 777 /etc/start-script.sh
ENTRYPOINT ["/etc/start-script.sh"]
