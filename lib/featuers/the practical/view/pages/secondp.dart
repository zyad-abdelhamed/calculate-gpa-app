import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_project/core/extentions/localization.dart';
import 'package:gpa_project/core/localization/localizationproxy.dart';
import 'package:gpa_project/featuers/the%20practical/controller/cubit/secondp_cubit.dart';
import 'package:gpa_project/featuers/the%20practical/view/components/secondp_body.dart';
import 'package:gpa_project/featuers/the%20practical/view/components/secondp_floatingbutton.dart';

class Secondp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecondpCubit, SecondpState>(
      builder: (context, state) {
        final SecondpCubit controller = context.read<SecondpCubit>();
        return DefaultTabController(
          length: 2,
          child: Directionality(
            textDirection: changedirectionality,
            child: Scaffold(
              appBar: AppBar(
                  leading: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      )),
                  centerTitle: true,
                  title: Text("apppartitel".localizationextention),
                  elevation: 0.0,
                  bottom: TabBar(
                    onTap: (value) {
                      controller.ontap(value);
                    },
                    tabs: [
                      Tab(
                        child: Flexible(
                          child: Container(
                              alignment: Alignment.center,
                              color: SecondpCubit.tab1color,
                              child: Text(
                                "tap1".localizationextention,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: SecondpCubit.tab2color),
                              )),
                        ),
                      ),
                      Tab(
                        child: Flexible(
                          child: Container(
                              alignment: Alignment.center,
                              color: SecondpCubit.tab2color,
                              child: Text(
                                SecondpCubit.calcwaystring!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: SecondpCubit.tab1color),
                              )),
                        ),
                      )
                    ],
                    indicatorColor: Colors.black,
                  )),
              floatingActionButton: const secondp_floatingbutton(),
              body: const secondp_body(),
            ),
          ),
        );
      },
    );
  }
}
