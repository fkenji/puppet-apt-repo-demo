class apache {
    package { "apache2-mpm-worker": ensure => installed }

    service { "apache2":
        enable  => true,
        ensure  => running,
        require => Package["apache2-mpm-worker"],
    }

    file { "/etc/apache2/ports.conf":
        source => "puppet:///modules/apache/port80.conf.apache",
        notify => Service["apache2"],
    }
}
