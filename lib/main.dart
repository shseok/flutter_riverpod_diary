import 'package:flutter/material.dart';
import 'package:flutter_prac/state/state_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'model/photo.dart'; // 기본 내장

// 등록 후 내장
void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'initial page',
      home: MyPage(),
    );
  }
}

class MyPage extends ConsumerWidget {
  const MyPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Photo>> photos = ref.watch(photoStateFuture);

    return Scaffold(
        appBar: AppBar(title: Text('Riverpod Get API')),
        body: photos.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('${err.toString()}')),
            data: (photos) {
              return ListView.builder(
                  itemCount: photos.length,
                  itemBuilder: (context, index) => Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(photos[index].thumbnailUrl as String)),
                            title: Text('${photos[index].id}. ${photos[index].title}'),
                          )
                        ],
                      ));
            }));
  }
}
