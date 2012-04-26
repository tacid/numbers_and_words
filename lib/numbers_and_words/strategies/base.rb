module NumbersAndWords
  module Strategies
    class Base
      attr_accessor :figures, :words

      def self.factory
        locale = I18n.locale.to_s.titleize
        # link cyrillic locales to Ru
        locale = "Ru" if [:ru, :uk].include?(I18n.locale)
        "NumbersAndWords::Strategies::#{locale}".constantize.new
      end
    end
  end
end
