This is a "buildpack," i.e., a Heroku thing that tells Heroku's infrastructure how to make things like [this example](https://github.com/davidad/openresty-heroku-example) work.
If you're trying to _use_ this buildpack to make a Heroku app, you probably want to look at that example instead of this repository.

For my future reference, and maybe yours if you are trying to build OpenResty yourself, making this buildpack work involved doing this:
```
curl -O -L http://downloads.sourceforge.net/sourceforge/pcre/pcre-8.34.tar.gz
curl -O -L http://openresty.org/download/ngx_openresty-1.5.11.1.tar.gz
tar xzf pcre-8.34.tar.gz
tar xzf ngx_openresty-1.5.11.1.tar.gz
cd ngx_openresty-1.5.11.1
export PATH=/sbin:$PATH
./configure --prefix=/app/openresty --with-pcre=/app/pcre-8.34 --with-luajit --with-http_postgres_module --with-file-aio --with-ipv6 --with-http_realip_module --with-http_addition_module --with-http_xslt_module --with-http_sub_module --with-http_dav_module --with-http_flv_module --with-http_gzip_static_module --with-http_random_index_module --with-http_secure_link_module --with-http_degradation_module --with-http_stub_status_module --with-mail --with-mail_ssl_module --with-pcre-jit --with-http_iconv_module -j2
make
make install
tar czf openresty_build-1.5.11.1-1.tar.gz openresty
```
and sticking that `openresty_build-1.5.11.1-1.tar.gz` file in the [Releases](https://github.com/davidad/heroku-buildpack-openresty/releases) section of this repository.
