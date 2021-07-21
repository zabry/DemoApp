module ScoreCalculator 
    #extend ActiveSupport::Concern

    attr_reader :score

    def calcuate_score(attempt)

        score = 0

        attempt.attempt_answers.each do |n|
        
            if n.user_answer = n.test_question.answer
                score = score + 1
            else
                score = score - 0.25

            end
        end

        return score
        

    end



end
