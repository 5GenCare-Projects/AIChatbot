import 'dart:convert';

import 'package:http/http.dart' as http;

String apikey = "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";

class ApiServices{

  static sendMessage(String? message) async{
    var res = await http.post(
      Uri.parse("https://api.openai.com/v1/chat/completions"),
      headers: {
        'Content-Type':'application/json',
        'Authorization': 'Bearer $apikey'
      },
      body: jsonEncode(
        {
          "model": "gpt-3.5-turbo",
          "messages": [{"role": "user", "content": "$message"}],
          "temperature": 0.7

        })
    );

    if(res.statusCode == 200){
      var data = jsonDecode(res.body.toString());
      var msg = data['choices'][0]['message']['content'];
      return msg;
    } else{
      print("Fail to fetch data");
      print("Request failed with status: ${res.statusCode}");
    }

  }

}