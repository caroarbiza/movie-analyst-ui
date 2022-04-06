FROM ideavate/amazonlinux-node:12

WORKDIR /home

RUN yum -y update \
&& yum install -y git && git clone https://github.com/caroarbiza/movie-analyst-ui.git \
&& git pull \
&& cd movie-analyst-ui \
&& npm install -y \
express \
ejs \
superagent 


EXPOSE 80

WORKDIR /home/movie-analyst-ui/

ENTRYPOINT ["npm","start"]
