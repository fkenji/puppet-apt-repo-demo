class repo::server {

    include apache

    package { "reprepro":
        ensure  => installed,
    }    

    file { ["/var/apt", "/var/apt/conf"]:
        ensure  => directory,
    }

    #specific apt-repo config
    file { "/var/apt/conf/distributions":
        source  => "puppet:///modules/repo/distributions",
        require => File["/var/apt/conf"],
    }

    #apache vhost conf
    file { "/etc/apache2/sites-available/apt-repo":
        source  => "puppet:///modules/repo/apt-repo.conf",
        require => Package["apache2-mpm-worker"],
    }

    file { "/etc/apache2/sites-enabled/apt-repo":
        ensure  => link,
        target  => "/etc/apache2/sites-available/apt-repo",
        require => File["/etc/apache2/sites-available/apt-repo"],
        notify  => Service["apache2"]
    }


}