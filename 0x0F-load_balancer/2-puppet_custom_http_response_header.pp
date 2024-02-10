# Script that installs and configures nginx

exec{'update':
        provider=>shell,
        command => 'apt-get update'
}
-> package{'nginx':
        ensure=>'present'
}

-> file_line{'add_header':
        path=>'/etc/nginx/nginx.conf',
        match=>'http {',
        line=>"http {\n\nadd_header X-Served-By \"${hostname}\""
}
-> exec{'restart':
    provider=>shell,
    command=>'service nginx restart'
}
