import 'package:dio/dio.dart';
import '../models/comment_model.dart';

class ApiComments {
  final Dio _client = Dio();

  get dio => null;
  Future<CommentModel?> getUsers() async {
    try {
      var response =
          await _client.get("https://jsonplaceholder.typicode.com/comments");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return CommentModel.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}

// class Api {
//   List<Comments>? comments = [];
//   final dio = Dio();

//   Future<List<Comments>?> commentsData() async {
//     try {
//       final res =
//           await dio.get('https://jsonplaceholder.typicode.com/comments');
//       if (res.statusCode == 200 || res.statusCode == 201) {
//         final data = res.data as List<dynamic>;

//         List<Comments> fetchedComments = data.map((comments) {
//           return Comments(
//               name: comments['name'],
//               email: comments['email'],
//               body: comments['body']);
//         }).toList();

//         return fetchedComments;
//       } else {
//         throw Exception('Failed to load comments');
//       }
//     } catch (e) {
//       print(e);
//       throw Exception('Failed to load comments');
//     }
//   }

//   getUsers() {}
// }

// class Api {
//   final String baseUrl = "https://jsonplaceholder.typicode.com";

//   Future<List<CommentModel>> getUsers() async {
//     final response = await http.get(Uri.parse('$baseUrl/comments'), headers: {
//       "Access-Control-Allow-Origin": "*",
//       'Content-Type': 'application/json',
//       'Accept': '*/*'
//     });

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       final List chats = jsonDecode(utf8.decode(response.bodyBytes));
//       return chats.map((e) => CommentModel.fromJson(e)).toList();
//     } else {
//       throw Exception("Server failre");
//     }
//   }
// }
