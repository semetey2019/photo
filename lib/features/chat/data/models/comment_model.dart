import 'dart:convert';

CommentModel temperaturesFromJson(String str) =>
    CommentModel.fromJson(json.decode(str));

String temperaturesToJson(CommentModel data) => json.encode(data.toJson());

class CommentModel {
  int postId;
  int id;
  String name;
  String email;
  String body;

  CommentModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}

// Map<String, dynamic> comments = {
//   'key1': 'value1',
//   'key2': 'value2',
//   'key3': 'value3',
// };

// List<dynamic> myList = comments.values.toList();
/////////////////////////////////
// class Comments {
//   final String name;
//   final String email;
//   final String body;

//   Comments({
//     required this.name,
//     required this.email,
//     required this.body,
//   });
// }
////////////////////////////
// class Comments {
//   String? name;
//   String? email;
//   String? body;

//   Comments({this.name, this.email, this.body});

//   Comments.fromJson(
//       Map<String, dynamic> json, this.name, this.email, this.body) {
//     name = json['name'];

//     email = json['email'];
//     body = json['body'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};

//     data['name'] = name;

//     data['email'] = email;
//     data['body'] = body;
//     return data;
//   }
// }

// class CommentModel {
//   int postId;
//   int id;
//   String name;
//   String email;
//   String body;

//   CommentModel({
//     required this.postId,
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.body,
//   });

//   factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
//         postId: json["postId"],
//         id: json["id"],
//         name: json["name"],
//         email: json["email"],
//         body: json["body"],
//       );

//   static List<CommentModel> listFromJson(List<dynamic> json) {
//     List<CommentModel> commentsList = [];
//     json.forEach((comment) {
//       commentsList.add(CommentModel.fromJson(comment));
//     });
//     return commentsList;
//   }
// }
