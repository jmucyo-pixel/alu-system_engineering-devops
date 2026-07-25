# 100-puppet_ssh_config.pp
#
# Puppet manifest that configures the SSH client to use the
# private key ~/.ssh/school and disable password authentication,
# so the client can connect to a server without a password prompt.

file_line { 'Declare identity file':
  ensure => present,
  path   => '/etc/ssh/ssh_config',
  line   => '  IdentityFile ~/.ssh/school',
  match  => '^\s*IdentityFile',
  after  => 'Host \*',
}

file_line { 'Turn off passwd auth':
  ensure => present,
  path   => '/etc/ssh/ssh_config',
  line   => '  PasswordAuthentication no',
  match  => '^\s*PasswordAuthentication',
  after  => 'Host \*',
}
