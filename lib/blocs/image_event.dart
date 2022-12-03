part of 'image_bloc.dart';

@immutable
abstract class ImageEvent {}
class ImageLoadEvent extends ImageEvent{}
class NextImageEvent extends ImageEvent{}
