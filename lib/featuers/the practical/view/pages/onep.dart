import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_project/core/extentions/localization.dart';
import 'package:gpa_project/core/extentions/responsive.dart';
import 'package:gpa_project/core/localization/localizationproxy.dart';
import 'package:gpa_project/featuers/the%20practical/controller/cubit/practical_cubit.dart';

class Onep extends StatelessWidget {
  const Onep({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PracticalCubit(context),
        child: BlocBuilder<PracticalCubit, PracticalState>(
          builder: (context, state) {
            final PracticalCubit controller = context.read<PracticalCubit>();
            return Directionality(
              textDirection: changedirectionality,
              child: Scaffold(
                appBar: AppBar(
                    leading: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                  height: context.hieght * 1 / 6,
                                  width: context.width,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      RadioListTile(
                                          activeColor: Colors.black,
                                          title: const Text('العربيه'),
                                          value: 'العربيه',
                                          groupValue: PracticalCubit.language,
                                          onChanged: (value) {
                                            controller.bottomSheetpop(context);
                                            controller.changeradio(value);
                                            controller.convertToArabic();
                                          }),
                                      RadioListTile(
                                        activeColor: Colors.black,
                                        title: const Text('english'),
                                        value: 'english',
                                        groupValue: PracticalCubit.language,
                                        onChanged: (value) {
                                          controller.bottomSheetpop(context);
                                          controller.changeradio(value);
                                          controller.convertToEnglish();
                                        },
                                      )
                                    ],
                                  ),
                                );
                              });
                        },
                        icon: const Icon(Icons.language))),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "definition".localizationextention,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(bottom: 5, left: 5, right: 5),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () => controller.gotosecondp(context),
                              child: const CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 30,
                                child: Icon(
                                  Icons.arrow_upward,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Form(
                                key: controller.verify,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == '0' || value!.isEmpty) {
                                      return "oneperror".localizationextention;
                                    }
                                    return null;
                                  },
                                  controller: PracticalCubit.pass,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      fillColor: Colors.grey[250],
                                      filled: true,
                                      hintText:
                                          "onephinttext".localizationextention,
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          borderSide: const BorderSide(
                                              color: Colors.white)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          borderSide: const BorderSide(
                                              color: Colors.white))),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
