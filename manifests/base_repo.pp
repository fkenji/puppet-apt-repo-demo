file { "/usr/share/puppet":
    ensure => directory,
}

file { "/usr/share/puppet/modules":
    ensure => link,
    target=> "/vagrant/modules",
}

exec { "repo-sources-update":
    command     => "/usr/bin/apt-get update",
    before      => [Class["repo::server"], Class["apache"]],
}

file { "add-packages-script":
    ensure => file,
    source => 'puppet:///modules/repo/add_package.sh',
    path => '/home/vagrant/add_package.sh',
}

include repo::server