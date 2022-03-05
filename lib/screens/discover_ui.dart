import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class DiscoverUI extends StatefulWidget {
  const DiscoverUI({Key? key}) : super(key: key);

  @override
  _DiscoverUIState createState() => _DiscoverUIState();
}
class _DiscoverUIState extends State<DiscoverUI> {
  int activePage=1;
  List <String> images=[
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU',
    'https://wallpaperaccess.com/full/2637581.jpg',
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  ];
  bool _folded=true;
  @override


  Widget _labelPlace(){
    return Center(
      child: Column(
          children:<Widget>[
            Column(
                children:const <Widget>[
                  Text(
                    "Explore The Work Of Great Authors!",
                    style: TextStyle(fontFamily: "RobotoMono",fontWeight: FontWeight.bold,fontSize: 30),
                  ),
                ]
            ),
          ]
      ),
    );
  }
Widget _searchField(){
  return Center(
    child: Container(
      padding: EdgeInsets.only(top: 50, bottom: 20,right: 20, left: 20),
      child: AnimatedContainer(
        duration: Duration(
          milliseconds: 250,
        ),
        width: 500,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.white,
          boxShadow:kElevationToShadow[6],
        ),
        child: Row(
          children: [
            Expanded(
                child:Container(
                  padding: EdgeInsets.only(left: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Color(0xff780858)),
                      border: InputBorder.none,
                    ),
                  ) ,
                ),
            ),
            AnimatedContainer(
                duration: Duration(milliseconds: 400),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_folded ? 32 : 0 ),
                    topRight: Radius.circular(32),
                    bottomLeft: Radius.circular(_folded ? 32 : 0 ),
                    bottomRight: Radius.circular(32),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      Icons.search_outlined,
                      color: Color(0xff780858),

                    ),
                  ),
                  onTap: (){

                  },
                ),
              ),
            ),
          ],
        ),

      ),
    ),
  );
}
// images adon ... new book slider


Widget _horizontalSlider(){
    return Column(
      children: [
        Container(
          child: Text("Lorem Epsum"),
        ),
        Expanded(
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 160.0,
                  color: Colors.red,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 160.0,
                  color: Colors.blue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 160.0,
                  color: Colors.green,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 160.0,
                  color: Colors.yellow,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 160.0,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ),
      ],
    );
}
Widget _carouselSlider(){
  return Shimmer.fromColors(
    highlightColor: Colors.white,
    baseColor: Color(0xffd0d2d6),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(10)),

          ),
          child: ClipRRect(
            borderRadius:BorderRadius.all(Radius.circular(10)),
            child: AspectRatio(
              aspectRatio: 16/8,
              child: Container(
                color: Colors.grey,
              ),
            ),
          ),
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey
              ),
            ),
            SizedBox(
              width: 3,
            ),
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey
              ),
            ),
            SizedBox(
              width: 3,
            ),
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey
              ),
            ),
            SizedBox(
              width: 3,
            ),
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey
              ),
            ),
            SizedBox(
              width: 3,
            ),
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey
              ),
            ),
            SizedBox(
              width: 3,
            ),
          ],
        ),
      ],
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        appBar: AppBar(

          actions: [
            IconButton(
                onPressed: (){},
               icon: Icon(Icons.account_circle_outlined,color: Color(0xff780858),),
            ),
          ],
          leading: Padding(
            padding: const EdgeInsets.only(top: 15.0,left: 30),
            child: Text("Ibis",
              style: TextStyle(
                  fontSize: 20,
                  letterSpacing:-2.5,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Comic Sans MS, Comic Sans, cursive',
                  fontStyle: FontStyle.italic,
                  color:Color(0xff780858)),),
          ),
          backgroundColor: Colors.white,
          elevation: 3,
          bottom: const TabBar(
            labelColor: Color(0xff780858),
            indicatorColor: Color(0xff780858),
            isScrollable: true,
            tabs:[
              Tab(text: "For you",),
              Tab(text: "Popular",),
              Tab(text: "New",),
              Tab(text: "Business",),
              Tab(text: "Arts",),
              Tab(text: "History",),
              Tab(text: "Culture",),
              Tab(text: "Education",),
              Tab(text: "Technology",),
              Tab(text: "Kids & Family",),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(5),

            child:Container(
              child: Column(
                children: [
                  SizedBox(height: 5.0,),
                  _searchField(),
                  _labelPlace(),
                  _carouselSlider(),

                  SizedBox(
                    height: 100,
                      child: _horizontalSlider()
                  )
                ],
              ),
            ),
          ),
        ),
      bottomNavigationBar: BottomNavigationBar(
          items:const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmarks_outlined),
              label: "BOOKMARK"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined),
                label: "SEARCH"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: "MENU"
            ),
          ]
      ),
      ),
    );
  }

   AnimatedContainer slider(images, pagePosition, active) {
      double margin=active ? 10 : 20;
      return AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOutCubic,
          margin: EdgeInsets.all(margin),
          decoration: BoxDecoration(
            image: DecorationImage(image:NetworkImage(images[pagePosition])),
          ),
      );
   }
   imageAnimation(PageController animation,images,pagePosition){
    return AnimatedBuilder(
        animation: animation,
        builder: (context,widget){
          return SizedBox(
            width: 200,
            height: 200,
            child: widget,

          );
        },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Image.network(images[pagePosition]),
      ),
    );
   }
}



