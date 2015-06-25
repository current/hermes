module Public
  extend ActiveSupport::Concern

  included do
    layout 'public'
  end
end
