default[:biosphere][:rbenv][:root]       = File.join(ENV['BIOSPHERE_SPHERE_PATH'], 'rbenv')
default[:biosphere][:rbenv][:rubies]     = %w{ 2.0.0-p247 }

if %w{ red blue }.include? ENV['BIOSPHERE_ENV_PROFILE']
  default[:biosphere][:rbenv][:rubies] += %w{

  }
end
