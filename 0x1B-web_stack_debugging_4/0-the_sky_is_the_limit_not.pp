# Puppet manifest to optimize Nginx performance

# Ensure Nginx package is installed
package { 'nginx':
  ensure => installed,
}

# Stop Nginx service before making changes
service { 'nginx':
  ensure  => stopped,
  require => Package['nginx'],
}

# Modify Nginx configuration to optimize performance
file { '/etc/nginx/nginx.conf':
  ensure  => file,
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  content => template('nginx/nginx.conf.erb'), # You may need to create a template file
  require => Package['nginx'],
  notify  => Service['nginx'],
}

# Restart Nginx service after making changes
service { 'nginx':
  ensure => running,
}

# Notify success
exec { 'fix-for-nginx':
  command => '/bin/true',
  notify  => Service['nginx'],
}
