import '../configs/config.dart';
import '../configs/importer.dart';

import 'home.dart';
import 'areaList.dart';
import 'areaMap.dart';
import 'brog.dart';

// class MyApp extends StatelessWidget {
//   static const String _title = 'Flutter Code Sample';
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   return MaterialApp(
//   //     title: _title,
//   //     home: HomePage(),
//   //   );
//   // }
// }

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // int _selectedIndex = 0;

  /// 表示する画面
  final _pages = <Widget>[
    Home(),
    const AreaList(),
    AreaMap(),
    const Brog()
  ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PersistentTabView(context,
            screens: _pages, //表示する画面の設定
            backgroundColor: AppColor.mainBackColor,
            items: [
              //タブ
              PersistentBottomNavBarItem(
                title: " ホーム",
                icon: const Icon(Icons.home),
                activeColorPrimary: AppColor.subTextColor,
                inactiveColorPrimary: AppColor.mainTextColor,
              ),
              PersistentBottomNavBarItem(
                title: " 店舗検索",
                icon: const Icon(Icons.search),
                activeColorPrimary: AppColor.subTextColor,
                inactiveColorPrimary: AppColor.mainTextColor,
              ),
              PersistentBottomNavBarItem(
                title: " マップ",
                icon: const Icon(Icons.map),
                activeColorPrimary: AppColor.subTextColor,
                inactiveColorPrimary: AppColor.mainTextColor,
              ),
              PersistentBottomNavBarItem(
                title: "ブログ",
                icon: const Icon(Icons.note),
                activeColorPrimary: AppColor.subTextColor,
                inactiveColorPrimary: AppColor.mainTextColor,
              ),
            ],
            navBarStyle: NavBarStyle.style1));

    // bottomNavigationBar: BottomNavigationBar(

    // items: const <BottomNavigationBarItem>[
    // BottomNavigationBarItem(
    // icon: Icon(Icons.home),
    // label: 'ホーム',
    // ),
    // BottomNavigationBarItem(
    // icon: Icon(Icons.search),
    // label: '店舗検索',
    // ),
    // BottomNavigationBarItem(
    // icon: Icon(Icons.map),
    // label: 'マップ',
    // ),
    // BottomNavigationBarItem(
    // icon: Icon(Icons.favorite),
    // label: 'お気に入り',
    // )
    // ],
    // currentIndex: _selectedIndex,
    // type: BottomNavigationBarType.fixed,
    // onTap: _onItemTapped
    // ,
    // )
    // ,
    // );
  }
}

class CustomPage extends StatelessWidget {
  final Color pannelColor;
  final String title;

  CustomPage({required this.pannelColor, required this.title});

  @override
  Widget build(BuildContext context) {
    final titleTextStyle = Theme.of(context).textTheme.headline6;
    return Container(
      child: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              color: pannelColor,
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: titleTextStyle!.fontSize,
                color: titleTextStyle.color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
