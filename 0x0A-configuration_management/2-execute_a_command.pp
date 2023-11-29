# Manifest that kills a process named killmenow.
# Requirements:
#	Must use the exec Puppet resource
#	Must use pkill

exec{'kills process':
  command  => 'pkill killmenow',
  provider => 'shell',
  onlyif   => 'pgrep killmenow',
}
