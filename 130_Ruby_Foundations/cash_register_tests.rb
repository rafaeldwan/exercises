# require 'simplecov'
# SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require "stringio"

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(500)
    @transaction = Transaction.new(30)
    @transaction.amount_paid = 50
  end
  
  def test_accept_money
    assert_equal 500, @register.total_money
    @register.accept_money(@transaction)
    assert_equal 550, @register.total_money
  end
  
  def test_change
    assert_equal 20, @register.change(@transaction)
  end
  
  def test_give_receipt
    assert_output("You've paid $30.\n") { @register.give_receipt(@transaction) }
  end
  
  def silenced
    $stdout = StringIO.new
    yield
  ensure
    $stdout = STDOUT
  end
  
  def test_prompt_for_payment
    @transaction.amount_paid = 0
    io = StringIO.new('30')
    silenced do
      @transaction.prompt_for_payment(input: io)
    end
    assert_equal 30, @transaction.amount_paid
  end
end
