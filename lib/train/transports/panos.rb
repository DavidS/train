# encoding: utf-8
#
# author: David Schmitt

require 'train/plugins'
$LOAD_PATH.unshift('/home/david/git/puppetlabs-panos/lib')
require 'puppet/util/network_device/panos/device'

module Puppet
  def debug(msg)
    $stderr.puts msg
  end
  module_function :debug
end

class Train::Transports
  class Panos < Train.plugin(1)
    name 'panos'

    def connection(_ = nil)
      @connection ||= Connection.new(@options)
    end

    class Connection < BaseConnection
      def initialize(options)
        super(options)

        logger.level = Logger::INFO

        @host = options[:host]
      end

      def uri
        @host
      end

      def unique_identifier
        @host
      end

      def connection
        @connection ||= Puppet::Util::NetworkDevice::Panos::Device.new('file:///home/david/git/puppetlabs-panos/spec/fixtures/test-password.conf')
      end
    end
  end
end
