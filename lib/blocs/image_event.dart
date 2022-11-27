part of 'image_bloc.dart';

@immutable
abstract class ImageEvent {}
class ImageLoadEvent extends ImageEvent{}
class NextImage extends ImageEvent{}
