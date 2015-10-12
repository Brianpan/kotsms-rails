require 'spec_helper'

describe Kotsms::Rails do
  it 'has a version number' do
    expect(Kotsms::Rails::VERSION).not_to be nil
  end

  context "test for configure" do 

    it "test configure method" do 
      Kotsms::Rails.configure do |config|
        config.smsmessage_account = "carebest"
      end 
      
      expect(Kotsms::Rails.configuration.smsmessage_account).to eq("carebest")   

    end	
  end

  context "test for API function" do 
    before(:example) do 
      stub_const("Kotsms::Configuration", double)
      allow(Kotsms::Configuration).to receive_message_chain(:smsmessage_account){"12344"}
      allow(Kotsms::Configuration).to receive_message_chain(:smsmessage_password){"12344"}
      allow(Kotsms::Configuration).to receive_message_chain(:kotsms_url){"http://202.39.48.216/kotsmsapi-1.php"}
      
      
    end
    ##expect true for basic usage
    it "test for correct send_sms" do 
      Kotsms::Rails.configure do |config|
        config.smsmessage_account = "12345"
        config.smsmessage_password = "12345"
        config.kotsms_url = "http://202.39.48.216/kotsmsapi-1.php"
      end 

      options = {
      	"phone": "0975652213",
      	"message": "Hello World"
      }
      kotsms = Kotsms::SmsMessage.new(options)
      expect(kotsms.send_sms).to eq(0)
    end
    
    it "test if not correct" do
      Kotsms::Rails.configure do |config|
        config.smsmessage_account = "12345"
        config.smsmessage_password = "12345"
        config.kotsms_url = "http://202.39.48.216/kotsmsapi-1.php"
      end 
      options = {message: "Hello", phone: "0975652213"}
      expect{Kotsms::SmsMessage.new(options)}.to raise_error(ArgumentError)
    end

  end 	
end
