

class Trigram

  def initialize
    @text 
    @dictionary = Hash.new{ |hash, key| hash[key] = [] }
    @new_text
  end

  def text_reader(text)
    @text = text
    @text = @text.split(" ")
    @text.each_with_index { |key, i|
      if @text[i + 1] && @text[i + 2]  
	@reference = "#{key} #{@text[i + 1]}" 
        @dictionary[@reference] << @text[i + 2] 
      end
    }
  end

  def read_dictionary(lookup_key)
    @random_value = rand(@dictionary[lookup_key].length)
    @dictionary[lookup_key][@random_value]
  end

  def text_emitter(starter_words)
    @dyn_reference_words = starter_words
    @new_text = []
    @dyn_reference_words.split(" ").each { |i| @new_text << i }
    @new_text.each_index {|i|
      if @dictionary.has_key?(@dyn_reference_words) 
	@new_text << read_dictionary(@dyn_reference_words)
	@dyn_reference_words = @new_text[i+1..i+2].join(" ")
      else
	break
      end
    }
    @new_text.join(" ")
  end

end
