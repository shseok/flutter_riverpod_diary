import 'package:flutter/material.dart'; // i -> fm

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // Myapp은 Stateless
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appbar',
      theme: ThemeData(primarySwatch: Colors.red),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar icon menu'),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {
              print('shopping cart button is clicked');
            },
            icon: Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () {
              print('search button is clicked');
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/hyeon.jpg'),
                backgroundColor: Colors.white,
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/hyeon2.jpg'),
                  backgroundColor: Colors.white,
                )
              ],
              accountName: Text('Hyeonseok'),
              accountEmail: Text('gus0674@ajou.ac.kr'),
              onDetailsPressed: () {
                print('arrow is clicked');
              },
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.grey[850]),
              title: Text('Home'),
              trailing: Icon(Icons.add),
              onTap: () {
                print('home is clicked');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.grey[850]),
              title: Text('Settings'),
              trailing: Icon(Icons.add),
              onTap: () {
                print('Settings is clicked');
              },
            ),
            ListTile(
              leading: Icon(Icons.question_answer, color: Colors.grey[850]),
              title: Text('Q&A'),
              trailing: Icon(Icons.add),
              onTap: () {
                print('Q&A is clicked');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.red,
          ),
          onPressed: () {},
          child: Text(
            'Show me',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
