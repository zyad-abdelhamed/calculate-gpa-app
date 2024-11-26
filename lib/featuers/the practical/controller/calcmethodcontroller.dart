import 'package:flutter/material.dart';
import 'package:gpa_project/featuers/the%20practical/controller/cubit/secondp_cubit.dart';
import 'package:gpa_project/featuers/the%20practical/view/pages/secondp.dart';

class Calcmethodcontroller {
  static void calcway(
      BuildContext context, String calcwaystring, String textfeildstring) {
    SecondpCubit.tab1color = Colors.black;
    SecondpCubit.tab2color = Colors.white;
    SecondpCubit.calcwaystring = calcwaystring;
    SecondpCubit.textfeildstring = textfeildstring;
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Secondp(),
    ));
  }
}
