import '../model/post_model.dart';
import 'package:dio/dio.dart';

class ApiPosts {
  final Dio _client = Dio();

  get dio => null;
  Future<PostModel?> getUsers() async {
    try {
      var response =
          await _client.get("https://jsonplaceholder.typicode.com/posts");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return PostModel.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

//   Future<ReservationModel?> getUsers2() async {
//     try {
//       var response = await _client
//           .get('http://run.mocky.io/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8');
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return ReservationModel.fromJson(response.data);
//       }
//     } catch (e) {
//       print(e);
//     }
//     return null;
//   }

//   Future<List<RoomModel>?> getApartament() async {
//     try {
//       var response = await _client
//           .get("http://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd");
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         List rooms = response.data['rooms'];
//         return rooms.map((e) => RoomModel.fromJson(e)).toList();
//       }
//     } catch (e) {
//       print(e);
//     }
//     return null;
//   }
}
