##open class for hash
class Hash
  ##轉換sym to string in hash key	
  def stringify_keys
    result = self.class.new
    each_key do |key|
      result[key.to_s] = self[key]
    end

    result	
  end	
end	