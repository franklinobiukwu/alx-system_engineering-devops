#!/usr/bin/env ruby

# Manifest that configure clients SSH

file_line{'Declare host':
  ensure => 'present'
  path   => '~/.ssh/config',
  line   => 'Host 54.90.30.102'
}

file_line{'Declare Identity File':
  ensure => 'present'
  path   => '~/.ssh/config',
  line   => '	IdentityFile ~/.ssh/school'
}

filei_line{'Turn off Password':
  ensure => 'present',
  path   => '~/.ssh/config',
  line   => '	PasswordAuthentication no'

}
