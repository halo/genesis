# See https://developer.apple.com/documentation/devicemanagement/restrictions

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
      allowAssistant: false,
      allowCloudAddressBook: false,
      allowCloudBackup: false, # Supervised
      allowCloudBookmarks: false,
      allowCloudCalendar: false,
      allowCloudDesktopAndDocuments: false,
      allowCloudDocumentSync: false, # Supervised
      allowCloudFreeform: false,
      allowCloudKeychainSync: false,
      allowCloudMail: false,
      allowCloudNotes: false,
      allowCloudPhotoLibrary: false,
      allowCloudPrivateRelay: false,
      allowCloudReminders: false,
      allowDiagnosticSubmission: false,
      allowDiagnosticSubmissionModification: false, # Supervised
      allowExternalIntelligenceIntegrations: false, # Supervised
      allowExternalIntelligenceIntegrationsSignIn: false, # Supervised
      allowGenmoji: false, # Supervised
      allowImagePlayground: false, # Supervised
      allowImageWand: false, # Supervised
      allowMailPrivacyProtection: false, # Supervised
      allowManagedAppsCloudSync: false,
      allowSpotlightInternetResults: false, # Supervised
      allowWritingTools: false, # Supervised
      forceOnDeviceOnlyDictation: true,
      forceOnDeviceOnlyTranslation: true,
      safariAllowAutoFill: false,
    }
  ]
}

directory node[:macos][:mobileconfig_path].to_s do
  recursive true
end

file node[:macos][:mobileconfig_path].join('restrictions.mobileconfig') do
  content profile_hash.to_plist
end
