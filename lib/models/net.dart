import 'dart:convert';

import 'dog_model.dart';
import 'package:http/http.dart' as http;

Future<Dog> getDog() async {
  final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));

  if (response.statusCode == 200) {

    return Dog.fromJson(jsonDecode(response.body));
  } else {

    throw Exception('Failed to load album');

  }}