Package {
  allow_virtual => true
}

host { 'hosts_mng':
  name         => 'mng',
  ip           => "192.168.100.1"
}
host { 'hosts_node1':
  name         => 'node1',
  ip           => "192.168.100.11"
}
host { 'hosts_node2':
  name         => 'node2',
  ip           => "192.168.100.12"
}
host { 'hosts_node3':
  name         => 'node3',
  ip           => "192.168.100.13"
}

package { ['sshpass', 'vim', 'tree', 'expect', 'tmux']:
  ensure => 'installed'
}

file_line { 'ssh_hosts_checking':
  path => "/etc/ssh/ssh_config",
  line => "StrictHostKeyChecking no"
}
file_line { 'ssh_known_hosts':
  path => "/etc/ssh/ssh_config",
  line => "UserKnownHostsFile=/dev/null"
}

group { 'wheel':
  ensure => present
}

user { 'ceph':
  ensure     => 'present',
  password   => '$6$29zwfxytE053Vr2D$lAmkNSGDYdxWuMBclLWp7dZQtydwHFtDzMKWaBcNdNC1uj2QGUzEKXFxQaGanL3KRDuPgr7x.8Ix7NSYoYR/h.',
  shell      => '/bin/bash',
  managehome => true,
  groups     => ['wheel']
}

exec {'gen_ssh_keys':
  command => "ssh-keygen -t rsa -N '' -f /home/ceph/.ssh/id_rsa",
  user => 'ceph',
  path  => "/usr/bin/",
  onlyif => "[ ! -f /home/ceph/.ssh/id_rsa ]"
}
file_line { 'ceph_sudoers':
  path => "/etc/sudoers",
  line => "ceph ALL=(ALL) NOPASSWD: ALL"
}

yumrepo { 'ceph':
  enabled  => 1,
  descr    => 'Ceph packages',
  baseurl  => 'http://ceph.com/rpm-hammer/rhel7/$basearch',
  gpgcheck => 0,
}

yumrepo { 'ceph_noarch':
  enabled  => 1,
  descr    => 'Ceph noarch packages',
  baseurl  => 'http://ceph.com/rpm-hammer/rhel7/noarch',
  gpgcheck => 0,
}
