import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gpa_project/core/extentions/localization.dart';
import 'package:gpa_project/featuers/the%20practical/controller/cubit/secondp_cubit.dart';
import 'package:gpa_project/featuers/the%20practical/view/pages/onep.dart';


part 'thirdp_state.dart';

class ThirdpCubit extends Cubit<ThirdpState> {
  ThirdpCubit(BuildContext context) : super(ThirdpInitial()) {
    WidgetsFlutterBinding.ensureInitialized();
    WidgetsBinding.instance.addPostFrameCallback((timeSappreciationmp) {
      show();
    });
  }
  static double o = 0.0;
  static String? appreciation;
  static void calctheapprection() {
    switch (SecondpCubit.gpa!) {
      case >= 3.9 && <= 4.0:
        appreciation = "apprecition1".localizationextention;
      case >= 3.7 && < 3.9:
        appreciation = "apprecition2".localizationextention;
      case >= 3.3 && < 3.7:
        appreciation =  "apprecition3".localizationextention;
      case >= 3.0 && < 3.3:
        appreciation = "apprecition4".localizationextention;
      case >= 2.7 && < 3.0:
        appreciation = "apprecition5".localizationextention;
      case >= 2.3 && < 2.7:
        appreciation = "apprecition6".localizationextention;
      case >= 2.0 && < 2.3:
        appreciation = "apprecition7".localizationextention;
      case >= 1.7 && < 2.0:
        appreciation = "apprecition8".localizationextention;
      case >= 0.0 && < 1.7:
        appreciation = "apprecition9".localizationextention;
      default:
        appreciation = "apprecition10".localizationextention;
    }
  }

  void show() {
    o = 1.0;
    emit(tiermstate());
  }

  void backtoonep(BuildContext context) {
  
     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
        builder: (context) => const Onep(),
      ),(route) => false ,);
   
  }
}
