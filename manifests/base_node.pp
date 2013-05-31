file { "/usr/share/puppet":
    ensure => directory,
}

file { "/usr/share/puppet/modules":
    ensure => link,
    target=> "/vagrant/modules",
}

include repo::node