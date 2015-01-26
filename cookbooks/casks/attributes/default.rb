default[:cask][:caskroom] = File.join(ENV['BIOSPHERE_SPHERE_PATH'], 'caskroom')
default[:cask][:applinks] = Home.path.join('Applications')  # File.join(ENV['BIOSPHERE_SPHERE_PATH'], 'caskapps')

default[:cask][:apps] = %w{
  cyberduck
  disk-inventory-x
  firefox
  google-chrome
  keka
  mumble
  textmate
  vlc
}

#teamviewer (sudo)
#arrsync (broken)

if %w{ orange green blue }.include? ENV['BIOSPHERE_ENV_PROFILE']
  default[:cask][:apps] += %w{
    flux
  }
end

if %w{ orange blue }.include? ENV['BIOSPHERE_ENV_PROFILE']
  default[:cask][:apps] += %w{
    seashore
    sequel-pro
    quicksilver
  }
end

# karabiner (sudo)

if %w{ blue }.include? ENV['BIOSPHERE_ENV_PROFILE']
  default[:cask][:apps] += %w{
    adium
  }
end
