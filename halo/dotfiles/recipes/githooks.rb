if offline?
  logg(%{Skipping installation of <b>githooks</b> because I'm not online.}) { color :yellow }
else

  logg %{Ensuring githooks...}
  git Home.path.join('.githooks').to_s do
    repository 'https://github.com/halo/githooks.git'
    action :sync
  end

end
