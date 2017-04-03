FROM nimbix/ubuntu-base:trusty
MAINTAINER randy.orr@nimbix.net

RUN apt-get update && apt-get install fio -y && apt-get install curl -y && apt-get clean
ADD app.sh /usr/local/bin/app.sh
ADD AppDef.json /etc/NAE/AppDef.json
RUN curl -X POST https://api.jarvice.com/jarvice/validate -d @/etc/NAE/AppDef.json

CMD /usr/local/bin/app.sh
