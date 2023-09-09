import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'default_localizations.dart';
import 'lang/en.dart';

const kDefaultLocale = Locale('en');

class SPUILocalizations<T extends GiphyGetUILocalizationLabels> {
  final Locale locale;
  final T labels;

  const SPUILocalizations(this.locale, this.labels);

  static SPUILocalizations of(BuildContext context) {
    final l = Localizations.of<SPUILocalizations>(
      context,
      SPUILocalizations,
    );

    if (l != null) {
      return l;
    }

    final defaultLocalizations = localizations[kDefaultLocale.languageCode]!;
    return SPUILocalizations(kDefaultLocale, defaultLocalizations);
  }

  static GiphyGetUILocalizationLabels labelsOf(BuildContext context) {
    return SPUILocalizations.of(context).labels;
  }

  static SPUILocalizationDelegate delegate = const SPUILocalizationDelegate();

  static SPUILocalizationDelegate
      withDefaultOverrides<T extends EnLocalizations>(T overrides) {
    return SPUILocalizationDelegate<T>(overrides);
  }
}

class SPUILocalizationDelegate<T extends GiphyGetUILocalizationLabels>
    extends LocalizationsDelegate<SPUILocalizations> {
  final T? overrides;
  final bool _forceSupportAllLocales;

  const SPUILocalizationDelegate([
    this.overrides,
    this._forceSupportAllLocales = false,
  ]);

  @override
  bool isSupported(Locale locale) {
    return _forceSupportAllLocales ||
        localizations.keys.contains(locale.languageCode);
  }

  @override
  Future<SPUILocalizations> load(Locale locale) {
    final l = SPUILocalizations(
      locale,
      overrides ?? localizations[locale.languageCode]!,
    );

    return SynchronousFuture<SPUILocalizations>(l);
  }

  @override
  bool shouldReload(
    covariant LocalizationsDelegate<SPUILocalizations> old,
  ) {
    return false;
  }
}
