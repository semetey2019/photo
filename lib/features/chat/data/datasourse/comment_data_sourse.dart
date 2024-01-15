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

//   Future<List<Comments>?> _comments() async {
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
