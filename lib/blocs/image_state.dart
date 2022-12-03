part of 'image_bloc.dart';

@immutable
abstract class ImageState {}

class ImageInitial extends ImageState {}
class ImageLoadingState extends ImageState{}
class ImageSuccess extends ImageState{
   final Dog dogs;

  ImageSuccess({required this.dogs});
}
class ImageFail extends ImageState{
  final String error ;
  ImageFail({required this.error});
}