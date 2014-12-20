User.create(username: "mark", pw_hash: "pw", email: "mark.francis.reid@gmail.com")
survey = Survey.create(title: "chickens", user_id: 1)
Question.create(query: "what's 1 + 1?", survey_id: 1)
Question.create(query: "who was the first president of Mozambique?", survey_id: 1)
Question.create(query: "what continent is Jumanji in?", survey_id: 1)
Question.create(query: "how old would Caesar be today?", survey_id: 1)
Question.create(query: "spell chickens.", survey_id: 1)
Answer.create(response: "2", question_id: 1)
Answer.create(response: "Francis Reed", question_id: 2)
Answer.create(response: "Canada", question_id: 3)
Answer.create(response: "12345", question_id: 4)
Answer.create(response: "chikins", question_id: 5)

vote_count = rand(100)
vote_count.times do
  survey.votes.create(value: 1)
end
