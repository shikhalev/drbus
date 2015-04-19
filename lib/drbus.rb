# encoding: utf-8

require 'socket'
require 'drb'
require_relative 'drbus/version'

module DRBus

  class Server

    DEFAULT_PRIORITY = 10

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

    def register_service service, channels, obj,
        allow_direct: true, allow_proxy: true
      srv = service.intern
      chs = {}
      case channels
      when Array
        channels.each { |i| chs[i.intern] = DEFAULT_PRIORITY }
      when Hash
        channels.each do |k, v|
          if v == nil
            chs[k.intern] = DEFAULT_PRIORITY
          else
            chs[k.intern] = v.to_i
          end
        end
      else
        chs[channels.intern] = DEFAULT_PRIORITY
      end
      data = {
        object: obj,
        channels: chs,
        allow_direct: allow_direct,
        allow_proxy: allow_proxy
      }
      @services ||= {}
      @services[srv] ||= []
      @services[srv] << data
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
