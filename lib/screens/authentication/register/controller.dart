import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:achilleservice/utils/utils.dart';

class RegisterController {
  static String? validateEmail(String? email, BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    if (email == null) {
      return t.notEmptyMessage(t.email);
    }
    if (email.trim() == '') {
      return t.notEmptyMessage(t.email);
    }
    if (!Validator.isEmail(email.trim())) {
      return t.invalidEmailMessage(email.trim());
    }
    return null;
  }

  static String? validatePhone(String? phone, BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    if (phone == null) {
      return t.notEmptyMessage(t.phone);
    }
    if (phone.trim() == '') {
      return t.notEmptyMessage(t.phone);
    }
    if (phone.trim().length!=10) {
      return t.lenghtNotMatch;
    }
    if (!Validator.isPhone(phone.trim())) {
      return t.invalidPhoneMessage(phone.trim());
    }
    return null;
  }

  static String? validateLastName(String? lastName, BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    if (lastName == null) {
      return t.notEmptyMessage(t.lastName);
    }
    if (lastName == '') {
      return t.notEmptyMessage(t.lastName);
    }
    return null;
  }

  static String? validateFirstName(String? firstName, BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    if (firstName == null) {
      return t.notEmptyMessage(t.firstName);
    }
    if (firstName == '') {
      return t.notEmptyMessage(t.firstName);
    }
    return null;
  }
}
