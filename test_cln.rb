# encoding: utf-8

require 'pp'

require 'drb'

DRb.start_service

obj = DRbObject.new nil, 'drbunix:/tmp/drbsock'
p obj.myid

obj.close

p 0660
