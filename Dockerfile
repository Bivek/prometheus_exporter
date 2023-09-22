ARG RUBY_VERSION=3.1
ARG GEM_VERSION=

FROM ruby:${RUBY_VERSION}-slim
ENV APP_HOME       /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY graphql_collector.rb ./
RUN gem install --no-doc --version=${GEM_VERSION} prometheus_exporter
RUN gem install --no-doc --version=${GEM_VERSION} graphql

EXPOSE 9394
ENTRYPOINT ["prometheus_exporter", "-b", "ANY", "-a", "graphql_collector"]
