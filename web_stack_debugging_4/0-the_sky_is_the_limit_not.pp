# Fixes Nginx worker_connections limit causing failed requests under load
exec { 'fix--for-nginx':
  command => "sed -i 's/worker_connections .*/worker_connections 1024;/' /etc/nginx/nginx.conf && service nginx reload",
  path    => '/usr/local/bin/:/bin/:/usr/bin/',
}
