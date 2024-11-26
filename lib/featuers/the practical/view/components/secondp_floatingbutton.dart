import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'package:gpa_project/featuers/the%20practical/controller/cubit/secondp_cubit.dart';
import 'package:gpa_project/featuers/the%20practical/controller/cubit/thirdp_cubit.dart';

class secondp_floatingbutton extends StatelessWidget {
  const secondp_floatingbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecondpCubit, SecondpState>(
      builder: (context, state) {
       final SecondpCubit controller = context.read<SecondpCubit>();
        return FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            controller.calc_gpa(context);
            ThirdpCubit.calctheapprection();
            controller.emptyoneptextfield();
          },
          child: const Icon(
            Icons.arrow_upward,
            color: Colors.white,
          ),
        );
      },
    );
  }
}
