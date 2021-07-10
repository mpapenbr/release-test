FROM alpine
COPY hello.sh version.sh /
CMD ["/hello.sh"]