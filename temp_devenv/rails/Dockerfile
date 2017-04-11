FROM ubuntu:16.04

WORKDIR /root
RUN apt-get update
RUN apt-get -f install
RUN apt-get install -y git build-essential ncurses-dev lua5.2 lua5.2-dev luajit python-dev python3-dev ruby-dev

### install vim
RUN git clone https://github.com/vim/vim
WORKDIR /root/vim
RUN git checkout -b v8.0.0008
RUN ./configure --with-features=huge \ 
    --enable-multibyte \
		--enable-luainterp=dynamic \
		--enable-gpm \
		--enable-cscope \
		--enable-fontset \
		--enable-fail-if-missing \
		--prefix=/usr/local \
		--enable-pythoninterp=dynamic \
		--enable-python3interp=dynamic \
		--enable-rubyinterp=dynamic
RUN make && make install

### use Asia/Tokyo as localtime
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:en
ENV LC_ALL ja_JP.UTF-8

### Install rbenv and ruby-build
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
RUN gem install rails --no-ri --no-rdoc

EXPOSE 3000

WORKDIR /root
RUN git clone https://gitlab.com/bamchoh/friend_books
WORKDIR /root/friend_books
RUN bundle install
ADD database.yml /root/friend_books/config/database.yml
