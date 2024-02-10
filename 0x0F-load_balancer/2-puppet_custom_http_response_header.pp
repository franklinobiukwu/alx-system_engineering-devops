# Script that installs and configures nginx

package{'nginx':
        ensure => 'present',
        require=> Apt::Update['all'],
}
file_line{'add_header':
        path=>'/etc/nginx/nginx.conf',
        match=>'http {',
        line=>"http {\n\nadd_header X-Served-By \"$::hostname\"",
        require => Package['nginx'],
}
service{'nginx':
    ensure => 'restarted',
    require => File_Line['add_header']
}
