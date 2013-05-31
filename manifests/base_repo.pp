file { "/usr/share/puppet":
    ensure => directory,
}

file { "/usr/share/puppet/modules":
    ensure => link,
    target=> "/vagrant/modules",
}

exec { "repo-sources-update":
    command     => "/usr/bin/apt-get update",
    before      => Package["reprepro"],
}

include repo::server