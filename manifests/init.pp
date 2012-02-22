class snmpd {
    package { snmpd: ensure => present }
    service { snmpd: 
      ensure          => running,
      hasrestart      => true,
      require => File["/etc/snmp/snmpd.conf"],
    }
    file { "/etc/snmp/snmpd.conf":
      owner => 'root',
      group => 'root',
      mode => 444,
      ensure => 'present',
      source => 'puppet:///modules/snmpd/snmpd.conf',
      replace => 'true',
    }
}
