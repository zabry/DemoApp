require 'rails_helper'

RSpec.describe "Api::V1::Subjects", type: :request do
  describe "GET /index" do
    let!(:board) {create(:board)}
    let!(:classroom) {create(:classroom, board_id: board.id)}
    let!(:subject) {create_list(:subject, 10, classroom_id: classroom.id)}
    let!(:user) { create(:user, board_id: board.id, classroom_id: classroom.id) }
    let!(:headers){valid_headers}


  describe "GET /index" do
    before {get "/api/v1/classrooms/#{classroom.id}/subjects", params: {}, headers: headers}

    it 'returns the boards' do
      expect(JSON.parse(response.body)).not_to be_empty
      ##puts JSON.parse(response.body)
    end
    
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  
  end

  def valid_headers
    {
      "token" => "f57440dadcba99db0498"
    }
  end
  end
end
