module UsersHelper
  def business_choices
    User::BUSINESS.map do |business|
      [ t(".#{business}"), business ]
    end
  end
end
