FROM klakegg/hugo:0.83.1-debian

RUN apt-get update && apt-get install -y git

COPY action.sh /action.sh

RUN chmod +x /action.sh

ENTRYPOINT ["/action.sh"]