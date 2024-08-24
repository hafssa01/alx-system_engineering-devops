# 0-the_sky_is_the_limit_not.pp
# Puppet script to optimize Nginx performance

exec { 'optimize_nginx':
    command => '/bin/sed -i "s/worker_connections [0-9]*;/worker_connections 4096;/g" /etc/nginx/nginx.conf && \
                /bin/sed -i "s/worker_processes [0-9]*;/worker_processes auto;/g" /etc/nginx/nginx.conf && \
                /usr/sbin/nginx -s reload',
    path    => '/usr/bin:/usr/sbin:/bin:/sbin',
}

