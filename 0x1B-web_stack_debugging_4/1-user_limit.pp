# 1-user_limit.pp
# Puppet script to increase the file descriptor limit for the holberton user

exec { 'set_holberton_user_limits':
    command => '/bin/echo "holberton soft nofile 4096" >> /etc/security/limits.conf && \
                /bin/echo "holberton hard nofile 8192" >> /etc/security/limits.conf && \
                /bin/echo "session required pam_limits.so" >> /etc/pam.d/common-session',
    path    => '/usr/bin:/usr/sbin:/bin:/sbin',
}

