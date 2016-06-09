default[:cask][:caskroom] = File.join(ENV['BIOSPHERE_SPHERE_PATH'], 'caskroom')
default[:cask][:applinks] = Home.path.join('Applications')  # File.join(ENV['BIOSPHERE_SPHERE_PATH'], 'caskapps')

default[:cask][:apps] = %w{
  cyberduck
  disk-inventory-x
  firefox
  google-chrome
  mumble
}

# virtualbox (sudo)
# textmate (sudo)
# teamviewer (sudo)

if %w{ orange green blue }.include? ENV['BIOSPHERE_ENV_PROFILE']
  default[:cask][:apps] += %w{
    flux
    arrsync
    seashore
    quicksilver
  }
end

if %w{ blue }.include? ENV['BIOSPHERE_ENV_PROFILE']
  default[:cask][:apps] += %w{
    adium
  }
end
