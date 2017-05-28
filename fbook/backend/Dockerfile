FROM ubuntu:16.04

WORKDIR /root
RUN apt-get update
RUN apt-get -f install
RUN apt-get install -y git
RUN apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libpq-dev libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
RUN git clone https://github.com/rbenv/rbenv.git /root/.rbenv
WORKDIR /root/.rbenv
RUN src/configure && make -C src
RUN git clone https://github.com/rbenv/ruby-build.git /root/.rbenv/plugins/ruby-build
RUN /root/.rbenv/plugins/ruby-build/install.sh
ENV PATH /root/.rbenv/bin:$PATH
RUN echo 'eval "$(rbenv init -)"' >> /root/.profile && \
    . /root/.profile && \
    rbenv install 2.3.3 && \
    rbenv global 2.3.3
ENV PATH /root/.rbenv/shims:$PATH

### Install rails
RUN gem install rails -v 5.0.2 --no-ri --no-rdoc
WORKDIR /root/api
VOLUME /root/api

ADD ./api/Gemfile /root/api/Gemfile
RUN bundle install

EXPOSE 3000
CMD ["rails", "s"]
