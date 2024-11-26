import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_project/core/extentions/localization.dart';
import 'package:gpa_project/core/extentions/responsive.dart';
import 'package:gpa_project/core/localization/localizationproxy.dart';
import 'package:gpa_project/featuers/the%20practical/controller/cubit/secondp_cubit.dart';
import 'package:gpa_project/featuers/the%20practical/controller/cubit/thirdp_cubit.dart';

class thirrdp extends StatelessWidget {
  const thirrdp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThirdpCubit, ThirdpState>(
      builder: (context, state) {
        final ThirdpCubit controller = context.read<ThirdpCubit>();
        return Directionality(
          textDirection: changedirectionality,
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      color: Colors.black,
                      onPressed: () {
                        controller.backtoonep(context);
                      },
                      child: Text(
                        "thirdpbutton".localizationextention,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: context.width * 1 / 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedOpacity(
                            opacity: ThirdpCubit.o,
                            duration: const Duration(seconds: 3),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                alignment: AlignmentDirectional.center,
                                decoration: BoxDecoration(
                                    color: Colors.blue[600],
                                    borderRadius: BorderRadius.circular(15)),
                                width: context.width * 1 / 2,
                                height: context.hieght * 1 / 4,
                                child: Text(SecondpCubit.gpa.toString().substring(0,3),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40,
                                        color: Colors.white)),
                              ),
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedOpacity(
                            opacity: ThirdpCubit.o,
                            duration: const Duration(seconds: 3),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                alignment: AlignmentDirectional.center,
                                decoration: BoxDecoration(
                                    color: Colors.blue[600],
                                    borderRadius: BorderRadius.circular(15)),
                                width: context.width * 1 / 2,
                                height: context.hieght * 1 / 4,
                                child: Text('${ThirdpCubit.appreciation}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40,
                                        color: Colors.white)),
                              ),
                            )),
                      ],
                    ),
                  ])),
        );
      },
    );
  }
}
