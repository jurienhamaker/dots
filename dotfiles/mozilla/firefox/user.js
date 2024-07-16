// enable userchrome
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// default toolbox to right side
user_pref("devtools.toolbox.host", "right");

// trim urls
user_pref("browser.urlbar.trimHttps", true);
user_pref("browser.urlbar.trimURLs", true);

// url bar tools
user_pref("browser.urlbar.unitConversion.enabled", true);
user_pref("browser.urlbar.suggest.calculator", true);

// disable sharing indicator
user_pref("privacy.webrtc.legacyGlobalIndicator", false);
user_pref("privacy.webrtc.hideGlobalIndicator", true);
