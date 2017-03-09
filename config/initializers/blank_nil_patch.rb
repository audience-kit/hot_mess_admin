class Hash
  def nilify_blanks
    hash = self.dup

    hash.each do |k,v|
      hash[k] = nil if v.blank?
    end

    hash
  end
end