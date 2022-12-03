import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/dog_model.dart';
import '../models/net.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {

  ImageBloc() : super(ImageInitial()) {
    on<ImageEvent>((event, emit) async{
      if(event is ImageLoadEvent || event is NextImageEvent  ){
        try{

          emit(ImageLoadingState());


          final dogs = await getDog();

          emit(ImageSuccess(dogs: dogs));
        }
        catch(e){
          emit(ImageFail(error: e.toString()));
        }
      }

    });
  }
}
