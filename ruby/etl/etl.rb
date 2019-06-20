class ETL
  def self.transform(hash)
    new_hash = {}

    hash.each do |k,v|
      v.each do |new_k|
        new_hash[new_k.downcase] = k
      end
    end

    new_hash
  end
end
