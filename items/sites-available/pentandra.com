
# Choose between www and non-www, listen on the *wrong* one and redirect to
# the right one -- http://wiki.nginx.org/Pitfalls#Server_Name
#
server {
  listen [::]:80;
  listen 80;

  # listen on both hosts
  server_name pentandra.com www.pentandra.com;

  # and redirect to the https host (declared below)
  # avoiding http://www -> https://www -> https:// chain.
  return 301 https://pentandra.com$request_uri;
}

server {
  listen [::]:443 ssl http2;
  listen 443 ssl http2;

  # listen on the wrong host
  server_name www.pentandra.com;

  include includes/directive-only/ssl.conf;

  ssl_certificate /etc/letsencrypt/live/pentandra.com/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/pentandra.com/privkey.pem;
  ssl_dhparam /etc/letsencrypt/live/pentandra.com/dhparams.pem;

  # and redirect to the non-www host (declared below)
  return 301 https://pentandra.com$request_uri;
}

server {

  # listen [::]:443 ssl http2 accept_filter=dataready;  # for FreeBSD
  # listen 443 ssl http2 accept_filter=dataready;  # for FreeBSD
  listen [::]:443 ssl http2 deferred;  # for Linux
  listen 443 ssl http2 deferred;  # for Linux
  # listen [::]:443 ssl http2;
  # listen 443 ssl http2;

  # The host name to respond to
  server_name pentandra.com;

  include includes/directive-only/ssl.conf;

  ssl_certificate /etc/letsencrypt/live/pentandra.com/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/pentandra.com/privkey.pem;
  ssl_dhparam /etc/letsencrypt/live/pentandra.com/dhparams.pem;

  include includes/directive-only/ssl-stapling.conf;

  include includes/directive-only/extra-security.conf;

  # Path for static files
  root /srv/http/lifepreserver;

  #Specify a charset
  charset utf-8;

  # Custom 404 page
  error_page 404 /404.html;

  # Include the basic config set
  include includes/basic.conf;

  # Redirect public feed to feedburner
  location /blog/feed {
    return 307 /blog/feed.atom;
  }

  # Redirect products → solutions page
  location /products {
    return 301 /solutions/;
  }

  # Redirect /company/funding/ → /company/funders/ page
  location /company/funding {
    return 301 /company/funders/;
  }
}

# vi: ft=nginx
