def first_anagram?(word1, word2)
  word1.chars.permutation.to_a.map { |el| el.join }.include?(word2)
end

def second_anagram?(word1, word2)
  word1_arr = nil
  word2_arr = nil
  word1.each_char.with_index do |chr, idx|
    return false if word2.index(chr).nil?
    if word2.index(chr) == idx 
      word1_arr = word1.chars.delete_at(idx)
      word2_arr = word2.chars.delete_at(idx)
    end
  end
  !word2_arr.empty?
end

def third_anagram?(word1, word2)
  word1.chars.sort == word2.chars.sort
end

def fourth_anagram?(word1, word2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  
  word1.each_char { |ch| hash1[ch] += 1 } 
  word2.each_char { |ch| hash2[ch] += 1 }
  
  hash1.map { |k, v| return false unless hash2.has_key?(k) || hash2[k] == v }
  true
end

def fifth_anagram?(word1, word2)
  hsh = Hash.new(0)
  
  word1.each_char { |ch| hsh[ch] += 1 }  
  values_arr = hsh.values
  word2.each_char { |ch| hsh[ch] += 1 }
  
  values2_arr = hsh.values
  values2_arr == values_arr.map { |el| el * 2 }
end