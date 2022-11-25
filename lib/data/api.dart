import 'package:on_boarding/data/model/introduction.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
Future<List<Introduction>> getIntroduction() async {
  var response = await Dio().get('http://www.google.com:3000/product') as List;
  return response.map((e) => Introduction.fromMap(e)).toList();
}

final getIntroductions = FutureProvider.autoDispose<List<Introduction>>((ref) async {
  var response = (await Dio().get('http://172.17.192.1:3000/introduction')).data as List;
  return response.map((e) => Introduction.fromMap(e)).toList();
});

final getReservations = FutureProvider.autoDispose<List<Introduction>>((ref) async {
  var response = (await Dio().get('http://172.17.192.1:3000/reservation')).data as List;
  return response.map((e) => Introduction.fromMap(e)).toList();
});
