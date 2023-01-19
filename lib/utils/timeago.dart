import 'dart:ui';

import 'package:timeago/timeago.dart' as timeago;

void initTimeago() {
  timeago.setLocaleMessages('en', timeago.EnMessages());
  timeago.setLocaleMessages('en_short', timeago.EnShortMessages());
  timeago.setLocaleMessages('fr', timeago.FrMessages());
  timeago.setLocaleMessages('fr_short', timeago.FrShortMessages());

  timeago.setDefaultLocale('en');
}

String formatTimeago(
  DateTime dateTime, {
  Locale? locale,
}) {
  return timeago.format(dateTime, locale: locale?.languageCode);
}
