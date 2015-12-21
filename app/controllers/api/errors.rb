module API
  module Errors
    extend ActiveSupport::Concern

    included do
      rescue_from :all do |e|
        error!({ type: e.class.name, message: e.message },
          500, { 'Content-Type' => 'text/error' })
      end
    end
  end
end
