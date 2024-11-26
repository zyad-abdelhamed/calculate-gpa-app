import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gpa_project/core/extentions/localization.dart';
import 'package:gpa_project/core/localization/localizationproxy.dart';
import 'package:gpa_project/featuers/the%20practical/controller/cubit/practical_cubit.dart';
import 'package:gpa_project/featuers/the%20practical/view/pages/thirdp.dart';

part 'secondp_state.dart';

class SecondpCubit extends Cubit<SecondpState> {
  SecondpCubit(BuildContext context) : super(SecondpInitial()) {
    WidgetsFlutterBinding.ensureInitialized();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showe(context);
    });
  }

  static Color tab1color = Colors.black;
  static Color tab2color = Colors.white;

  void changetab1color() {
    if (tab1color == Colors.white) {
      tab1color = Colors.black;
      tab2color = Colors.white;
    }
    emit(Tab1state());
  }

  void changetab2color() {
    if (tab2color == Colors.white) {
      tab2color = Colors.black;
      tab1color = Colors.white;
    }
    emit(Tab2state());
  }

  void ontap(int value) {
    if (value == 0) {
      changetab1color();
    }
    if (value == 1) {
      changetab2color();
    }
  }

  static String? calcwaystring;
  static String? textfeildstring;
  TextInputType get keyboardtype {
    if (calcwaystring == "tap2_2".localizationextention) {
      return TextInputType.name;
    } else {
      return TextInputType.phone;
    }
  }

  void showe(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Directionality(
        textDirection: changedirectionality,
        child: AlertDialog(
          title: Row(children: [
            Text(
              "alertdialogtitel".localizationextention,
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 8,
            ),
            const Icon(
              Icons.warning,
              color: Colors.yellow,
              size: 60,
            )
          ]),
          content: Text("alertdialogdescription".localizationextention,
              style: const TextStyle(fontSize: 25)),
        ),
      ),
    );
  }

  static List<TextEditingController>? grades;
  static List<TextEditingController>? hours;
  static List<TextEditingController>? get getgradscontrollers {
    grades = List.generate(PracticalCubit.getnumberoftextfields!,
        (index) => TextEditingController());
    return grades;
  }

  static List<TextEditingController>? get gethourscontrollers {
    hours = List.generate(PracticalCubit.getnumberoftextfields!,
        (index) => TextEditingController());
    return hours;
  }

  GlobalKey<FormState> k1 = GlobalKey<FormState>();
  GlobalKey<FormState> k2 = GlobalKey<FormState>();
  static double? gpa;
  double sum1 = 0.0;
  double sum2 = 0.0;
  String? de;

  void calc_gpa(BuildContext context) {
    for (TextEditingController g in grades!) {
      double? f;
      if (calcwaystring == "tap2_1".localizationextention) {
        f = double.tryParse(g.text);
      }
      if (calcwaystring == "tap2_3".localizationextention) {
        double? score = double.tryParse(g.text);
        switch (score ?? 0.0) {
          case >= 90:
            f = 4.0;
          case >= 80 && < 85:
            f = 3.75;
          case >= 75 && < 80:
            f = 3.0;
          case >= 70 && < 75:
            f = 2.5;
          case >= 65 && < 70:
            f = 2.0;
          case >= 55 && < 65:
            f = 1.5;
          case >= 50 && < 55:
            f = 1.0;
          case < 50:
            f = 0.0;
          default:
            f = 0.0;
        }
      }

      if (calcwaystring == "tap2_2".localizationextention) {
        String appreciation = g.text;
        switch (appreciation) {
          case 'A+':
            f = 4.0;
          case 'A':
            f = 3.75;
          case 'B+':
            f = 3.5;
          case 'B':
            f = 3.0;
          case 'C+':
            f = 2.5;
          case 'C':
            f = 2.0;
          case 'D+':
            f = 1.5;
          case 'D':
            f = 1.0;
          case 'F':
            f = 0.0;
          default:
            f = 0.0;
        }
      }

      for (TextEditingController h in hours!) {
        double? k = double.tryParse(h.text);

        double? v = f! * k!;
        sum1 = sum1 + v;
        sum2 = sum2 + k;
      }
    }

    gpa = sum1 / sum2;
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const thirrdp(),
    ));
  }

  void emptyoneptextfield() {
    PracticalCubit.pass.text = '';
  }
}
