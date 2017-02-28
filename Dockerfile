FROM homeassistant/home-assistant

VOLUME /config

RUN apt-get update && apt-get install -y --no-install-recommends \
	git \
	&& rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade git+git://github.com/wardcraigj/home-assistant.git@insteon-lib

# Copy source
COPY . .

CMD [ "python", "-m", "homeassistant", "--config", "/config" ]
