class repo::node {

    host { "packages.seibzhen.com":
        ip     => "192.168.33.10",
        ensure => present,
        target => "/etc/hosts",
    }

    file { "/etc/apt/sources.list.d/seibzhen.list":
        content => "deb http://packages.seibzhen.com/ seibzhen main",
        require => Host['packages.seibzhen.com'],
        notify  => Exec['sources-update'],
    }

    exec { "sources-update":
        command     => "/usr/bin/apt-get update",
        require     => File["/etc/apt/sources.list.d/seibzhen.list"],
        refreshonly => true,
    }

}