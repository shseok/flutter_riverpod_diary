import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../model/photo.dart';

List<Photo> parsePhotos(String responseBody){
  var list = json.decode(responseBody) as List<dynamic>; // as 뒤에 타입명시 안할 시 : Exception: type 'List<dyanmic>' is not a subtype of type 'List<Photo>'
  // var list = jsonDecode(responseBody) as List<dynamic>;
  print(list);
  List<Photo> photos = list.map((model) => Photo.fromJson(model)).toList();
  return photos;
}

Future<List<Photo>> fetchPhotos() async{
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  if(response.statusCode == 200){
    print('response.body = ${response.body}');
    return compute(parsePhotos, response.body);
  }else{
    throw Exception('Can\'t get photos');
  }
}