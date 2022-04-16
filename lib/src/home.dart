import 'package:flutter/material.dart';
import 'package:flutter_prac/provider/count_provider.dart';
import 'package:flutter_prac/src/ui/count_home_widget.dart';
import 'package:flutter_prac/src/ui/movie_list_widget.dart';
import 'package:provider/provider.dart';
import '../provider/bottom_navigation_provider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  late CountProvider _countProvider;
  late BottomNavigationProvider _BottomNavigationProvider;

  Widget _navigationBody(){
    switch(_BottomNavigationProvider.currentPage) {
      case 0:
        return CountHomeWidget();
        break;
      case 1:
        return MovieListWidget();
        break;
    }
    return Container();
  }

  Widget _bottomNavigationBarWidget(){
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Movie"),
    ],
      currentIndex: _BottomNavigationProvider.currentPage,
      selectedItemColor: Colors.deepPurple,
      onTap: (index){
        _BottomNavigationProvider.updateCurrentPage(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _BottomNavigationProvider = Provider.of<BottomNavigationProvider>(context);
    return Scaffold(
      body: _navigationBody(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}