# To avoid a chicken-egg problem, we run the dotfiles here with chef.
# Because `ruby` is not yet in the PATH, we cannot run the dotfiles.
# But the dotfiles give us ruby in the PATH.
# Only here can we fake the PATH.

if Genesis.users.any?(&:opinionated?)
  Genesis.users do |account|
    dotfiles_binary = account.paths.dotfiles.join('bin/dotfiles')
    macos_binary = account.paths.dotfiles.join('macos/bin/macos')
    rbenv_executable = Homebrew.bin_path.join('rbenv')
    ruby_version = node[:rbenv][:ruby]
    rbenv_init = %|eval "$(#{rbenv_executable} init - zsh)"; #{rbenv_executable} shell #{ruby_version}|

    execute "run #{account.username} dotfiles" do
      environment(lazy { { RBENV_ROOT: account.paths.rbenv.to_s, HOME: account.paths.home.to_s } })
      command %(#{rbenv_init}; #{dotfiles_binary})
      user account.username
      group 'staff'
      only_if { rbenv_executable.executable? }
    end

    if account.username == 'admin'
      execute "run #{account.username} root configuration" do
        environment(lazy { { RBENV_ROOT: account.paths.rbenv.to_s, HOME: account.paths.home.to_s } })
        command %(#{rbenv_init}; #{macos_binary} --only-sudo)
        only_if { rbenv_executable.executable? }
      end
    end
  end
end
