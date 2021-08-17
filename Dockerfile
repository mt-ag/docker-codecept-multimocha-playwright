FROM mcr.microsoft.com/playwright:v1.13.1-focal

LABEL org.opencontainers.image.source https://github.com/mt-ag/docker-codecept-multimocha-playwright

COPY . /codecept

RUN cd /codecept && yarn --prod

WORKDIR /codecept

# Run tests
CMD ["bash", "/codecept/scripts/run.sh"]
