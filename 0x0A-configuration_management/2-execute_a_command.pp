exec { 'kill_killmenow_process':
  command => 'pkill killmenow',
  path    => ['/usr/bin', '/bin', '/usr/sbin', '/sbin'],
  onlyif  => 'pgrep killmenow',
}

