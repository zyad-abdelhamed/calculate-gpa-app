import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gpa_project/core/localization/localizationproxy.dart';
import 'package:gpa_project/core/sharedpreferencesproxy.dart';
import 'package:gpa_project/featuers/the%20practical/controller/cubit/secondp_cubit.dart';
import 'package:gpa_project/featuers/the%20practical/view/pages/calculation_method.dart';


part 'practical_state.dart';

class PracticalCubit extends Cubit<PracticalState> {
  PracticalCubit(BuildContext context) : super(PracticalInitial()) {
    loadlang();
  }
  
 static String? language = 'العربيه';
  void changeradio(String? value) {
    language = value;
    Sharedpreferencesproxy.insertcache(key: "radio", value: language??'العربيه');
  }

  static TextEditingController pass = TextEditingController();
  GlobalKey<FormState> verify = GlobalKey<FormState>();

  static int? itemCount;

 
  static int? get getnumberoftextfields{
      return itemCount= int.tryParse(pass.text);
  }

  void gotosecondp(BuildContext context) {
    if (verify.currentState!.validate()) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const CalculationMethod(),
      ));
       getnumberoftextfields;
    SecondpCubit.getgradscontrollers;
    SecondpCubit.gethourscontrollers;
    }
   
    
  }

  void bottomSheetpop(BuildContext context) {
    Navigator.pop(context);
  }

  Future<void> convertToEnglish() async {
    await Localizationproxy.getinstance.convertToEnglish();

    emit(ConvertEnglish());
  }

  Future<void> convertToArabic() async {
    await Localizationproxy.getinstance.convertToArabic();

    emit(ConvertEnglish());
  }

  Future<void> loadlang() async {
    await Localizationproxy.getinstance.loadlang();
    emit(Loadlanguage());
  }
}
