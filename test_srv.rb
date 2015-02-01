# encoding: utf-8

require 'pp'
require 'drb'

class Alpha

  include DRbUndumped

  def myid
    puts "server: #{object_id}"
    object_id
  end

  def close
    DRb.stop_service
  end

end

z = DRb.start_service 'drbunix:/tmp/drbsock', Alpha.new, :UNIXFileMode => 0660
# DRb.start_service 'drbunix:/tmp/drbtest?beta', Alpha.new

pp z

DRb.thread.join
