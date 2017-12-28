logg %(Ensuring dotfiles...)

dotfiles_path   = Home.path.join('.dotfiles')
dotfiles_binary = dotfiles_path.join('bin/dotfiles')
macos_binary    = dotfiles_path.join('bin/macos')

git dotfiles_path.to_s do
  repository 'https://github.com/halo/dotfiles.git'
  action :sync
  only_if { online? }
end

logg %(Updating dotfiles...)
bash 'run-dotfiles' do
  code dotfiles_binary.to_s
  only_if { dotfiles_binary.exist? }
end

logg %(Configuring macOS...)
bash 'run-macos' do
  code macos_binary.to_s
  only_if { macos_binary.exist? }
end
