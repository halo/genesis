if offline?
  logg(%{Skipping installation of <b>dotfiles</b> because I'm not online.}) { color :yellow }
else

  logg %{Ensuring dotfiles...}
  git Home.path.join('.dotfiles').to_s do
    repository 'https://github.com/halo/dotfiles.git'
    action :sync
  end

  logg %{Updating dotfiles...}
  bash 'run-dotfiles' do
    code Home.path.join('.dotfiles/bin/dotfiles').to_s
  end

  logg %{Configuring macOS...}
  bash 'run-macos' do
    code Home.path.join('.dotfiles/bin/macos').to_s
  end

end
