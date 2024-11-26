import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'animatedalign_state.dart';

class AnimatedalignCubit extends Cubit<AnimatedalignState> {
  AnimatedalignCubit(BuildContext context) : super(AnimatedalignInitial()) {
    WidgetsFlutterBinding.ensureInitialized();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      changealignment();
    });
    
  }
  AlignmentGeometry animatedalignv2 = Alignment.topCenter;
  AlignmentGeometry animatedalignv3 = Alignment.topCenter;
  void changealignment() {
    animatedalignv2 = Alignment.center;
    animatedalignv3 = Alignment.bottomCenter;
    emit(Changealign());
  }
}
