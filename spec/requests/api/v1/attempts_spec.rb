require 'rails_helper'

RSpec.describe "Attempts", type: :request do

    let!(:board) {create(:board)}
    let!(:classroom) {create(:classroom, board_id: board.id)}
    let!(:subject) {create(:subject, classroom_id: classroom.id)}
    let!(:chapter) {create(:chapter, subject_id: subject.id)}
    let!(:reposoitory) {create(:reposoitory, chapter_id: chapter.id)}
    let!(:user) { create(:user, board_id: board.id, classroom_id: classroom.id) }
    let!(:test_module) { create(:test_module, chapter_id: chapter.id) }
    let!(:test_question) { create(:test_question, test_module_id: test_module.id) }
    let!(:attempt) { create(:attempt, test_module_id: test_module.id, user_id: user.id) }
    let!(:attempt_answer) { create(:attempt_answer, attempt_id: attempt.id, test_question_id: test_question.id) }

    describe "POST/Attempts" do

      let(:valid_attributes) { {  test_module_id: test_module.id } }
      let!(:headers){valid_headers}
  
        context 'when request attributes are valid' do
            before { post "/api/v1/attempts/", params: valid_attributes, headers: headers }

            it 'returns status code 201' do
              expect(response).to have_http_status(201)
            end
          end

          context 'when an invalid request' do
            before { post "/api/v1/attempts/", params: {}, headers: headers }

            it 'returns status code 422' do
                expect(response).to have_http_status(422)
              end
          end

    end

    describe "PUT/Attempts" do

      let(:valid_attributes) { {  test_module_id: test_module.id } }
      let!(:headers){valid_headers}
  
        context 'when request attributes are valid' do
            before { put "/api/v1/attempts/#{attempt.id}", params: valid_attributes, headers: headers }

            it 'returns status code 201' do
              expect(response).to have_http_status(200)
            end
          end

          context 'when an invalid request' do
            before { put "/api/v1/attempts/#{attempt.id}", params: {},  headers: invalid_headers }

            it 'returns status code 422' do
                expect(response).to have_http_status(401)
              end
          end

    end
  
end
