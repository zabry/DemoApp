require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do

    let!(:board) {create(:board)}
    let!(:classroom) {create(:classroom, board_id: board.id)}
    let!(:subject) {create(:subject, classroom_id: classroom.id)}
    let!(:chapter) {create(:chapter, subject_id: subject.id)}
    let!(:reposoitory) {create(:reposoitory, chapter_id: chapter.id)}
    
    let!(:test_module) { create(:test_module, chapter_id: chapter.id) }
    let!(:test_question) { create(:test_question, test_module_id: test_module.id) }


    describe "POST/ New User Signup" do

      let(:valid_attributes) { {  name: "Username", email: "email@email", dob: "21-01-2021", mobile: "915" } }
  
        context 'when request attributes are valid' do
            before { post "/api/v1/users", params: valid_attributes }

            it 'returns status code 201' do
              expect(response).to have_http_status(201)
            end

            it 'creates a user' do
              expect((JSON.parse(response.body))['name']).to match("Username")
            end
          end

          context 'when an invalid request' do
            before { post "/api/v1/users", params: { name: "Username" } }

            it 'returns status code 422' do
                expect(response).to have_http_status(422)
              end
          end

    end

    describe "UPDATE/User with Board and classroom choice Answers" do

      let!(:user) { create(:user) }
      let!(:headers){valid_headers}
      ## let(:valid_attributes) { {  board_id: board.id, classroom_id:classroom.id } }
      let(:valid_attributes) { {  board_id: board.id, classroom_id: classroom.id } }
  
    
      context 'when request attributes are valid' do
        before { put "/api/v1/users/#{user.id}", params: valid_attributes, headers: headers }
  
        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end

        it 'updates board' do
          expect((JSON.parse(response.body))['board_id']).to match(board.id)
        end

        it 'updates class' do
          expect((JSON.parse(response.body))['classroom_id']).to match(classroom.id)
        end
      end
    end

    describe "Update OTP in user table" do

      let!(:user) { create(:user) }
  
    
      context 'when request attributes are valid' do
        before { put "/api/v1/users/sendotp", params: {mobile: user.mobile} }
  
        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end

        it 'updates OTP' do
          up_user = User.find_by_id(user.id)
          expect(up_user.one_time_password).not_to match(user.one_time_password)
          ##puts up_user.one_time_password
        end

        it 'updates OTP Expiration' do
          up_user = User.find_by_id(user.id)
          expect(up_user.otp_expires_at).not_to match(user.otp_expires_at)
          ##puts up_user.otp_expires_at
        end
      end
    end



      def valid_headers
        {
          "token" => "f57440dadcba99db0498"
        }
      end



end
