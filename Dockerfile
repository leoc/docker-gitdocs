FROM ruby:2.2

RUN apt-get update && apt-get install -y cmake

RUN mkdir -p /repos
RUN mkdir -p /app
WORKDIR /app

RUN gem install --no-ri --no-rdoc gitdocs

COPY . /app

CMD ./run.sh
