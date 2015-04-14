# encoding: utf-8

require 'socket'
require 'drb'
require_relative 'drbus/version'

module DRBus

  class Server

    include DRbUndumped

    attr_reader :name

    def default_name
      Socket.gethostname
    end

    private :default_name

    def initialize name: default_name, &block
      @name = name.intern
      @block = block
    end

    def start_service url: nil
      # TODO: start
      if @block
        instance_eval(&@block)
      end
    end

  end

  class << self

    attr_reader :server

    def start_service
      @server = Server.new
      @server.start_service
    end

  end

end
