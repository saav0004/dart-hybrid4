import 'dart:math';

import 'package:hybrid4/hybrid4.dart' as hybrid4;
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() async {
  try {
    var data = await fetch();

    for (var item in data) {
      var firstName = item['first_name'];
      var lastName = item['last_name'];
      var id = item['uid'];
      print("\nFirst Name: $firstName \nLast Name: $lastName \nID: $id\n");
    }
  } catch (e) {
    print("Error: $e");
  }
}

// Fetch function

Future<List<Map<String, dynamic>>> fetch() async {
  var url = "https://random-data-api.com/api/v2/users?size=2";
  // transform url to uri
  var uri = Uri.parse(url);

  // get responses
  var response = await http.get(uri);

  //error handler
  if (response.statusCode != 200) {
    throw Exception("Error: ${response.statusCode}");
  }
  // get body
  var body = response.body;
  var data = convert.jsonDecode(body);

  return data.cast<Map<String, dynamic>>();
}
