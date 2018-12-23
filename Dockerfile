FROM prom/prometheus:v2.4.2
# Configuration
COPY prometheus.yml /etc/prometheus/

# New binary to allow preprocessing
USER root
COPY bin/run_prometheus.sh /bin/
RUN chmod a+x /bin/run_prometheus.sh && \
    dos2unix /bin/run_prometheus.sh && \
	dos2unix /etc/prometheus/prometheus.yml

USER nobody
COPY rules/*.yml /etc/prometheus/rules/

ENTRYPOINT ["/bin/run_prometheus.sh"]

# Default copied from base image
# Update from base image when changing the base image version!
CMD        [ "--config.file=/etc/prometheus/prometheus.yml", \
             "--storage.tsdb.path=/prometheus", \
             "--web.console.libraries=/usr/share/prometheus/console_libraries", \
             "--web.console.templates=/usr/share/prometheus/consoles" ]
