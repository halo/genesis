module Github
  def self.subdomain
    result = ENV['BIOSPHERE_ENV_GITHUB_SUBDOMAIN'].to_s
    result == '' ? nil : result
  end

  def self.host
    if subdomain
      "#{subdomain}.github.com"
    else
      'github.com'
    end
  end
end
