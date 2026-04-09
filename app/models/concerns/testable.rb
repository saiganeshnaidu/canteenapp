module Testable
  extend ActiveSupport::Concern

  included do
    # any code that you want inside the class
    # that includes this concern
      validates_presence_of :usertype

      def test_instance_method
        puts 'Instance method!!!!!!!!1'
      end
  end


  class_methods do
    def class_met_test
      puts 'class method!!!!!'
    end
  end
  # class_methods do
  #   # methods that you want to create as
  #   # class methods on the including class
  # end
end
