import '../model/post.dart';
import 'package:http/http.dart' as http;

class Helper {
  Future<List<Post>?> getPost() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }
}
