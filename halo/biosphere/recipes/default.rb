logg(%{Cookbook <b>biosphere</b> started...}) { color :magenta }

include_recipe 'augmentations'
include_recipe 'dotfiles'
include_recipe 'homebrew'
include_recipe 'rbenv'
include_recipe 'casks'

bash 'success-notification' do
  code %(osascript -e 'display notification "Chef Run Successful" with title "Biosphere"')
end

logg(%{Cookbook <b>biosphere</b> finished.}) { color :magenta }
