module API
  module V1
    class Test < Grape::API
      resource 'test' do
        desc 'test GET method'
        get 'hello' do
          'hello from Discounty GET'
        end

        desc 'test POST method'
        post 'hello' do
          'hello from Discounty POST'
        end
      end
    end
  end
end