import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_project/core/extentions/localization.dart';
import 'package:gpa_project/featuers/the%20practical/controller/cubit/practical_cubit.dart';
import 'package:gpa_project/featuers/the%20practical/controller/cubit/secondp_cubit.dart';


class secondp_body extends StatelessWidget {
  const secondp_body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecondpCubit, SecondpState>(
      builder: (context, state) {
        final SecondpCubit controller = context.read<SecondpCubit>();
        return TabBarView(children: [
          ListView(children: [
            Container(
                padding: const EdgeInsets.all(15),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          hintText: '${"secondphinttext1".localizationextention} ${index + 1}',
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                      keyboardType: TextInputType.number,
                      controller: SecondpCubit.hours![index],
                    ),
                  ),
                  itemCount: PracticalCubit.getnumberoftextfields ,
                ))
          ]),
          ListView(children: [
            Container(
                padding: const EdgeInsets.all(15),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                            cursorColor: Colors.black,
                            keyboardType: controller.keyboardtype,
                            controller: SecondpCubit.grades![index],
                            decoration: InputDecoration(
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              hintText:
                                  '${SecondpCubit.textfeildstring} ${index + 1}',
                              hintStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )));
                  },
                  itemCount: PracticalCubit.getnumberoftextfields,
                ))
          ]),
        ]);
      },
    );
  }
}
