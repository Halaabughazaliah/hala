import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/widget/GridViewShop.dart';
import 'widget/Drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var blue = Colors.blue;
  int currentindex = 0;
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  final themeMode = ValueNotifier(2);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: AppBarText(),
          flexibleSpace: colorAppBar(context),
          bottom: Taps(),
        ),
        body: TabBarView(
          children: [
            GridViewShop(),
            Center(
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(),
                    items: imgList
                        .map((item) => Container(
                              child: Center(
                                  child: Image.network(item,
                                      fit: BoxFit.cover, width: 1000)),
                            ))
                        .toList(),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: ListView.builder(
                        // This next line does the trick.
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                  height: 70.0,
                                  width: 70.0,
                                  margin: EdgeInsets.only(left: 5.0, right: 5.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100.0),
                                      border: Border.all(
                                          width: 3.0,
                                          style: BorderStyle.solid,
                                          color: Color.fromARGB(255, 0, 0, 0)),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              "https://kddi-h.assetsadobe3.com/is/image/content/dam/au-com/mobile/mb_img_25.jpg")))),
                              SizedBox(height: 3,),
                              Text("Mobile")
                            ],
                          );
                        },
                      ),
                  ),
                  
                ],
              ),
            ),
            Center(
              child: Container(
                child: Text("I"),
              ),
            ),
          ],
        ),
        endDrawer: MyEndDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentindex,
          onTap: ontapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              title: Text("home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Account"),
              activeIcon: Icon(Icons.home),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'سلة المشتريات',
          child: Container(
            child: Icon(Icons.shopping_bag_outlined),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                gradient: LinearGradient(
                  colors: [Colors.green, Colors.greenAccent, blue],
                )),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  TabBar Taps() {
    return TabBar(
      labelColor: Colors.black54,
      labelStyle: textstyle(Colors.blue, 16.0, FontWeight.bold),
      tabs: [
        tabName("عروض يوميه", Icons.donut_small_outlined),
        tabName("الرئيسية", Icons.home_outlined),
        tabName("الحساب", Icons.account_circle_outlined),
      ],
    );
  }

  Tab tabName(Name, icon) {
    return Tab(
        text: Name,
        icon: Icon(
          icon,
          color: blue,
        ));
  }

  Container colorAppBar(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.green, Colors.greenAccent, blue],
      )),
    );
  }

  TextStyle textstyle(color, size, weight) =>
      TextStyle(color: color, fontSize: size, fontWeight: weight);

  Widget AppBarText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 5),
          child: Text("W",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          child: Text("holesale",
              style: TextStyle(
                  color: Colors.black54,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 5),
          child: Text(" M",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          child: Text("arket",
              style: TextStyle(
                  color: Colors.black54,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold)),
        )
      ],
    );
  }

  void ontapped(int index) {
    setState(() {
      currentindex = index;
    });
  }
}
