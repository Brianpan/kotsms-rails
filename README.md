# Kotsms::Rails
簡訊王http 簡訊傳送服務串接
透過rest-client的簡單實踐

## Installation


```ruby
gem 'kotsms-rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kotsms-rails

## 使用方式

###建立initializer 檔案
```ruby
Kotsms::Rails.configure do |config|
  #簡訊王帳號
  config.smsmessage_account = Figaro.env.smsmessage_account
  #簡訊王密碼
  config.smsmessage_password = Figaro.env.smsmessage_password
  #簡訊王api 位置
  config.kotsms_url = Figaro.env.kotsms_url
end 
```

###呼叫方式
```ruby
 #deal 是一個hash要包含
 #phone : 09開頭的手機號碼
 #message : 想要傳送的訊息
 options = {phone: "0910000000", message: "hello"}
 sms = Kotsms::::Message.new(options)
 callback_status = sms.send_sms
```
