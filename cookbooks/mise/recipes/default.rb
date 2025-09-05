Genesis.users do |account|
  next unless account.opinionated?

  mise_executable = ::Homebrew.bin_path.join('mise') # rubocop:disable Style/RedundantConstantBase

  execute "install ruby for #{account.username}" do
    command "#{mise_executable} use --global ruby@latest"
    creates account.paths.mise.join('installs/ruby/latest/bin').to_s
    user account.username
    group 'staff'
    environment({ 'RUBY_CONFIGURE_OPTS' => '--with-libyaml-dir=/opt/homebrew/opt/libyaml' })
    only_if { mise_executable.executable? }
  end
end
