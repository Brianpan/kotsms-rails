require "kotsms/rails/version"
require "kotsms/core_ext/hash"
require "kotsms/configuration"
require "kotsms/sms_message"
module Kotsms
  module Rails
  	##open class 打開類在module寫入attr_accessor

    class << self
      attr_accessor :configuration
    end
    
    def self.configure
      self.configuration ||= Configuration.new
      yield(configuration)  
    end 	
  end
end
