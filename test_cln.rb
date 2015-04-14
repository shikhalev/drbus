# encoding: utf-8

require 'pp'

require 'socket'

hostname = Socket.gethostbyname('shikhalev-drbus-1322678')

p hostname

hostname = %x{hostname}
domainname = %x{hostname -f}

pp [hostname, domainname]
