FROM perl:5.32
RUN set -xe && \
	cpanm YAML::XS JSON::XS IO::All
ADD convert.pl /convert.pl
ENTRYPOINT ["/convert.pl"]
