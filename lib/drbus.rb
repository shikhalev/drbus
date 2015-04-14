# encoding: utf-8

require 'socket'
require_relative 'drbus/version'

module DRBus

  class Server

    attr_reader :name

    def default_name
      Socket.gethostname
    end

    private :default_name

    def initialize name: default_name, &block
      @name = name.intern
      if block_given?
        instance_eval(&block)
      end
    end

    def start_service
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
