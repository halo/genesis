profile_hash = {
  'PayloadDisplayName' => 'App Chrome',
  'PayloadRemovalDisallowed' => false,
  'PayloadIdentifier' => Identifier.join('chrome'),
  'PayloadUUID' => '95DF6D36-44BA-44BB-B5B0-7C6DC5AF39CC',
  'PayloadScope' => 'System',
  'PayloadType' => 'Configuration',
  'PayloadOrganization' => Identifier.organization,
  'PayloadVersion' => 1,
  'PayloadContent' => [
    {
      'PayloadDisplayName' => 'Google Chrome Settings',
      'PayloadType' => 'com.google.Chrome',
      'PayloadIdentifier' => Identifier.join('chrome.settings'),
      'PayloadUUID' => 'BA006DF0-A475-4269-9FC5-D5984BCC0B6C',
      'PayloadVersion' => 1,
      'PayloadEnabled' => true,

      # See https://sites.google.com/a/chromium.org/dev/administrators/policy-list-3
      # See chrome://policy

      # Disable Navigation Error Tips ("similar pages when a page can't be found")
      AlternateErrorPagesEnabled: false,
      # Disable autofill
      AutofillAddressEnabled: false,
      AutofillCreditCardEnabled: false,
      # Disable Chrome sync login etc.
      BrowserSignin: 0,
      # Don't mess with DNS
      BuiltInDnsClientEnabled: false,
      # Don't suggest other pages if url is misspelled
      DefaultBrowserSettingEnabled: false,
      # Disable Desktop notifications entirely
      DefaultNotificationsSetting: 2,
      # Disable in-built Flash player
      DefaultPluginsSetting: 2,
      # Allow Developer Tools even in extensions
      DeveloperToolsAllowed: true,
      # Use system print dialog
      DisablePrintPreview: true,
      # Minimize search url footpring
      DefaultSearchProviderEnabled: true,
      DefaultSearchProviderSearchURL: 'https://www.google.com/search?hl=&query={searchTerms}',
      # Disable creepy hardware APIs
      DefaultWebBluetoothGuardSetting: 2,
      DefaultWebUsbGuardSetting: 2,
      # Enforce these extensions to be installed
      ExtensionInstallForcelist: [
        'fhcgjolkccmbidfldomjliifgaodjagh', # Cookie AutoDelete
        'aomjjhallfgjeglblehebfpbcfeobpgk', # 1Password
        'dpjamkmjmigaoobjbekmfgabipmfilij', # Empty New Tab Page
        'gcbommkclmclpchllfjekcdonpmejbdp', # HTTPS Everywhere
        'lokpenepehfdekijkebhpnpcjjpngpnd' # Mute and skip Youtube ads (note remove)
      ],
      # Hide annoying stand-alone icon on startup
      HideWebStoreIcon: true,
      # Disalbe first run imports
      ImportAutofillFormData: false,
      ImportBookmarks: false,
      ImportHistory: false,
      ImportHomepage: false,
      ImportSavedPasswords: false,
      ImportSearchEngine: false,
      # Don't send metrics and crash reports
      MetricsReportingEnabled: false,
      # Disable Chromes internal password manager
      PasswordManagerEnabled: false,
      ShowAppsShortcutInBookmarkBar: false,
      # Enable this, trusting that this is a local digest check
      SafeBrowsingEnabled: true,
      # Don't send page data to google
      SafeBrowsingExtendedReportingEnabled: false,
      # No predicrtive searching and link fetching
      SearchSuggestEnabled: false,
      NetworkPredictionOptions: 2,
      # Disable ofther means of phoning home
      SpellCheckServiceEnabled: false,
      # Deactivate Google account sync
      SyncDisabled: true,
      # Annoying translate suggestion
      TranslateEnabled: false,
      UrlKeyedAnonymizedDataCollectionEnabled: false,
    }
  ]
}

osx_profile 'Configure Chrome' do
  profile profile_hash
end
