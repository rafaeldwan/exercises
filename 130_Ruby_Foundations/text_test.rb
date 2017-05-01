require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'text'
require 'irb'

puts "starting tests"

class TextTest < MiniTest::Test
  def setup
    @file = File.open('sample_text.txt')
    
  end
  
  def test_swap
    test_text = Text.new(@file.read)
    @file.rewind
    swappy = @file.read.gsub("a", "e")
    assert_equal swappy, test_text.swap("a", "e")
  end
  
  def test_word_count
    test_text = Text.new(@file.read)
    @file.rewind
    assert_equal @file.read.split.count, test_text.word_count
  end
  
  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end