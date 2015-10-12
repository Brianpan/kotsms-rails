require 'net/http'
require 'rest-client'
require 'json'
require 'cgi'

module Kotsms
  class SmsMessage
      
      ##need phone as params
      def initialize(options)
        ##from open class Hash
        options = options.stringify_keys
        if options["message"] && /09[0-9]{8}$/.match(options["phone"))
		    @account = {account: Kotsms::Rails.configuration.smsmessage_account, 
		    			password: Kotsms::Rails.configuration.smsmessage_password}     
		    message = options["message"]
		    @message = CGI.escape(message.encode('Big5'))

		    @phone = options["phone"]
		    @response = options["response"]
		else
		  raise ArgumentError.new("Wrong number of arguments")	
		end    
	  end

	  def send_sms
	  	sms_url = Kotsms::Rails.configuration.kotsms_url
	    sms_url = "#{sms_url}?username=#{@account[:account]}&password=#{@account[:password]}&dstaddr=#{@phone}&smbody=#{@message}&dlvtime=0"
	    # RestClient.get(sms_url,
	    #   params: {
	    #   	username: @account[:account],
	    #   	password: @account[:password],
	    #   	dstattr:  @phone,
	    #   	smbody: @message,
	    #   	dlvtime: 0
	    #   }
	    # )
	    response = RestClient.get(sms_url)
	    callback_status = response.body.split("=")[1].to_i > 0 ? 1 : 0 

	    callback_status
	  end 	
  end
end