module HeaderHelper
  def question_header(question)
    return "Create #{question.test.title} New Question" if question.new_record?

    "Edit #{question.test.title} Question"
  end
end
