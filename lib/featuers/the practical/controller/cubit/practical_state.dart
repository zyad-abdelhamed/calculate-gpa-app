part of 'practical_cubit.dart';

@immutable
sealed class PracticalState {}

final class PracticalInitial extends PracticalState {}
final class ConvertEnglish extends PracticalState {}
final class ConvertArabic extends PracticalState {}
final class Loadlanguage extends PracticalState {}
