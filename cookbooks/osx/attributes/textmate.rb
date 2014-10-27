default[:osx][:settings] += %{

  Don't mess with my Tabs
  defaults write com.macromates.TextMate.preview disableTabReordering -bool YES

  Don't jump around in File Browser
  defaults write com.macromates.TextMate.preview autoRevealFile -bool NO

  Always wrap around search
  defaults write com.macromates.TextMate.preview findWrapAround -bool YES

  Tabs begin at the document window
  defaults write com.macromates.TextMate.preview tabsAboveDocument -bool YES

  Show file browser to the left
  defaults write com.macromates.TextMate.preview fileBrowserPlacement -string "left"

  Always show the tab bar
  defaults write com.macromates.TextMate.preview disableTabBarCollapsing -bool YES

}
