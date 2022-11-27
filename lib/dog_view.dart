
import 'package:block_task1/blocs/image_bloc.dart';
import 'package:block_task1/models/dog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dogview extends StatefulWidget {
   Dogview({Key? key}) : super(key: key);


  @override
  State<Dogview> createState() => _DogviewState();
}

class _DogviewState extends State<Dogview> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Dog image')),),
      body: BlocBuilder<ImageBloc,ImageState>(
        builder: (context,state){
          if( state is ImageInitial){
            return FlutterLogo();

          }
          if(state is ImageLoadingState){
            return Center(child: CircularProgressIndicator());
          }
          if (state is ImageFail) {
            Text("error occured");
          }
          if(state is ImageSuccess){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Image.network(
                      state.dogs.message.toString(),height: 400,width: 300,),
                  TextButton(onPressed: () {}, child: Text("Next"))
                ],
              ),
            );

          }
          throw Exception("$state is not fount");
        },
      ),
    );
  }

}