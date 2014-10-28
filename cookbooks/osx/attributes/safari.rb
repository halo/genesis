default[:osx][:settings] += %{

  Set home page to `about:blank` for faster loading
  defaults write com.apple.Safari HomePage -string "about:blank"

  Allow hitting the Backspace key to go to the previous page in history
  defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

  Disable thumbnail cache for History and Top Sites
  defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

  Enable debug menu
  defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

  Make search banners default to Contains instead of Starts With
  defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

  Developer Menu
  defaults write com.apple.Safari IncludeDevelopMenu -bool true

  Webkit Developer Extras
  defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true

  Webkit2 Developer Extras
  defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

  Add a context menu item for showing the Web Inspector in web views
  defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

  Privacy: don’t send search queries to Apple
  defaults write com.apple.Safari UniversalSearchEnabled -bool false

  Show the full URL in the address bar (note: this still hides the scheme)
  defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

}
