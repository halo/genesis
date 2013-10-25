default[:biosphere][:rbenv][:rubies] = %w{ 2.0.0-p247 }

if %w{ red blue }.include? ENV['BIOSPHERE_ENV_PROFILE']
  default[:biosphere][:homebrew][:formulae] += %w{
    1.9.3-p448
  }
end
