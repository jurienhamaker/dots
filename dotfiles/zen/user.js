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

// smooth scroll
user_pref("general.smoothScroll.lines.durationMaxMS", 400);
user_pref("general.smoothScroll.lines.durationMinMS", 200);
user_pref("general.smoothScroll.mouseWheel.durationMaxMS", 400);
user_pref("general.smoothScroll.mouseWheel.durationMinMS", 400);
user_pref("general.smoothScroll.other.durationMaxMS", 400);
user_pref("general.smoothScroll.other.durationMinMS", 200);
user_pref("general.smoothScroll.pages.durationMaxMS", 400);
user_pref("general.smoothScroll.pages.durationMinMS", 200);
user_pref("mousewheel.acceleration.start", 0);
user_pref("mousewheel.min_line_scroll_amount", 20);
user_pref("toolkit.scrollbox.smoothScroll", false);
