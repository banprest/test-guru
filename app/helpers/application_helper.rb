module ApplicationHelper
  
  def current_year
    Time.new.year
  end

  def github_url(author, repo)
    link_to "#{author} #{repo} ", 'https://github.com/banprest/test-guru'
  end
end
