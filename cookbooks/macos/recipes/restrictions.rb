profile_hash = {
  'PayloadDisplayName' => 'OS Restrictions',
  'PayloadRemovalDisallowed' => false,
  'PayloadIdentifier' => Identifier.join('restrictions'),
  'PayloadUUID' => '6D0930EB-BAE7-4801-B50C-D46E3047C615',
  'PayloadScope' => 'System',
  'PayloadType' => 'Configuration',
  'PayloadOrganization' => Identifier.organization,
  'PayloadVersion' => 1,
  'PayloadContent' => [
    {
      'PayloadDisplayName' => 'Restrictions',
      'PayloadType' => 'com.apple.applicationaccess',
      'PayloadIdentifier' => Identifier.join('restrictions.settings'),
      'PayloadUUID' => '325589E7-246A-4DDB-AE9A-FA398B828B39',
      'PayloadVersion' => 1,
      'PayloadEnabled' => true,
      allowAssistant: false, # Disable Siri
      allowCloudAddressBook: false,
      allowCloudBookmarks: false,
      allowCloudCalendar: false,
      allowCloudDesktopAndDocuments: false,
      allowCloudDocumentSync: false, # (Deprecated on unsupervised devices)
      allowCloudKeychainSync: false,
      allowCloudMail: false,
      allowCloudNotes: false,
      allowCloudPhotoLibrary: false,
      allowCloudReminders: false,
      allowDiagnostic: false, # Disable Telemetry
      allowManagedAppsCloudSync: false,
      allowSpotlightInternetResults: false, # Supervised only?
      safariAllowAutoFill: false,
    }
  ]
}

osx_profile 'Configure Restrictions' do
  profile profile_hash
end
