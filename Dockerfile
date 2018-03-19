FROM node

RUN curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' && \
    apt-get update && apt-get install -y \
    	Xvfb \
    	google-chrome-stable \
    	bzip2 \
    	lftp \
    	&& \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    
RUN npm -g config set user root
RUN npm install -g @angular/cli

ENV DISPLAY :99.0
ENV CHROME_BIN /usr/bin/google-chrome

RUN mkdir -p /workdir
WORKDIR /workdir

EXPOSE 4200

CMD Xvfb :99