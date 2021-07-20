module ScoreCalculator

    attr_reader :score

    def calcuate_score(attempt)

        score = 0

        attempt.attempt_answer each do
        
            if attempt.attempt_answer.user_answer = attempt.attempt_answer.test_question.answer
                score = score + 1
            else
                score = score - 0.25

            end
        end

        return score
        

    end



end
