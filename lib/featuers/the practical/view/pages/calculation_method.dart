import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_project/core/extentions/localization.dart';
import 'package:gpa_project/core/extentions/responsive.dart';
import 'package:gpa_project/core/localization/localizationproxy.dart';
import 'package:gpa_project/featuers/the%20practical/controller/calcmethodcontroller.dart';
import 'package:gpa_project/featuers/the%20practical/controller/cubit/cubit/animatedalign_cubit.dart';
import 'package:gpa_project/featuers/the%20practical/controller/cubit/practical_cubit.dart';

class CalculationMethod extends StatelessWidget {
  const CalculationMethod({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PracticalCubit(context),
      child: BlocBuilder<AnimatedalignCubit, AnimatedalignState>(
        builder: (context, state) {
          final AnimatedalignCubit controller =
              context.read<AnimatedalignCubit>();
          return Directionality(
            textDirection: changedirectionality,
            child: Scaffold(
              body: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: context.hieght * 1 / 4,
                    child: Text(
                      "calculationptitel".localizationextention,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    top: context.hieght * 1 / 4,
                    child: SizedBox(
                      height: context.hieght * 1 / 2,
                      width: context.width,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: MaterialButton(
                              minWidth: context.width * 1 / 3,
                              height: context.hieght / 8,
                              color: Colors.black,
                              child: Text(
                                  "calculationpbutton2".localizationextention,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              onPressed: () {
                                Calcmethodcontroller.calcway(
                                    context,
                                    "tap2_2".localizationextention,
                                    "secondphinttext2_2".localizationextention);
                              },
                            ),
                          ),
                          AnimatedAlign(
                            duration: const Duration(milliseconds: 800),
                            alignment: controller.animatedalignv2,
                            child: MaterialButton(
                              minWidth: context.width * 1 / 3,
                              height: context.hieght / 8,
                              color: Colors.black,
                              child: Text(
                                  "calculationpbutton1".localizationextention,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              onPressed: () {
                                Calcmethodcontroller.calcway(
                                    context,
                                    "tap2_1".localizationextention,
                                    "secondphinttext2_1".localizationextention);
                              },
                            ),
                          ),
                          AnimatedAlign(
                            duration: const Duration(milliseconds: 800),
                            alignment: controller.animatedalignv3,
                            child: MaterialButton(
                              minWidth: context.width * 1 / 3,
                              height: context.hieght / 8,
                              color: Colors.black,
                              child: Text(
                                  "calculationpbutton3".localizationextention,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              onPressed: () {
                                Calcmethodcontroller.calcway(
                                    context,
                                    "tap2_3".localizationextention,
                                    "secondphinttext2_3".localizationextention);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: changealignment,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            CupertinoIcons.back,
                            color: Colors.black,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
