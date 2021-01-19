class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(:access_token => ENV['GIT_TOKEN'])
  end

  def call
    @client.create_gist(gist_params)
  end

  def gist_success?
    @client.last_response.status == 201
    #@client.last_response.status == 200 || 201 возврощает 201, 201 || 200 true
    #@client.last_response == 200 || 201 почему воврощает любое число которое идет после ||

  end


  private

  def gist_params
    {
      description: I18n.t('gist_question_service.description', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:variant)
    content.join("\n")
  end
end
