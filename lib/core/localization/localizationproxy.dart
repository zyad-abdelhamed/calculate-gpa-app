import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpa_project/core/sharedpreferencesproxy.dart';

class Localizationproxy {
  Localizationproxy._();
  static Localizationproxy? _instance;
  // static Object soli = Object();
  static Localizationproxy get getinstance {
    _instance ??= Localizationproxy._();
    // if(_instance == null){
    //   // lock(soli){
    //   //    _instance ??= LanCubit._();
    //   // }
    // }

    //  if(_instance == null){
    //   _instance = LanCubit._();
    // }
    return _instance!;
  }

   String language = 'ar';

  Map<String, dynamic> localization = {};
  Future<void> loadlang() async {
    await Sharedpreferencesproxy.insertcache(key: 'lang', value: language);
    String root = await rootBundle
        .loadString("lib/core/localization/languaes/$language.json");
    localization = json.decode(root);
  }

  Future<void> convertToArabic() async {
    if (language == 'en') {
      language = 'ar';

     
    }
     await loadlang();
  }

  Future<void> convertToEnglish() async {
    if (language == 'ar') {
      language = 'en';

     
    }
     await loadlang();
  }

  bool isarabic() {
    return language == 'ar';
  }
}

TextDirection get changedirectionality {
  return Localizationproxy.getinstance.isarabic()
      ? TextDirection.rtl
      : TextDirection.ltr;
}

Alignment get changealignment{
   return Localizationproxy.getinstance.isarabic()
      ? Alignment.topRight
      :  Alignment.topLeft;
}