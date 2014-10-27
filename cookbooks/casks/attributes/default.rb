default[:cask][:caskroom] = File.join(ENV['BIOSPHERE_SPHERE_PATH'], 'caskroom')
default[:cask][:applinks] = Home.path.join('Applications')  # File.join(ENV['BIOSPHERE_SPHERE_PATH'], 'caskapps')

default[:cask][:apps] = %w{
  cyberduck
  disk-inventory-x
  firefox
  google-chrome
  keka
  mumble
  teamviewer
  textmate
  vienna-rss
}

if %w{ orange blue }.include? ENV['BIOSPHERE_ENV_PROFILE']
  default[:cask][:apps] += %w{
    seashore
    sequel-pro
  }
end

if %w{ red }.include? ENV['BIOSPHERE_ENV_PROFILE']
  default[:cask][:apps] += %w{
    handbrake
    handbrakebatch
    keyremap4macbook
    soundflower
  }
end

if %w{ blue }.include? ENV['BIOSPHERE_ENV_PROFILE']
  default[:cask][:apps] += %w{
    adium
  }
end
