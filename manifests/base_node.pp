file { "/usr/share/puppet":
    ensure => directory,
}

file { "/usr/share/puppet/modules":
    ensure => link,
    target=> "/vagrant/modules",
}

exec { "sources-update":
    command     => "/usr/bin/apt-get update",
}

include repo::node