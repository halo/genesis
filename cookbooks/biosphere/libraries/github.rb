module Github
  def self.host
    ENV['BIOSPHERE_ENV_GITHUB_SUBDOMAIN'].to_s + 'github.com'
  end
end
