# Puppet manifest to adjust file limits for the holberton user

exec { 'change-os-configuration-for-holberton-user':
  command => 'ulimit -n 4096',  # Adjust the file limit as needed
  path    => '/usr/local/bin/:/bin/',
}
# Additional configurations can be added if needed

# You might want to restart the session or apply additional changes here
-> exec { 'restart-session':
  command => 'su - holberton',
  path    => '/usr/local/bin/:/bin/',
}
