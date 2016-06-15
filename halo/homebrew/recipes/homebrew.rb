if offline?
  logg(%{Skipping installation of <b>homebrew</b> because I'm not online.}) { color :yellow }
else
  logg %{Ensuring X-Code Command line tools...}
  bash 'ensure-xcode-clt' do
    code 'xcode-select --install; echo "This command never fails :)"'
  end

  logg %{Ensuring correct homebrew revision...}
  git Homebrew.path.to_s do
    repository 'https://github.com/Homebrew/brew.git'
    # revision node[:homebrew][:revision]
    action :sync
  end

end

node[:homebrew][:formulae].each do |formula|

  formula_path = Homebrew.path.join "Cellar/#{formula.split.first}"

  if formula_path.exist?
    logg(%{Skipping installation of <b>#{formula}</b> via homebrew because it is already installed.}) { color :yellow }

    if node[:homebrew][:edge_formulae].include?(formula)
      if offline?
        logg(%{Skipping cutting-edge upgrade of formula <b>#{formula}</b> because I'm not online.}) { color :yellow }
      else
        logg %{Ensuring cutting-edge #{formula} via homebrew...}
        bash "upgrade-#{formula}" do
          code "#{Homebrew.executable_path} upgrade #{formula} 2>&1 | egrep 'already installed' > /dev/null"
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

