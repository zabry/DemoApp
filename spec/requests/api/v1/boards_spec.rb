require 'rails_helper'

RSpec.describe "Api::V1::Boards", type: :request do

  let!(:board) {create_list(:board, 10)}
  let!(:board_id){board.first.id}
  let!(:headers){valid_headers}
  let!(:classroom) {create(:classroom, board_id: board_id)}
  let!(:user) { create(:user, board_id: board_id, classroom_id: classroom.id) }
  ##let!(:user) { create(:user, board_id: board_id)}
  
  describe "GET /index" do

    before {get "/api/v1/boards", params: {}, headers: headers}

    it 'returns the boards' do
      expect(JSON.parse(response.body)).not_to be_empty
    end
    
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
    
  end

end
