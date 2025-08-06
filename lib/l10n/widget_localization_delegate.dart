// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Package imports:

class AWidgetLocalizationsDelegate extends WidgetsLocalizations {
  @override
  String get reorderItemDown => 'Move down';

  @override
  String get reorderItemLeft => 'Move left';

  @override
  String get reorderItemRight => 'Move right';

  @override
  String get reorderItemToEnd => 'Move to the end';

  @override
  String get reorderItemToStart => 'Move to the start';

  @override
  String get reorderItemUp => 'Move up';

  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  // TODO: implement copyButtonLabel
  String get copyButtonLabel => '';

  @override
  // TODO: implement cutButtonLabel
  String get cutButtonLabel => '';

  @override
  // TODO: implement lookUpButtonLabel
  String get lookUpButtonLabel => '';

  @override
  // TODO: implement pasteButtonLabel
  String get pasteButtonLabel => '';

  @override
  // TODO: implement searchWebButtonLabel
  String get searchWebButtonLabel => '';

  @override
  // TODO: implement selectAllButtonLabel
  String get selectAllButtonLabel => '';

  @override
  // TODO: implement shareButtonLabel
  String get shareButtonLabel => '';
}

class AppWidgetLocalizationDelegate
    extends LocalizationsDelegate<WidgetsLocalizations> {
  const AppWidgetLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['ig', 'ha', 'yo', 'en', 'fr', 'es'].contains(locale.languageCode);
  }

  @override
  Future<AWidgetLocalizationsDelegate> load(Locale locale) async {
    return SynchronousFuture<AWidgetLocalizationsDelegate>(
      AWidgetLocalizationsDelegate(),
    );
  }

  @override
  bool shouldReload(AppWidgetLocalizationDelegate old) => false;
}
