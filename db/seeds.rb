# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

5.times do

    board = Board.new(
        name: Faker::Educator.degree
    )

    board.save

    5.times do
        
        classroom_variable = Classroom.new(
        name: Faker::Educator.course_name,
        board_id: board.id
        )

        classroom_variable.save

        5.times do
            subject = Subject.new(
                name: Faker::Educator.subject,
                classroom_id: classroom_variable.id
            )
            subject.save


            4.times do
                chapter = Chapter.new(
                    name: Faker::Educator.secondary_school,
                    subject_id: subject.id
                )
                chapter.save

                2.times do

                    reposoitory = Reposoitory.new(
                        name: Faker::Movies::HarryPotter.character,
                        filepath: Faker::Movies::HarryPotter.quote,
                        chapter_id: chapter.id
                    )

                    reposoitory.save

                    test_module = TestModule.new(
                        name: Faker::Movies::HarryPotter.character,
                        chapter_id: chapter.id,
                        time_taken: Faker::Number.number(digits: 2),
                        no_of_qns: Faker::Number.number(digits: 2)
                    )

                    test_module.save

                    5.times do
                        test_question = TestQuestion.new(
                            test_module_id: test_module.id,
                            question: Faker::Company.name,
                            choice1: Faker::Science.scientist,
                            choice2: Faker::Science.scientist,
                            choice3: Faker::Science.scientist,
                            choice4: Faker::Science.scientist,
                            answer: :choice1
                        )

                        test_question.save
                    end
                
                end
            
            end
        end

    end

    uservariable = User.new(
        name: Faker::Internet.username,
        dob: Faker::Date.in_date_period,
        email: Faker::Internet.email,
        mobile: Faker::Number.number(digits: 3),
        board_id: board.id
    )

    uservariable.save

end

