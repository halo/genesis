if offline?
  logg(%{Skipping installation of <b>homebrew</b> because I'm not online.}) { color :yellow }
else
  logg %{Ensuring X-Code Command line tools...}
  bash 'ensure-xcode-clt' do
    code 'xcode-select --install; echo "This command never fails :)"'
  end

  logg %{Ensuring correct homebrew revision...}
  git Homebrew.path.to_s do
    repository 'https://github.com/mxcl/homebrew.git'
    revision node[:homebrew][:revision]
    action :sync
  end

  if Homebrew.executable_path.executable?
    current_taps = `#{Homebrew.executable_path} tap`.split
    wanted_taps = %w{ phinze/cask }

    wanted_taps.each do |tap|
      if current_taps.include? tap
        logg(%{Skipping tapping homebrew into <b>#{tap}</b> because it's already tapped...}) { color :yellow }
      else
        logg %{Tapping homebrew into <b>#{tap}</b>...}
        bash "tap-#{tap}" do
          code "#{Homebrew.executable_path} tap #{tap}"
        end
      end
    end
  end

end

node[:homebrew][:formulae].each do |formula|

  formula_path = Homebrew.path.join "Cellar/#{formula.split.first}"

  if formula_path.exist?
    logg(%{Skipping configuration of <b>#{formula}</b> via homebrew because it already exists.}) { color :yellow }

    if node[:homebrew][:edge_formulae].include?(formula)
      if offline?
        logg(%{Skipping cutting-edge upgrade of formula <b>#{formula}</b> because I'm not online.}) { color :yellow }
      else
        logg %{Ensuring cutting-edge #{formula} via homebrew...}
        bash "upgrade-#{formula}" do
          code "#{Homebrew.executable_path} upgrade #{formula} 2>&1 | grep 'already installed'"
        end
      end
    end
  else
    if offline?
      logg(%{Skipping installation of formula <b>#{formula}</b> because I'm not online.}) { color :yellow }
    else
      logg %{Installing #{formula} via homebrew...}
      bash "install-homebrew-#{formula}" do
        code "#{Homebrew.executable_path} install #{formula}"
      end
    end
  end

end

