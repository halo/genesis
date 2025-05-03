# The end-user cannot run the dotfiles after Genesis, because `ruby` is not in the terminal PATH.
# It is the dotfiles, that add ruby to the PATH, so we have a chicken-egg problem.
# Here in chef, knowing the path to ruby, we can run the dotfiles once, to kickstart them.

if Genesis.users.any?(&:opinionated?)
  Genesis.users do |account| # rubocop:disable Metrics/BlockLength
    dotfiles_binary = account.paths.dotfiles.join('bin/dotfiles')
    bundle_config_path = account.paths.dotfiles.join('.bundle')
    bundle_config_file = bundle_config_path.join('config')
    vendor_bundle = account.paths.dotfiles.join('vendor/bundle')
    macos_binary = account.paths.dotfiles.join('macos/bin/macos')
    rbenv_executable = ::Homebrew.bin_path.join('rbenv') # rubocop:disable Style/RedundantConstantBase
    ruby_version = node[:rbenv][:ruby]
    rbenv_init = %|eval "$(#{rbenv_executable} init - zsh)"; #{rbenv_executable} shell #{ruby_version}|

    directory bundle_config_path.to_s do
      owner account.username
      group 'staff'
      mode '0755'
    end

    template bundle_config_file.to_s do
      source 'bundle_config.yml.erb'
      owner account.username
      group 'staff'
      mode '0644'
      variables(bundle_path: vendor_bundle)
      action :create
    end

    execute "run #{account.username} dotfiles" do
      cwd '/tmp' # Avoid trying to create `/Gemfile.lock` when another user.
      environment(lazy { { RBENV_ROOT: account.paths.rbenv.to_s, HOME: account.paths.home.to_s } })
      command %(#{rbenv_init}; #{dotfiles_binary})
      user account.username
      group 'staff'
      only_if { rbenv_executable.executable? }
    end

    if account.username == 'admin'
      execute "run #{account.username} root configuration" do
        environment(lazy do
          { RBENV_ROOT: account.paths.rbenv.to_s,
            HOME: account.paths.home.to_s }
        end)
        command %(#{rbenv_init}; #{macos_binary} --only-sudo)
        only_if { rbenv_executable.executable? }
      end
    end
  end
end
