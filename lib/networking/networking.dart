import 'package:http/http.dart' as http;
import 'dart:convert';
 
class Networking {
  static Future<String?> fetchData() async {
      const String api = 'https://random-words-api.vercel.app/word';

      var response = await http.get(Uri.parse(api));

      if(response.statusCode == 200) {
        var result = jsonDecode(response.body);

        String str = result[0]['word'];
        
        str.replaceAll('-', ' ');
        print(str);
        return str.toUpperCase();
      } else {
        return null;
      }
  }
}