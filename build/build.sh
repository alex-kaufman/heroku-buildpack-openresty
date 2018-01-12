#!/bin/sh

BUILD_DIR=$1
CACHE_DIR=$2
ENV_DIR=$3

topic() {
  echo "-----> $*"
}


APP_PREFIX=/app/.heroku
mkdir -p $APP_PREFIX

PKG=http://openresty.org/download/openresty-1.13.6.1.tar.gz 

topic "Downloading Openresty..."
curl -O -L $PKG

tar -xvf openresty-1.13.6.1.tar.gz 
cd openresty-1.13.6.1
export PATH=/sbin:$PATH

topic "Configuring openresty...."
./configure -j2  --with-pcre-jit --with-luajit --prefix=$APP_PREFIX
make
make install
cd

topic "Making Openresty available to running application...."
mv $APP_PREFIX $BUILD_DIR/