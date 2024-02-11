# Script that installs and configures nginx

exec{'update':
    command => '/usr/bin/apt-get update'
}

package{'nginx':
        ensure => 'installed',
}
file_line{'add_header':
        path=>'/etc/nginx/nginx.conf',
        match=>'http {',
        line=>"http {\n\tadd_header X-Served-By \"${hostname}\";",
        require => Package['nginx'],
}
service{'nginx':
    ensure => 'restarted',
    require => File_Line['add_header']
}
