default[:biosphere][:osx][:settings] = %{

  Hidden Settings -> Window open/close Animations -> Off
  defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

  Hidden Settings -> Window resize speed -> Fast
  defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

  Hidden Settings -> Sidebar Icon Size -> Medium
  defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

  Hidden Settings -> Save Panel -> Expand by default
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

  Hidden Settings -> Print Panel -> Expand by default
  defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

  Hidden Settings -> Document saving -> To disk, not iCloud
  defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

  Hidden Settings -> Printing -> Quit printer when jobs complete
  defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

  Hidden Settings -> Are you sure you want to open this application? -> Disable
  defaults write com.apple.LaunchServices LSQuarantine -bool false

  Hidden Settings -> ASCII control characters using caret notation in standard text views -> Show
  defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

  Hidden Settings -> Resume Windows after restart -> Never ask about it
  defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

  Hidden Settings -> Automatic termination of inactive apps -> Never terminate them
  defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

  Hidden Settings -> Restart automatically if the computer freezes -> Yes
  systemsetup -setrestartfreeze on

  Hidden Settings -> Computer sleep mode -> Never
  systemsetup -setcomputersleep Off > /dev/null

  Hidden Settings -> Keyboard access in Modals -> Yes
  defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

  Hidden Settings -> Keyboard repeat rate -> Blazingly Fast
  defaults write NSGlobalDomain KeyRepeat -int 0

  Hidden Settings -> Keyboard illumination -> Turn off after 5 min of inactivity
  defaults write com.apple.BezelServices kDimTime -int 300

  Hidden Settings -> Bluetooth headphones/headsets -> Increase quality
  defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

  Hidden Settings -> Automatic spelling correction -> Disable
  defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

  System Preferences -> General -> Appearance -> Blue
  defaults write NSGlobalDomain AppleAquaColorVariant -int 1

  System Preferences -> General -> Appearance -> Highlight Color -> Green
  defaults write NSGlobalDomain AppleHighlightColor -string "0.764700 0.976500 0.568600"

  Menu Bar -> Battery -> Show Percentage -> Yes
  defaults write com.apple.menuextra.battery ShowPercent -string "YES"

  Applications -> MailUnreadMenu -> Double-click to bring Mail to front -> Yes
  defaults write doubleClickMenuItemToBringMailToFront -int 1

  Applications -> Crash Reporter -> Disable
  defaults write com.apple.CrashReporter DialogType -string "none"

  Applications -> Help Viewer -> Non-floating Windows
  defaults write com.apple.helpviewer DevMode -bool true

  Applications -> Notification Center -> Begone
  launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null

  Applications -> Screen Capture -> Saving location -> Desktop
  defaults write com.apple.screencapture location -string "${HOME}/Desktop"

  Applications -> Screen Capture -> Format -> PNG
  defaults write com.apple.screencapture type -string "png"

  Applications -> Screen Capture -> Window Shadows -> Disable
  defaults write com.apple.screencapture disable-shadow -bool true

  Applications -> Finder -> Allow quitting with CMD+Q
  defaults write com.apple.finder QuitMenuItem -bool true

  Applications -> Finder -> Hard drives on Desktop -> Show
  defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

  Applications -> Finder -> Remote servers on Desktop -> Hide
  defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

  Applications -> Finder -> External drives on Desktop -> Show
  defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

  Applications -> Finder -> Status Bar -> Show
  defaults write com.apple.finder ShowStatusBar -bool true


}

if %w{ red blue }.include? ENV['BIOSPHERE_ENV_PROFILE']
  default[:biosphere][:osx][:settings] += %{

    System Preferences -> General -> Show Scrollbars -> When scrolling
    defaults write NSGlobalDomain AppleSchowScrollBars -string WhenScrolling

    Hidden Settings -> HDD Sudden motion sensor -> Disable
    sudo pmset -a sms 0

  }
end

if %w{ green }.include? ENV['BIOSPHERE_ENV_PROFILE']
  default[:biosphere][:osx][:settings] += %{

    System Preferences -> General -> Show Scrollbars -> Always
    defaults write NSGlobalDomain AppleSchowScrollBars -string Always

    Hidden Settings -> HDD Sudden motion sensor -> Enable
    sudo pmset -a sms 1

  }
end
