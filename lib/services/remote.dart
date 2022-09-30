import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:placeholder_api/services/remote_data.dart';

class RemoteData{
  Future<List<Post>?>remotedata() async {
    var client=http.Client();
    var url=Uri.parse('https://jsonplaceholder.typicode.com/posts');

    var response= await client.get(url);
    if(response.statusCode==200){
      var json=response.body;
      return postFromJson(json);
    }

  }
}