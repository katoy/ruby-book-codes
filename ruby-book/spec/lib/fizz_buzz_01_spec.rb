require './spec/spec_helper'
require './lib/fizz_buzz'

RSpec.describe 'fizz_buzz' do
  subject{fizz_buzz(arg)}
  context 'arg is' do
    context '1' do
      let(:arg){1}
      it{is_expected.to eq '1'}
    end
  end

  context 'arg_1 is' do
    [1, 2, 3, 5, 15].each do |x|
      context "#{x}" do
        let(:arg){x}
        let(:expect_ret) do
          case x
          when 15
            'FizzBuzz'
          when 3
            'Fizz'
          when 5
            'Buzz'
          else
            x.to_s
          end
        end

        it{is_expected.to eq expect_ret}
      end
    end
  end
end
