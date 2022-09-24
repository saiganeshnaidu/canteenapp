module ErrorMessagesHelper
    def check_errors(user_model, attribute)
        user_model.errors.include?(attribute)
      end
    
      def check_valid(user_model, attribute, invalid)
        render 'shared/alerts', user_model: user_model, attribute: attribute if invalid
      end
end