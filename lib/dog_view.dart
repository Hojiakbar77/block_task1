import '../models/dog_model.dart';
import 'package:block_task1/blocs/image_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/net.dart';


class Dogview extends StatefulWidget {
   const Dogview({Key? key}) : super(key: key);


  @override
  State<Dogview> createState() => DogviewState();
}

class DogviewState extends State<Dogview> {
 late Future<Dog>futureDog;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureDog = getDog();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Dog image')),),
      body: BlocBuilder<ImageBloc,ImageState>(
        builder: (context,state){

           if( state is ImageInitial){
          return const FlutterLogo();

          }

          else if(state is ImageLoadingState){
          return const Center(child: CircularProgressIndicator());
          }
          else if (state is ImageFail) {
          return const Text("da");
          }

          else if(state is ImageSuccess){
            return Center(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  SizedBox(
                    height: 400,
                    width: 300,
                    child: Image.network(
                        state.dogs.message.toString(),),
                  ),
                  TextButton(onPressed: (){
                    context.read<ImageBloc>().add(NextImageEvent());
                  }, child: const Text("Next"))

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