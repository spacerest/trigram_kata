require 'trigram'
require 'spec_helper'

describe Trigram do
let (:trigram){ Trigram.new }

  it 'returns a three word string as a single hash entry do' do
    trigram.text_reader("hello my friend")
    expect(trigram.read_dictionary("hello my")).to eq "friend"
  end

  it 'returns a word when its the only option' do
    trigram.text_reader("hello my friend")
    expect(trigram.text_emitter("hello my")).to eq "hello my friend"
  end 

  it 'uses subsequent two words to find a third' do
    trigram.text_reader("hello my friend you")
    expect(trigram.text_emitter("hello my")).to eq "hello my friend you"
  end 

  it 'uses subsequent two words to find a fourth' do
    trigram.text_reader("hello my friend you goof")
    expect(trigram.text_emitter("hello my")).to eq "hello my friend you goof"
  end

end
