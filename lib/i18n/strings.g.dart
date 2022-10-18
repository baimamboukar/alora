
/*
 * Generated file. Do not edit.
 *
 * Locales: 3
 * Strings: 222 (74.0 per locale)
 *
 * Built on 2022-10-18 at 20:14 UTC
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
	fr, // 'fr'
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
late _StringsFr _translationsFr = _StringsFr.build();

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {

	/// Gets the translation instance managed by this library.
	/// [TranslationProvider] is using this instance.
	/// The plural resolvers are set via [LocaleSettings].
	_StringsEn get translations {
		switch (this) {
			case AppLocale.en: return _translationsEn;
			case AppLocale.de: return _translationsDe;
			case AppLocale.fr: return _translationsFr;
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
			case AppLocale.fr: return _StringsFr.build();
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.en: return 'en';
			case AppLocale.de: return 'de';
			case AppLocale.fr: return 'fr';
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.en: return const Locale.fromSubtags(languageCode: 'en');
			case AppLocale.de: return const Locale.fromSubtags(languageCode: 'de');
			case AppLocale.fr: return const Locale.fromSubtags(languageCode: 'fr');
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
			case 'en': return AppLocale.en;
			case 'de': return AppLocale.de;
			case 'fr': return AppLocale.fr;
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
	String get singup => 'Sign up';
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
	String get contactUS => 'Contact Us';
	String get helpCenter => 'Help Center';
	String get termsOfService => 'Terms and Service';
	String get themeMode => 'Theme Mode';
	String get changeAppTheme => 'Change App Theme';
	String get changeAppLanguage => 'Change App Language';
	String get pickImageFromGallery => 'Pick Image from Gallery or Camera';
	String get camera => 'Camera';
	String get gallery => 'Gallery';
	String get playSound => 'Play Sound';
	String get listenToText => 'Listen to Text';
	String get solution => 'Solution';
	String get step => 'Step';
	String get solutionAndTreatment => 'Solution and Treatment';
	String get treatment => 'Treatment';
	String get importantTips => 'Important Tips';
	String get processingIMage => 'Processing Image';
	String get symptoms => 'Symptoms';
	String get disease => 'Disease';
	String get description => 'Description';
	String get prediction => 'Prediction';
	String get getToSource => 'Copy the source url 📋';
	String get desc => 'Failed to upload image, connection timeout';
	String get error => 'Something went wrong';
	String get logginOUt => 'Logging out...';
	String get loggedOut => 'Logged out';
	String get changesApply => 'In order to apply changes in the app, the app should be restarted';
	String get paidSuccess => 'You have successfully subscribed to the premium plan';
	String get restartApp => 'Restart App';
	String get paymentConfirmation => 'Payment Confirmation';
	late final _StringsFeaturesEn features = _StringsFeaturesEn._(_root);
	String get purchasePrenium => 'Purchase Prenium';
	String get enterValidName => 'Please enter valid name';
	String get enterValidEMail => 'Please enter valid email';
	String get signingUp => 'Signing Up...';
	String get mathingItems => 'Matching items';
	String get bookmarkedCrops => 'Bookmarked Crops';
	String get matchingResults => 'Matching Results';
	String get noIMageSelected => 'No Image Selected';
}

// Path: features
class _StringsFeaturesEn {
	_StringsFeaturesEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get detectDisease => 'Detect Disease';
	String get getInfos => 'Get Infos';
	String get viewSolution => 'View Solution';
	String get viewTreatment => 'View Treatment';
	String get accessRessources => 'Access Ressources';
	String get customizeApp => 'Customize App Settings';
	String get bookmarkForFuture => 'Bookmark for Future reads';
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
	@override String get enterEmail => 'Geben Sie Ihre E-Mail ein';
	@override String get createAccount => 'Ein Konto erstellen';
	@override String get register => 'Registrieren';
	@override String get yourLibary => 'Ihre Bibliothek';
	@override String get searchLinary => 'Bibliothek durchsuchen';
	@override String get yourBookmarks => 'Ihre Lesezeichen';
	@override String get library => 'Bibliothek';
	@override String get logout => 'Abmelden';
	@override String get profile => 'Profil';
	@override String get settings => 'Einstellungen';
	@override String get language => 'Sprache';
	@override String get language_en => 'Englisch';
	@override String get language_de => 'Deutsch';
	@override String get fullName => 'Vollständiger Name';
	@override String get dontHaveAccount => 'Sie haben noch kein Konto?';
	@override String get forgotPassword => 'Passwort vergessen?';
	@override String get password => 'Kennwort';
	@override String get welcomeBack => 'Willkommen zurück';
	@override String get loginToAccount => 'Einloggen in Ihr Konto';
	@override String get enterCorrectPassword => 'Bitte korrektes Passwort eingeben';
	@override String get crops => 'Kulturpflanzen';
	@override String get bookmarks => 'Lesezeichen';
	@override String get alreadyHaveAccount => 'Sie haben bereits ein Konto?';
	@override String get orSignInWith => 'Oder melden Sie sich an mit';
	@override String get contactUS => 'Kontakt';
	@override String get helpCenter => 'Hilfe-Center';
	@override String get termsOfService => 'Bedingungen und Service';
	@override String get themeMode => 'Theme-Modus';
	@override String get changeAppTheme => 'App-Thema ändern';
	@override String get changeAppLanguage => 'App-Sprache ändern';
	@override String get pickImageFromGallery => 'Bild aus Galerie oder Kamera auswählen';
	@override String get camera => 'Kamera';
	@override String get gallery => 'Galerie';
	@override String get playSound => 'Ton abspielen';
	@override String get listenToText => 'Text anhören';
	@override String get solution => 'Lösung';
	@override String get step => 'Schritt';
	@override String get solutionAndTreatment => 'Lösung und Behandlung';
	@override String get treatment => 'Behandlung';
	@override String get importantTips => 'Wichtige Tipps';
	@override String get processingIMage => 'Verarbeitung Bild';
	@override String get symptoms => 'Symptome';
	@override String get disease => 'Krankheit';
	@override String get description => 'Beschreibung';
	@override String get prediction => 'Vorhersage';
	@override String get getToSource => 'Kopieren der Quell-URL 📋';
	@override String get desc => 'Bild konnte nicht hochgeladen werden, Zeitüberschreitung der Verbindung';
	@override String get error => 'Etwas ist schief gelaufen';
	@override String get logginOUt => 'Abmelden...';
	@override String get loggedOut => 'Ausgeloggt';
	@override String get changesApply => 'Um Änderungen in der App zu übernehmen, sollte die App neu gestartet werden';
	@override String get paidSuccess => 'Sie haben den Premium-Plan erfolgreich abonniert';
	@override String get restartApp => 'App neu starten';
	@override String get paymentConfirmation => 'Zahlungsbestätigung';
	@override late final _StringsFeaturesDe features = _StringsFeaturesDe._(_root);
	@override String get purchasePrenium => 'Prenium kaufen';
	@override String get enterValidName => 'Bitte geben Sie einen gültigen Namen ein';
	@override String get enterValidEMail => 'Bitte gültige E-Mail eingeben';
	@override String get signingUp => 'Angemeldet...';
	@override String get mathingItems => 'Passende Artikel';
	@override String get bookmarkedCrops => 'Mit Lesezeichen versehene Kulturpflanzen';
	@override String get matchingResults => 'Übereinstimmende Ergebnisse';
	@override String get noIMageSelected => 'Kein Bild ausgewählt';
}

// Path: features
class _StringsFeaturesDe implements _StringsFeaturesEn {
	_StringsFeaturesDe._(this._root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get detectDisease => 'Krankheit erkennen';
	@override String get getInfos => 'Infos abrufen';
	@override String get viewSolution => 'Lösung anzeigen';
	@override String get viewTreatment => 'Behandlung anzeigen';
	@override String get accessRessources => 'Zugang zu Ressourcen';
	@override String get customizeApp => 'App-Einstellungen anpassen';
	@override String get bookmarkForFuture => 'Lesezeichen für zukünftige Lektüre';
}

// Path: <root>
class _StringsFr implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsFr.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsFr _root = this; // ignore: unused_field

	// Translations
	@override String hello({required Object name}) => 'Hello $name';
	@override String get save => 'Enregistrer';
	@override String get login => 'Se connecter';
	@override String get singup => 'S\'inscrire';
	@override String get email => 'E-mail';
	@override String get enterEmail => 'Entrer votre e-mail';
	@override String get createAccount => 'Creer un compte';
	@override String get register => 'S\'enregistrer';
	@override String get yourLibary => 'Votre Librairie';
	@override String get searchLinary => 'Recherche';
	@override String get yourBookmarks => 'Vos signets';
	@override String get library => 'Librairie';
	@override String get logout => 'Deconnecter';
	@override String get profile => 'Profil';
	@override String get settings => 'Parametres';
	@override String get language => 'Langue';
	@override String get language_en => 'Anglais';
	@override String get language_de => 'Allemand';
	@override String get fullName => 'Noms complet';
	@override String get dontHaveAccount => 'Pas de compte';
	@override String get forgotPassword => 'Mot de passe oublie?';
	@override String get password => 'Mot de passe';
	@override String get welcomeBack => 'Bienvenue';
	@override String get loginToAccount => 'Connectez-vous à votre compte';
	@override String get enterCorrectPassword => 'Entrez un mot de passe correct';
	@override String get crops => 'Plantes';
	@override String get bookmarks => 'Signets';
	@override String get alreadyHaveAccount => 'Avez-vous deja un compte?';
	@override String get orSignInWith => 'Ou connexion avec';
	@override String get contactUS => 'Nous contacter';
	@override String get helpCenter => 'Centre d\'aide';
	@override String get termsOfService => 'Termes & Services';
	@override String get themeMode => 'Mode de theme';
	@override String get changeAppTheme => 'Changer de theme';
	@override String get changeAppLanguage => 'Cahnger de langue';
	@override String get pickImageFromGallery => 'Sellectionner une image depuis la gallerie';
	@override String get camera => 'Camera';
	@override String get gallery => 'Gallerie';
	@override String get playSound => 'Jouer le son';
	@override String get listenToText => 'Ecouter le texte';
	@override String get solution => 'Solution';
	@override String get step => 'Etape';
	@override String get solutionAndTreatment => 'Solution et Traitement';
	@override String get treatment => 'Traitement';
	@override String get importantTips => 'Astuces importantes';
	@override String get processingIMage => 'Traitement de l\'image';
	@override String get symptoms => 'Symptomes';
	@override String get disease => 'Maladie';
	@override String get description => 'Description';
	@override String get prediction => 'Prediction';
	@override String get getToSource => 'Copier l\'URL source 📋';
	@override String get desc => 'Echec d\'envoi de l\'image';
	@override String get error => 'Erreur de traitement';
	@override String get logginOUt => 'Deconnexion...';
	@override String get loggedOut => 'Deconncte';
	@override String get changesApply => 'Pour appliquer les modifications, veuillez vous déconnecter et vous reconnecter';
	@override String get paidSuccess => 'Vous avez acheter la version prenium avec succès';
	@override String get restartApp => 'Redemarrer l\'appli';
	@override String get paymentConfirmation => 'Confirmation de paiement';
	@override late final _StringsFeaturesFr features = _StringsFeaturesFr._(_root);
	@override String get purchasePrenium => 'Acheter la version premium';
	@override String get enterValidName => 'Entrez un nom valide SVP!';
	@override String get enterValidEMail => 'Entrez un e-mail valide SVP!';
	@override String get signingUp => 'Connexion...';
	@override String get mathingItems => 'Resultats';
	@override String get bookmarkedCrops => 'Plantes favoris';
	@override String get matchingResults => 'Resultats';
	@override String get noIMageSelected => 'Aucune image sellectionee';
}

// Path: features
class _StringsFeaturesFr implements _StringsFeaturesEn {
	_StringsFeaturesFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get detectDisease => 'Detecter les maladies';
	@override String get getInfos => 'Avoir les infos';
	@override String get viewSolution => 'Voir les solutions';
	@override String get viewTreatment => 'Voir les traitements';
	@override String get accessRessources => 'Accder aux ressources';
	@override String get customizeApp => 'Personnaliser les parametres';
	@override String get bookmarkForFuture => 'Signets pour future relecture';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'hello': ({required Object name}) => 'Hello $name',
			'save': 'Save',
			'login': 'Login',
			'singup': 'Sign up',
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
			'contactUS': 'Contact Us',
			'helpCenter': 'Help Center',
			'termsOfService': 'Terms and Service',
			'themeMode': 'Theme Mode',
			'changeAppTheme': 'Change App Theme',
			'changeAppLanguage': 'Change App Language',
			'pickImageFromGallery': 'Pick Image from Gallery or Camera',
			'camera': 'Camera',
			'gallery': 'Gallery',
			'playSound': 'Play Sound',
			'listenToText': 'Listen to Text',
			'solution': 'Solution',
			'step': 'Step',
			'solutionAndTreatment': 'Solution and Treatment',
			'treatment': 'Treatment',
			'importantTips': 'Important Tips',
			'processingIMage': 'Processing Image',
			'symptoms': 'Symptoms',
			'disease': 'Disease',
			'description': 'Description',
			'prediction': 'Prediction',
			'getToSource': 'Copy the source url 📋',
			'desc': 'Failed to upload image, connection timeout',
			'error': 'Something went wrong',
			'logginOUt': 'Logging out...',
			'loggedOut': 'Logged out',
			'changesApply': 'In order to apply changes in the app, the app should be restarted',
			'paidSuccess': 'You have successfully subscribed to the premium plan',
			'restartApp': 'Restart App',
			'paymentConfirmation': 'Payment Confirmation',
			'features.detectDisease': 'Detect Disease',
			'features.getInfos': 'Get Infos',
			'features.viewSolution': 'View Solution',
			'features.viewTreatment': 'View Treatment',
			'features.accessRessources': 'Access Ressources',
			'features.customizeApp': 'Customize App Settings',
			'features.bookmarkForFuture': 'Bookmark for Future reads',
			'purchasePrenium': 'Purchase Prenium',
			'enterValidName': 'Please enter valid name',
			'enterValidEMail': 'Please enter valid email',
			'signingUp': 'Signing Up...',
			'mathingItems': 'Matching items',
			'bookmarkedCrops': 'Bookmarked Crops',
			'matchingResults': 'Matching Results',
			'noIMageSelected': 'No Image Selected',
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
			'enterEmail': 'Geben Sie Ihre E-Mail ein',
			'createAccount': 'Ein Konto erstellen',
			'register': 'Registrieren',
			'yourLibary': 'Ihre Bibliothek',
			'searchLinary': 'Bibliothek durchsuchen',
			'yourBookmarks': 'Ihre Lesezeichen',
			'library': 'Bibliothek',
			'logout': 'Abmelden',
			'profile': 'Profil',
			'settings': 'Einstellungen',
			'language': 'Sprache',
			'language_en': 'Englisch',
			'language_de': 'Deutsch',
			'fullName': 'Vollständiger Name',
			'dontHaveAccount': 'Sie haben noch kein Konto?',
			'forgotPassword': 'Passwort vergessen?',
			'password': 'Kennwort',
			'welcomeBack': 'Willkommen zurück',
			'loginToAccount': 'Einloggen in Ihr Konto',
			'enterCorrectPassword': 'Bitte korrektes Passwort eingeben',
			'crops': 'Kulturpflanzen',
			'bookmarks': 'Lesezeichen',
			'alreadyHaveAccount': 'Sie haben bereits ein Konto?',
			'orSignInWith': 'Oder melden Sie sich an mit',
			'contactUS': 'Kontakt',
			'helpCenter': 'Hilfe-Center',
			'termsOfService': 'Bedingungen und Service',
			'themeMode': 'Theme-Modus',
			'changeAppTheme': 'App-Thema ändern',
			'changeAppLanguage': 'App-Sprache ändern',
			'pickImageFromGallery': 'Bild aus Galerie oder Kamera auswählen',
			'camera': 'Kamera',
			'gallery': 'Galerie',
			'playSound': 'Ton abspielen',
			'listenToText': 'Text anhören',
			'solution': 'Lösung',
			'step': 'Schritt',
			'solutionAndTreatment': 'Lösung und Behandlung',
			'treatment': 'Behandlung',
			'importantTips': 'Wichtige Tipps',
			'processingIMage': 'Verarbeitung Bild',
			'symptoms': 'Symptome',
			'disease': 'Krankheit',
			'description': 'Beschreibung',
			'prediction': 'Vorhersage',
			'getToSource': 'Kopieren der Quell-URL 📋',
			'desc': 'Bild konnte nicht hochgeladen werden, Zeitüberschreitung der Verbindung',
			'error': 'Etwas ist schief gelaufen',
			'logginOUt': 'Abmelden...',
			'loggedOut': 'Ausgeloggt',
			'changesApply': 'Um Änderungen in der App zu übernehmen, sollte die App neu gestartet werden',
			'paidSuccess': 'Sie haben den Premium-Plan erfolgreich abonniert',
			'restartApp': 'App neu starten',
			'paymentConfirmation': 'Zahlungsbestätigung',
			'features.detectDisease': 'Krankheit erkennen',
			'features.getInfos': 'Infos abrufen',
			'features.viewSolution': 'Lösung anzeigen',
			'features.viewTreatment': 'Behandlung anzeigen',
			'features.accessRessources': 'Zugang zu Ressourcen',
			'features.customizeApp': 'App-Einstellungen anpassen',
			'features.bookmarkForFuture': 'Lesezeichen für zukünftige Lektüre',
			'purchasePrenium': 'Prenium kaufen',
			'enterValidName': 'Bitte geben Sie einen gültigen Namen ein',
			'enterValidEMail': 'Bitte gültige E-Mail eingeben',
			'signingUp': 'Angemeldet...',
			'mathingItems': 'Passende Artikel',
			'bookmarkedCrops': 'Mit Lesezeichen versehene Kulturpflanzen',
			'matchingResults': 'Übereinstimmende Ergebnisse',
			'noIMageSelected': 'Kein Bild ausgewählt',
		};
	}
}

extension on _StringsFr {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'hello': ({required Object name}) => 'Hello $name',
			'save': 'Enregistrer',
			'login': 'Se connecter',
			'singup': 'S\'inscrire',
			'email': 'E-mail',
			'enterEmail': 'Entrer votre e-mail',
			'createAccount': 'Creer un compte',
			'register': 'S\'enregistrer',
			'yourLibary': 'Votre Librairie',
			'searchLinary': 'Recherche',
			'yourBookmarks': 'Vos signets',
			'library': 'Librairie',
			'logout': 'Deconnecter',
			'profile': 'Profil',
			'settings': 'Parametres',
			'language': 'Langue',
			'language_en': 'Anglais',
			'language_de': 'Allemand',
			'fullName': 'Noms complet',
			'dontHaveAccount': 'Pas de compte',
			'forgotPassword': 'Mot de passe oublie?',
			'password': 'Mot de passe',
			'welcomeBack': 'Bienvenue',
			'loginToAccount': 'Connectez-vous à votre compte',
			'enterCorrectPassword': 'Entrez un mot de passe correct',
			'crops': 'Plantes',
			'bookmarks': 'Signets',
			'alreadyHaveAccount': 'Avez-vous deja un compte?',
			'orSignInWith': 'Ou connexion avec',
			'contactUS': 'Nous contacter',
			'helpCenter': 'Centre d\'aide',
			'termsOfService': 'Termes & Services',
			'themeMode': 'Mode de theme',
			'changeAppTheme': 'Changer de theme',
			'changeAppLanguage': 'Cahnger de langue',
			'pickImageFromGallery': 'Sellectionner une image depuis la gallerie',
			'camera': 'Camera',
			'gallery': 'Gallerie',
			'playSound': 'Jouer le son',
			'listenToText': 'Ecouter le texte',
			'solution': 'Solution',
			'step': 'Etape',
			'solutionAndTreatment': 'Solution et Traitement',
			'treatment': 'Traitement',
			'importantTips': 'Astuces importantes',
			'processingIMage': 'Traitement de l\'image',
			'symptoms': 'Symptomes',
			'disease': 'Maladie',
			'description': 'Description',
			'prediction': 'Prediction',
			'getToSource': 'Copier l\'URL source 📋',
			'desc': 'Echec d\'envoi de l\'image',
			'error': 'Erreur de traitement',
			'logginOUt': 'Deconnexion...',
			'loggedOut': 'Deconncte',
			'changesApply': 'Pour appliquer les modifications, veuillez vous déconnecter et vous reconnecter',
			'paidSuccess': 'Vous avez acheter la version prenium avec succès',
			'restartApp': 'Redemarrer l\'appli',
			'paymentConfirmation': 'Confirmation de paiement',
			'features.detectDisease': 'Detecter les maladies',
			'features.getInfos': 'Avoir les infos',
			'features.viewSolution': 'Voir les solutions',
			'features.viewTreatment': 'Voir les traitements',
			'features.accessRessources': 'Accder aux ressources',
			'features.customizeApp': 'Personnaliser les parametres',
			'features.bookmarkForFuture': 'Signets pour future relecture',
			'purchasePrenium': 'Acheter la version premium',
			'enterValidName': 'Entrez un nom valide SVP!',
			'enterValidEMail': 'Entrez un e-mail valide SVP!',
			'signingUp': 'Connexion...',
			'mathingItems': 'Resultats',
			'bookmarkedCrops': 'Plantes favoris',
			'matchingResults': 'Resultats',
			'noIMageSelected': 'Aucune image sellectionee',
		};
	}
}
