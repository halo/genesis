default[:rbenv][:root] = Home.path.join('.rbenv').to_s

# For valid versions see https://github.com/rbenv/ruby-build/tree/master/share/ruby-build
# Not all may yet be available in homebrew yet, double-check with `rbenv install --list`
default[:rbenv][:rubies] = %w[2.6.3]
