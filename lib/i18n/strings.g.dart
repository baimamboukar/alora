
/*
 * Generated file. Do not edit.
 *
 * Locales: 2
 * Strings: 58 (29.0 per locale)
 *
 * Built on 2022-08-25 at 13:48 UTC
 */

import 'package:flutter/widgets.dart';

const AppLocale _baseLocale = AppLocale.en;
AppLocale _currLocale = _baseLocale;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale {
	en, // 'en' (base locale, fallback)
	de, // 'de'
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn _t = _currLocale.translations;
_StringsEn get t => _t;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget.translations;
	}
}

class LocaleSettings {
	LocaleSettings._(); // no constructor

	/// Uses locale of the device, fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale useDeviceLocale() {
		final locale = AppLocaleUtils.findDeviceLocale();
		return setLocale(locale);
	}

	/// Sets locale
	/// Returns the locale which has been set.
	static AppLocale setLocale(AppLocale locale) {
		_currLocale = locale;
		_t = _currLocale.translations;

		// force rebuild if TranslationProvider is used
		_translationProviderKey.currentState?.setLocale(_currLocale);

		return _currLocale;
	}

	/// Sets locale using string tag (e.g. en_US, de-DE, fr)
	/// Fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale setLocaleRaw(String rawLocale) {
		final locale = AppLocaleUtils.parse(rawLocale);
		return setLocale(locale);
	}

	/// Gets current locale.
	static AppLocale get currentLocale {
		return _currLocale;
	}

	/// Gets base locale.
	static AppLocale get baseLocale {
		return _baseLocale;
	}

	/// Gets supported locales in string format.
	static List<String> get supportedLocalesRaw {
		return AppLocale.values
			.map((locale) => locale.languageTag)
			.toList();
	}

	/// Gets supported locales (as Locale objects) with base locale sorted first.
	static List<Locale> get supportedLocales {
		return AppLocale.values
			.map((locale) => locale.flutterLocale)
			.toList();
	}
}

/// Provides utility functions without any side effects.
class AppLocaleUtils {
	AppLocaleUtils._(); // no constructor

	/// Returns the locale of the device as the enum type.
	/// Fallbacks to base locale.
	static AppLocale findDeviceLocale() {
		final String? deviceLocale = WidgetsBinding.instance.window.locale.toLanguageTag();
		if (deviceLocale != null) {
			final typedLocale = _selectLocale(deviceLocale);
			if (typedLocale != null) {
				return typedLocale;
			}
		}
		return _baseLocale;
	}

	/// Returns the enum type of the raw locale.
	/// Fallbacks to base locale.
	static AppLocale parse(String rawLocale) {
		return _selectLocale(rawLocale) ?? _baseLocale;
	}
}

// context enums

// interfaces generated as mixins

// translation instances

late _StringsEn _translationsEn = _StringsEn.build();
late _StringsDe _translationsDe = _StringsDe.build();

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {

	/// Gets the translation instance managed by this library.
	/// [TranslationProvider] is using this instance.
	/// The plural resolvers are set via [LocaleSettings].
	_StringsEn get translations {
		switch (this) {
			case AppLocale.en: return _translationsEn;
			case AppLocale.de: return _translationsDe;
		}
	}

	/// Gets a new translation instance.
	/// [LocaleSettings] has no effect here.
	/// Suitable for dependency injection and unit tests.
	///
	/// Usage:
	/// final t = AppLocale.en.build(); // build
	/// String a = t.my.path; // access
	_StringsEn build() {
		switch (this) {
			case AppLocale.en: return _StringsEn.build();
			case AppLocale.de: return _StringsDe.build();
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.en: return 'en';
			case AppLocale.de: return 'de';
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.en: return const Locale.fromSubtags(languageCode: 'en');
			case AppLocale.de: return const Locale.fromSubtags(languageCode: 'de');
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
			case 'en': return AppLocale.en;
			case 'de': return AppLocale.de;
			default: return null;
		}
	}
}

// wrappers

GlobalKey<_TranslationProviderState> _translationProviderKey = GlobalKey<_TranslationProviderState>();

class TranslationProvider extends StatefulWidget {
	TranslationProvider({required this.child}) : super(key: _translationProviderKey);

	final Widget child;

	@override
	_TranslationProviderState createState() => _TranslationProviderState();

	static _InheritedLocaleData of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget;
	}
}

class _TranslationProviderState extends State<TranslationProvider> {
	AppLocale locale = _currLocale;

	void setLocale(AppLocale newLocale) {
		setState(() {
			locale = newLocale;
		});
	}

	@override
	Widget build(BuildContext context) {
		return _InheritedLocaleData(
			locale: locale,
			child: widget.child,
		);
	}
}

class _InheritedLocaleData extends InheritedWidget {
	final AppLocale locale;
	Locale get flutterLocale => locale.flutterLocale; // shortcut
	final _StringsEn translations; // store translations to avoid switch call

	_InheritedLocaleData({required this.locale, required Widget child})
		: translations = locale.translations, super(child: child);

	@override
	bool updateShouldNotify(_InheritedLocaleData oldWidget) {
		return oldWidget.locale != locale;
	}
}

// pluralization feature not used

// helpers

final _localeRegex = RegExp(r'^([a-z]{2,8})?([_-]([A-Za-z]{4}))?([_-]?([A-Z]{2}|[0-9]{3}))?$');
AppLocale? _selectLocale(String localeRaw) {
	final match = _localeRegex.firstMatch(localeRaw);
	AppLocale? selected;
	if (match != null) {
		final language = match.group(1);
		final country = match.group(5);

		// match exactly
		selected = AppLocale.values
			.cast<AppLocale?>()
			.firstWhere((supported) => supported?.languageTag == localeRaw.replaceAll('_', '-'), orElse: () => null);

		if (selected == null && language != null) {
			// match language
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.startsWith(language) == true, orElse: () => null);
		}

		if (selected == null && country != null) {
			// match country
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.contains(country) == true, orElse: () => null);
		}
	}
	return selected;
}

// translations

// Path: <root>
class _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build();

	/// Access flat map
	dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	String hello({required Object name}) => 'Hello $name';
	String get save => 'Save';
	String get login => 'Login';
	String get singup => 'Singup';
	String get email => 'Email';
	String get enterEmail => 'Enter your email';
	String get createAccount => 'Create an account';
	String get register => 'Register';
	String get yourLibary => 'Your library';
	String get searchLinary => 'Search library';
	String get yourBookmarks => 'Your bookmarks';
	String get library => 'Library';
	String get logout => 'Logout';
	String get profile => 'Profile';
	String get settings => 'Settings';
	String get language => 'Language';
	String get language_en => 'English';
	String get language_de => 'German';
	String get fullName => 'Full name';
	String get dontHaveAccount => 'Don\'t have an account?';
	String get forgotPassword => 'Forgot password?';
	String get password => 'Password';
	String get welcomeBack => 'Welcome back';
	String get loginToAccount => 'Login to your account';
	String get enterCorrectPassword => 'Please Enter correct password';
	String get crops => 'Crops';
	String get bookmarks => 'Bookmarks';
	String get alreadyHaveAccount => 'Already have an account?';
	String get orSignInWith => 'Or sign in with';
}

// Path: <root>
class _StringsDe implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsDe.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsDe _root = this; // ignore: unused_field

	// Translations
	@override String hello({required Object name}) => 'Hallo $name';
	@override String get save => 'Speichern';
	@override String get login => 'Anmelden';
	@override String get singup => 'Anmelden';
	@override String get email => 'E-Mail';
	@override String get enterEmail => 'E-Mail eingeben';
	@override String get createAccount => 'Konto erstellen';
	@override String get register => 'Registrieren';
	@override String get yourLibary => 'Ihre Bibliothek';
	@override String get searchLinary => 'Bibliothek durchsuchen';
	@override String get yourBookmarks => 'Speichern0';
	@override String get library => 'Speichern1';
	@override String get logout => 'Speichern2';
	@override String get profile => 'Speichern3';
	@override String get settings => 'Speichern4';
	@override String get language => 'Speichern5';
	@override String get language_en => 'Speichern6';
	@override String get language_de => 'Speichern7';
	@override String get fullName => 'Speichern8';
	@override String get dontHaveAccount => 'Speichern9';
	@override String get forgotPassword => 'Anmelden0';
	@override String get password => 'Anmelden1';
	@override String get welcomeBack => 'Anmelden2';
	@override String get loginToAccount => 'Anmelden3';
	@override String get enterCorrectPassword => 'Anmelden4';
	@override String get crops => 'Anmelden5';
	@override String get bookmarks => 'Anmelden6';
	@override String get alreadyHaveAccount => 'Anmelden7';
	@override String get orSignInWith => 'Anmelden8';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'hello': ({required Object name}) => 'Hello $name',
			'save': 'Save',
			'login': 'Login',
			'singup': 'Singup',
			'email': 'Email',
			'enterEmail': 'Enter your email',
			'createAccount': 'Create an account',
			'register': 'Register',
			'yourLibary': 'Your library',
			'searchLinary': 'Search library',
			'yourBookmarks': 'Your bookmarks',
			'library': 'Library',
			'logout': 'Logout',
			'profile': 'Profile',
			'settings': 'Settings',
			'language': 'Language',
			'language_en': 'English',
			'language_de': 'German',
			'fullName': 'Full name',
			'dontHaveAccount': 'Don\'t have an account?',
			'forgotPassword': 'Forgot password?',
			'password': 'Password',
			'welcomeBack': 'Welcome back',
			'loginToAccount': 'Login to your account',
			'enterCorrectPassword': 'Please Enter correct password',
			'crops': 'Crops',
			'bookmarks': 'Bookmarks',
			'alreadyHaveAccount': 'Already have an account?',
			'orSignInWith': 'Or sign in with',
		};
	}
}

extension on _StringsDe {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'hello': ({required Object name}) => 'Hallo $name',
			'save': 'Speichern',
			'login': 'Anmelden',
			'singup': 'Anmelden',
			'email': 'E-Mail',
			'enterEmail': 'E-Mail eingeben',
			'createAccount': 'Konto erstellen',
			'register': 'Registrieren',
			'yourLibary': 'Ihre Bibliothek',
			'searchLinary': 'Bibliothek durchsuchen',
			'yourBookmarks': 'Speichern0',
			'library': 'Speichern1',
			'logout': 'Speichern2',
			'profile': 'Speichern3',
			'settings': 'Speichern4',
			'language': 'Speichern5',
			'language_en': 'Speichern6',
			'language_de': 'Speichern7',
			'fullName': 'Speichern8',
			'dontHaveAccount': 'Speichern9',
			'forgotPassword': 'Anmelden0',
			'password': 'Anmelden1',
			'welcomeBack': 'Anmelden2',
			'loginToAccount': 'Anmelden3',
			'enterCorrectPassword': 'Anmelden4',
			'crops': 'Anmelden5',
			'bookmarks': 'Anmelden6',
			'alreadyHaveAccount': 'Anmelden7',
			'orSignInWith': 'Anmelden8',
		};
	}
}
