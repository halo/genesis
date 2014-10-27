# See http://mths.be/osx

default[:osx][:settings] = %{

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

  Hidden Settings -> Illuminate built-in MacBook keyboard in low light -> Yes
  defaults write com.apple.BezelServices kDim -bool true

  Hidden Settings -> Subpixel font rendering on non-Apple LCDs -> Enable
  defaults write NSGlobalDomain AppleFontSmoothing -int 2

  Menu Bar -> Choose which Icons to show
  defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/VPN.menu" "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" "/System/Library/CoreServices/Menu Extras/AirPort.menu" "/System/Library/CoreServices/Menu Extras/Battery.menu" "/System/Library/CoreServices/Menu Extras/Clock.menu"

  System Preferences -> General -> Appearance -> Blue
  defaults write NSGlobalDomain AppleAquaColorVariant -int 1

  System Preferences -> General -> Appearance -> Highlight Color -> Green
  defaults write NSGlobalDomain AppleHighlightColor -string "0.764700 0.976500 0.568600"

  System Preferences -> Trackpad -> Tap to click -> No
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false

  System Preferences -> Trackpad -> Secondary Click -> Two fingers
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -int 1

  System Preferences -> Security -> General -> Require password after sleep/saver -> 3 seconds
  defaults write com.apple.screensaver askForPasswordDelay -int 3

  System Preferences -> Hot Corners -> Top right -> Desktop
  defaults write com.apple.dock wvous-tr-corner -int 4

  System Preferences -> Hot Corners -> Top right -> Desktop
  defaults write com.apple.dock wvous-tr-modifier -int 0

  System Preferences -> Hot Corners -> Bottom left → Screen saver
  defaults write com.apple.dock wvous-bl-corner -int 5

  System Preferences -> Hot Corners -> Bottom left → Screen saver
  defaults write com.apple.dock wvous-bl-modifier -int 0

  System Preferences -> Hot Corners -> Bottom Right → Mission Control
  defaults write com.apple.dock wvous-br-corner -int 2

  System Preferences -> Hot Corners -> Bottom Right → Mission Control
  defaults write com.apple.dock wvous-br-modifier -int 0

  System Preferences -> Sound -> Don't play feedback when volume is changed
  defaults write NSGlobalDomain com.apple.sound.beep.feedback -int 0

  System Preferences -> Sound -> Disable UI audio
  defaults write NSGlobalDomain com.apple.sound.uiaudio.enabled -int 0

  Menu Bar -> Battery -> Show Percentage -> Yes
  defaults write com.apple.menuextra.battery ShowPercent -string "YES"

  Menu bar -> Clock -> Format
  defaults write com.apple.menuextra.clock DateFormat "EEE d. MMM  HH:mm"

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

  Applications -> Finder -> File Extensions -> Always show
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true

  Applications -> Finder -> View Type -> Columns
  defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

  Applications -> Finder -> Airdrop -> Enable on Ethernet
  defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

  Applications -> Finder -> Show on Desktop -> External Hard drives
  defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

  Applications -> Finder -> Show on Desktop -> Servers
  defaults write com.apple.finder ShowMountedServersOnDesktop -bool true

  Applications -> Finder -> Show on Desktop -> USB Sticks
  defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

  Applications -> Finder -> Hide from Desktop -> local Hard disks
  defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false

  Applications -> Finder -> Show path bar
  defaults write com.apple.finder ShowPathbar -bool true

  Applications -> Finder -> Allow text selection in Quick Look
  defaults write com.apple.finder QLEnableTextSelection -bool true

  Applications -> Finder -> Display full POSIX path as Finder window title
  defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

  Applications -> Finder -> Search the current folder by default
  defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

  Applications -> Finder -> Disable the warning when changing a file extension
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

  Applications -> Finder -> Enable spring loading for directories
  defaults write NSGlobalDomain com.apple.springing.enabled -bool true

  Applications -> Finder -> Remove spring loading delay for directories
  defaults write NSGlobalDomain com.apple.springing.delay -float 0

  Applications -> Finder -> Avoid creating .DS_Store files on network volumes
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

  Applications -> Dock -> Icon Size
  defaults write com.apple.dock tilesize -int 27

  Applications -> Dock -> Don't minimize windows into their icon, place them to the right
  defaults write com.apple.dock minimize-to-application -bool false

  Applications -> Dock -> Enable spring loading for all Dock items
  defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

  Applications -> Dock -> Show indicator lights for open applications in the Dock
  defaults write com.apple.dock show-process-indicators -bool true

  Applications -> Dock -> Don’t animate opening applications from the Dock
  defaults write com.apple.dock launchanim -bool false

  Applications -> Dock -> Remove the auto-hiding Dock delay
  defaults write com.apple.dock autohide-delay -float 0

  Applications -> Dock -> Remove the animation when hiding/showing the Dock
  defaults write com.apple.dock autohide-time-modifier -float 0

  Applications -> Dock -> Automatically hide and show the Dock
  defaults write com.apple.dock autohide -bool true

  Applications -> Dock -> Make Dock icons of hidden applications translucent
  defaults write com.apple.dock showhidden -bool true

  Applications -> Mission Control -> Speed up Mission Control animations
  defaults write com.apple.dock expose-animation-duration -float 0.1

  Applications -> Mission Control -> Don’t group windows by application in Mission Control
  defaults write com.apple.dock expose-group-by-app -bool false

  Applications -> Spaces -> Don’t automatically rearrange Spaces based on most recent use
  defaults write com.apple.dock mru-spaces -bool false

  Applications -> Dashboard -> Disable Dashboard
  defaults write com.apple.dashboard mcx-disabled -bool true

  Applications -> Dashboard -> Don’t show Dashboard as a Space
  defaults write com.apple.dock dashboard-in-overlay -bool true

  Applications -> Safari -> Set home page to `about:blank` for faster loading
  defaults write com.apple.Safari HomePage -string "about:blank"

  Applications -> Safari ->  Allow hitting the Backspace key to go to the previous page in history
  defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

  Applications -> Safari -> Disable thumbnail cache for History and Top Sites
  defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

  Applications -> Safari -> Enable debug menu
  defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

  Applications -> Safari -> Make search banners default to Contains instead of Starts With
  defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

  Applications -> Safari -> Developer Menu
  defaults write com.apple.Safari IncludeDevelopMenu -bool true

  Applications -> Safari -> Webkit Developer Extras
  defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true

  Applications -> Safari -> Webkit2 Developer Extras
  defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

  Applications -> Safari -> Add a context menu item for showing the Web Inspector in web views
  defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

  Applications -> Mail -> Disable Reply Animations
  defaults write com.apple.mail DisableReplyAnimations -bool true

  Applications -> Mail -> Disable Send Animations
  defaults write com.apple.mail DisableSendAnimations -bool true

  Applications -> Mail -> Disable inline attachments (just show the icons)
  defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

  Applications -> Terminal -> Use UTF-8
  defaults write com.apple.terminal StringEncodings -array 4

  Applications -> Time Machine -> Prevent Time Machine from prompting to use new hard drives as backup volume
  defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

  Applications -> TextEdit -> Open files as UTF-8
  defaults write com.apple.TextEdit PlainTextEncoding -int 4

  Applications -> TextEdit -> Save files as UTF-8
  defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

  Applications -> Address Book -> Show Debug Menu
  defaults write com.apple.addressbook ABShowDebugMenu -bool true

  Applications -> Dashboard -> Dev mode (allows keeping widgets on the desktop)
  defaults write com.apple.dashboard devmode -bool true

  Applications -> Disk Utility -> Debug Menu
  defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true

  Applications -> Disk Utility -> Advanced Options
  defaults write com.apple.DiskUtility advanced-image-options -bool true

  Applications -> App Store -> Developer Tools
  defaults write com.apple.appstore WebKitDeveloperExtras -bool true

  Applications -> App Store -> Debug Menu
  defaults write com.apple.appstore ShowDebugMenu -bool true

  Applications -> TextMate -> Don't mess with my Tabs
  defaults write com.macromates.TextMate.preview disableTabReordering -bool YES

  Applications -> TextMate -> Don't jump around in File Browser
  defaults write com.macromates.TextMate.preview autoRevealFile -bool NO

  Applications -> TextMate -> Always wrap around search
  defaults write com.macromates.TextMate.preview findWrapAround -bool YES

  Applications -> TextMate -> Tabs begin at the document window
  defaults write com.macromates.TextMate.preview tabsAboveDocument -bool YES

  Applications -> TextMate -> Show file browser to the left
  defaults write com.macromates.TextMate.preview fileBrowserPlacement -string "left"

  Applications -> TextMate -> Always show the tab bar
  defaults write com.macromates.TextMate.preview disableTabBarCollapsing -bool YES

}

if ENV['SUDO']
  default[:osx][:settings] += %{

    Disable the sound effects on boot
    sudo nvram SystemAudioVolume=" "

    Hidden Settings -> HDD Sudden motion sensor -> Disable
    sudo pmset -a sms 0

    Show HiDPI display modes in screen resolution settings pane (requires restart)
    sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

  }
end

if %w{ red blue }.include? ENV['BIOSPHERE_ENV_PROFILE']
  default[:osx][:settings] += %{

    System Preferences -> General -> Show Scrollbars -> When scrolling
    defaults write NSGlobalDomain AppleSchowScrollBars -string WhenScrolling

    Applications -> Finder -> Library Directory -> Show
    chflags nohidden ~/Library

  }
end

if %w{ green }.include? ENV['BIOSPHERE_ENV_PROFILE']
  default[:osx][:settings] += %{

    System Preferences -> General -> Show Scrollbars -> Always
    defaults write NSGlobalDomain AppleSchowScrollBars -string Always

    Applications -> Finder -> Library Directory -> Hide
    chflags hidden ~/Library

  }
end


