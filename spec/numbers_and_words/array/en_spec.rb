require 'spec_helper'

#TODO: write more readable tests

describe Array do
  around(:each) { |example| I18n.with_locale(:en) { example.run } }
  
  describe 'to_words' do
    context 'simple example' do
      subject { [1, 2, 3] }
      its(:to_words) { should == 3.times.map { |number| t(:ones)[number + 1] } }
    end

    context 'complex example' do
      subject { [101, 21, 13] }

      its(:to_words) { should == [
        [t(:ones)[1], t(:hundreds), t(:ones)[1]].join(' '),
        [t(:tens)[2], t(:ones)[1]].join('-'),
        t(:teens)[3]
      ] }
    end
  end
end
