import '../configs/importer.dart';
import '../configs/auth/auth_state.dart';

class bottomBar extends StatefulWidget {
  const bottomBar({
    Key? key,
  }) : super(key: key);

  @override
  _StateBottomBar createState() => _StateBottomBar();
}

class _StateBottomBar extends AuthState<bottomBar>
    with SingleTickerProviderStateMixin {
  var datasets = <String, dynamic>{};
  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF050814),
        bottomNavigationBar: BottomNavigationBar(
      // currentIndex: _selectedIndex,
      // onTap: _onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          activeIcon: Icon(Icons.book_online),
          label: 'Book',
          tooltip: "This is a Book Page",
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          activeIcon: Icon(Icons.business_center),
          label: 'Business',
          tooltip: "This is a Business Page",
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          activeIcon: Icon(Icons.school_outlined),
          label: 'School',
          tooltip: "This is a School Page",
          backgroundColor: Colors.purple,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          activeIcon: Icon(Icons.settings_accessibility),
          label: 'Settings',
          tooltip: "This is a Settings Page",
          backgroundColor: Colors.pink,
        ),
      ],

      // width: double.maxFinite,
      // height: MediaQuery.of(context).size.height,// * (10 / 100),
      // decoration: const BoxDecoration(
      // color: Color(0xFF000000),
      // border: Border(
      // left: BorderSide(
      // width: 0, style: BorderStyle.none, color: Color(0xFF000000)),
      // top: BorderSide(
      // width: 0, style: BorderStyle.none, color: Color(0xFF000000)),
      // right: BorderSide(
      // width: 0, style: BorderStyle.none, color: Color(0xFF000000)),
      // bottom: BorderSide(
      // width: 0, style: BorderStyle.none, color: Color(0xFF000000)),
      // ),
      // ),
      // child: Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.start,
      // children: [
      // Padding(
      // padding: const EdgeInsets.only(
      // left: 18,
      // top: 18,
      // right: 18,
      // bottom: 18,
      // ),
      // child: GestureDetector(
      // onTap: () async {},
      // onLongPress: () async {},
      // child: Column(
      // children: [
      // Icon(
      // MdiIcons.fromString('home'),
      // size: 24,
      // color: Color(0xFFFFFFFF),
      // ),
      // Text(
      // 'HOME',
      // style: GoogleFonts.poppins(
      // textStyle: TextStyle(
      // color: const Color(0xFFFFFFFF),
      // fontWeight: FontWeight.w400,
      // fontSize: 16,
      // fontStyle: FontStyle.normal,
      // decoration: TextDecoration.none,
      // ),
      // ),
      // textAlign: TextAlign.left,
      // textDirection: TextDirection.ltr,
      // )
      // ],
      // )),
      // ),
      // Padding(
      // padding: const EdgeInsets.only(
      // left: 18,
      // top: 18,
      // right: 18,
      // bottom: 18,
      // ),
      // child: GestureDetector(
      // onTap: () async {},
      // onLongPress: () async {},
      // child: Column(
      // children: [
      // Icon(
      // MdiIcons.fromString('store-search'),
      // size: 24,
      // color: Color(0xFFFFFFFF),
      // ),
      // Text(
      // 'SEARCH',
      // style: GoogleFonts.poppins(
      // textStyle: TextStyle(
      // color: const Color(0xFFFFFFFF),
      // fontWeight: FontWeight.w400,
      // fontSize: 16,
      // fontStyle: FontStyle.normal,
      // decoration: TextDecoration.none,
      // ),
      // ),
      // textAlign: TextAlign.left,
      // textDirection: TextDirection.ltr,
      // )
      // ],
      // )),
      // ),
      // Padding(
      // padding: const EdgeInsets.only(
      // left: 18,
      // top: 18,
      // right: 18,
      // bottom: 18,
      // ),
      // child: GestureDetector(
      // onTap: () async {
      // await Navigator.push<void>(
      // context,
      // MaterialPageRoute(
      // builder: (context) => areaMap(),
      // ),
      // );
      // },
      // onLongPress: () async {},
      // child: Column(
      // children: [
      // Icon(
      // MdiIcons.fromString('google-maps'),
      // size: 24,
      // color: Color(0xFFFFFFFF),
      // ),
      // Text(
      // 'MAP',
      // style: GoogleFonts.poppins(
      // textStyle: TextStyle(
      // color: const Color(0xFFFFFFFF),
      // fontWeight: FontWeight.w400,
      // fontSize: 16,
      // fontStyle: FontStyle.normal,
      // decoration: TextDecoration.none,
      // ),
      // ),
      // textAlign: TextAlign.left,
      // textDirection: TextDirection.ltr,
      // )
      // ],
      // )),
      // ),
      // Padding(
      // padding: const EdgeInsets.only(
      // left: 18,
      // top: 18,
      // right: 18,
      // bottom: 18,
      // ),
      // child: GestureDetector(
      // onTap: () async {
      // await Navigator.push<void>(
      // context,
      // MaterialPageRoute(
      // builder: (context) => brog(),
      // ),
      // );
      // },
      // onLongPress: () async {},
      // child: Column(
      // children: [
      // Icon(
      // MdiIcons.fromString('notebook'),
      // size: 24,
      // color: Color(0xFFFFFFFF),
      // ),
      // Text(
      // 'BROG',
      // style: GoogleFonts.poppins(
      // textStyle: TextStyle(
      // color: const Color(0xFFFFFFFF),
      // fontWeight: FontWeight.w400,
      // fontSize: 16,
      // fontStyle: FontStyle.normal,
      // decoration: TextDecoration.none,
      // ),
      // ),
      // textAlign: TextAlign.left,
      // textDirection: TextDirection.ltr,
      // )
      // ],
      // )),
      // )
      // ,
      // ]
      // ,
      // )
      // ,
    ));
  }
}
