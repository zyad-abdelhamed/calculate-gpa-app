import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_project/core/localization/localizationproxy.dart';
import 'package:gpa_project/core/sharedpreferencesproxy.dart';
import 'package:gpa_project/featuers/the%20practical/controller/cubit/cubit/animatedalign_cubit.dart';
import 'package:gpa_project/featuers/the%20practical/controller/cubit/practical_cubit.dart';
import 'package:gpa_project/featuers/the%20practical/controller/cubit/secondp_cubit.dart';
import 'package:gpa_project/featuers/the%20practical/controller/cubit/thirdp_cubit.dart';
import 'package:gpa_project/featuers/the%20practical/view/pages/onep.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Sharedpreferencesproxy.cacheintialization();
  Localizationproxy.getinstance.language =
      Sharedpreferencesproxy.getcache(key: 'lang');
  PracticalCubit.language = Sharedpreferencesproxy.getcache(key: "radio");
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PracticalCubit(context),
        ),
        BlocProvider(
          create: (context) => SecondpCubit(context),
        ),
        BlocProvider(
          create: (context) => ThirdpCubit(context),
        ),
        BlocProvider(
          create: (context) => AnimatedalignCubit(context),
        ),
      ],
      child: MaterialApp(
          theme: ThemeData.light(),
          debugShowCheckedModeBanner: false,
          home: const Onep()),
    );
  }
}
