# Manifest that installs flask using pip3
# Requirements:
#	Install flask
#	version must be 2.1.0

package{ 'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}

package{'werkzeug':
  ensure   => '2.1.1',
  provider => 'pip3',
}
