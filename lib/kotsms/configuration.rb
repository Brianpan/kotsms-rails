module Kotsms
  class Configuration
    attr_accessor :smsmessage_account, :smsmessage_password, :kotsms_url

    def initialize
      @smsmessage_account = "app01"
      @smsmessage_password = "app01"
      @kotsms_url = "http://202.39.48.216/kotsmsapi-1.php"
    end	
  end	
end	