part of 'listener_cubit.dart';

@immutable
abstract class ListenerState {}

class ListenerInitial extends ListenerState {}

class ListenerChangeMyNameLoading extends ListenerState {}

class ListenerChangeMyNameSuccess extends ListenerState {}
