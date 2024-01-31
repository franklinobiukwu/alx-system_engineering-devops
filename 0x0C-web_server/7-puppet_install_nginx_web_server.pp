#!/usr/bin/env bash
# Puppet script that installs and configure nginx

package{'nginx':
    ensure => installed,
}

file_line {'line':
    ensure => 'present',
    path => '/etc/nginx/sites-available/default',
    after => 'listen 80 default_server;',
    line => 'location /redirect_me {\n\t\treturn 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;\n\t }'
}

file {'/var/www/html/index.html':
    content => 'Hello World!',
}

service {'nginx':
    ensure => running,
    require => Package['nginx']
}
