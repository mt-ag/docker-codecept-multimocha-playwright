FROM mcr.microsoft.com/playwright:bionic

COPY . /codecept

RUN cd /codecept && yarn --prod

WORKDIR /codecept

# Run tests
CMD ["bash", "/codecept/scripts/run.sh"]
