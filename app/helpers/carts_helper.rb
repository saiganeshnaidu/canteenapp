module CartsHelper
    def validate_employee?
        if employee? && Current.user.employee_profile && Current.user.employee_profile.isapproved
            true
        elsif employee? && Current.user.employee_profile && !(Current.user.employee_profile.isapproved)
            false
        end
    end

    def validate_customer?
        if customer? && Current.user.normal_customer && Current.user.normal_customer.isapproved
            true
        elsif customer? && Current.user.normal_customer && !(Current.user.normal_customer.isapproved)
            false
        end
    end

    def validate_chef?
        if chef? && Current.user.chef_profile && Current.user.chef_profile.isapproved
            true
        elsif chef? && Current.user.chef_profile && !(Current.user.chef_profile.isapproved)
            false
        end
    end

    def set_validated_user
        if validate_employee?
            @cur_validated_user=Current.user.employee_profile.isapproved
        elsif validate_chef?
            @cur_validated_user=Current.user.chef_profile.isapproved
        elsif validate_customer?

            @cur_validated_user=Current.user.normal_customer.isapproved

        end
    end
    
end
