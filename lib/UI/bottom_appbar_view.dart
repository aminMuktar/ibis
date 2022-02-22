import 'package:flutter/material.dart';

class BottomAppBarView extends StatefulWidget {

  const BottomAppBarView({Key? key}) : super(key: key);

  @override
  _BottomAppBarViewState createState() => _BottomAppBarViewState();
}

class _BottomAppBarViewState extends State<BottomAppBarView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,

       child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon:Icon(Icons.home_outlined),
                      label:'Home'
              ),
              BottomNavigationBarItem(
                  icon:Icon(Icons.library_books_outlined),
                label: 'Library'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search_outlined),
                label: 'Search'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined),
                label: 'Profile'
              )
            ]
        )

    );
  }
}




