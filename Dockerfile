FROM onlyoffice/documentserver

MAINTAINER lmtoo <601235723@qq.com>

RUN mkdir /usr/share/fonts/chinese
COPY chinese/ /usr/share/fonts/chinese/
RUN apt-get install xfonts-utils
RUN apt-get install fontconfig 
RUN mkfontscale && mkfontdir && fc-cache -fv
RUN fc-cache -f -v && /usr/bin/documentserver-generate-allfonts.sh 
EXPOSE 80 443
VOLUME /etc/onlyoffice /var/log/onlyoffice /var/lib/onlyoffice /var/www/onlyoffice/Data /var/lib/postgresql /usr/share/fonts/truetype/custom

CMD bash -C '/app/onlyoffice/run-document-server.sh';'bash'
