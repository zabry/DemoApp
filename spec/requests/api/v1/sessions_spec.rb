require 'rails_helper'

RSpec.describe "Api::V1::Sessions", type: :request do

    describe "Generaate token and send it" do

        let!(:user) { create(:user) }
    
      
        context 'when request attributes are valid' do
          before { post "/api/v1/sessions", params: {mobile: user.mobile, one_time_password: user.one_time_password} }
    
          it 'returns status code 200' do
            expect(response).to have_http_status(201)
          end
  
          it 'generates token' do
            up_user = User.find_by_id(user.id)
            expect(up_user.authentication_token).not_to match(user.authentication_token)
            #puts up_user.authentication_token
            expect((JSON.parse(response.body))['authentication_token']).not_to be_empty
          end
  
        end

        context 'when request attributes are invalid' do
            before { post "/api/v1/sessions", params: {mobile: user.mobile, one_time_password: "4545"} }
      
            it 'returns status code 200' do
              expect(response).to have_http_status(401)
            end
    
            it ' does not generate new token' do
              up_user = User.find_by_id(user.id)
              expect(up_user.authentication_token).to match(user.authentication_token)
              #puts up_user.authentication_token

            end
    
          end
      end
end