default[:osx][:settings] += %{

  Don't sent queries to Apple
  defaults write com.apple.spotlight orderedItems '({"enabled" = 1;"name" = "APPLICATIONS";},{"enabled" = 1;"name" = "MENU_CONVERSION";},{"enabled" = 1;"name" = "MENU_EXPRESSION";},{"enabled" = 1;"name" = "MENU_DEFINITION";},{"enabled" = 1;"name" = "SYSTEM_PREFS";},{"enabled" = 1;"name" = "DOCUMENTS";},{"enabled" = 1;"name" = "DIRECTORIES";},{"enabled" = 1;"name" = "PRESENTATIONS";},{"enabled" = 1;"name" = "SPREADSHEETS";},{"enabled" = 1;"name" = "PDF";},{"enabled" = 1;"name" = "MESSAGES";},{"enabled" = 1;"name" = "CONTACT";},{"enabled" = 1;"name" = "EVENT_TODO";},{"enabled" = 1;"name" = "IMAGES";},{"enabled" = 1;"name" = "BOOKMARKS";},{"enabled" = 1;"name" = "MUSIC";},{"enabled" = 1;"name" = "MOVIES";},{"enabled" = 1;"name" = "FONTS";},{"enabled" = 1;"name" = "MENU_OTHER";},{"enabled" = 0;"name" = "MENU_WEBSEARCH";},{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";})'

}
