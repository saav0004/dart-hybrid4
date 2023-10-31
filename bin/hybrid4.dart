import 'dart:math';

import 'package:hybrid4/hybrid4.dart' as hybrid4;
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() {
  fetch().then((value) {
    // print value
    for (var item in value) {
      var firstName = item['first_name'];
      var lastName = item['last_name'];
      var id = item['uid'];
      print("\nFirst Name: $firstName \nLast Name: $lastName \nID: $id\n");
    }
  });
}

// Fetch function

Future<List<Map<String, dynamic>>> fetch() async {
  var url = "https://random-data-api.com/api/v2/users?size=2";
  // transform url to uri
  var uri = Uri.parse(url);
  // get responses
  var response = await http.get(uri);
  // get body
  var body = response.body;
  var data = convert.jsonDecode(body);

  return data.cast<Map<String, dynamic>>();
}
