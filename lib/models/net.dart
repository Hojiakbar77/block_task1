import 'dart:convert';

import 'dog_model.dart';
import 'package:http/http.dart' as http;

class Net {

  final _baseUrl = 'https://dog.ceo/api/breeds/image/random';
  Future<DogModel> getPostsList() async {
    try{

      final url = Uri.https(_baseUrl,);
      final response = await http.get(url);
      if(response.statusCode ==200){
        final json = jsonDecode(response.body) ;
        final dogs = json.map((e)=> DogModel.fromJson(e));
        return dogs;
      }else{
        throw Exception('Failed to load post');
      }


    } catch(e){
      rethrow;
    }


  }
}