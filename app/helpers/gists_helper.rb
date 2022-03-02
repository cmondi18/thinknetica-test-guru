module GistsHelper
  def get_short_question(question)
    question[0, 25]
  end

  def gist_hash(url)
    url.split('/')[-1]
  end
end