#!/usr/bin/env ruby

# Manifest that configure clients SSH

file_line{'Declare Identity File':
  ensure => 'present'
  path   => '/etc/ssh/ssh_config',
  line   => '	IdentityFile ~/.ssh/school'
}

file_line{'Turn off Password':
  ensure => 'present',
  path   => '/etc/ssh/ssh_config',
  line   => '	PasswordAuthentication no'
}
