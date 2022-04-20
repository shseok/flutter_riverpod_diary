import 'package:flutter_prac/model/photo.dart';
import 'package:flutter_prac/repository/photo_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final photoStateFuture = FutureProvider<List<Photo>>((ref) async {
  return await fetchPhotos(); // await 필요 x?
});
