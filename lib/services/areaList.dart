import '../configs/config.dart';
import '../configs/importer.dart';
import 'common.dart';
import 'package:smartfix119/services/shopList.dart';

class AreaList extends StatelessWidget {
  const AreaList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'エリアから検索する',
      slivers: [
        _StickyHeaderList(title: '北海道・東北'),
        _StickyHeaderList(title: '関東'),
        _StickyHeaderList(title: '北陸・甲信越'),
        _StickyHeaderList(title: '東海'),
        _StickyHeaderList(title: '近畿'),
        _StickyHeaderList(title: '中国'),
        _StickyHeaderList(title: '四国'),
        _StickyHeaderList(title: '九州'),
      ],
    );
  }
}

class _StickyHeaderList extends StatelessWidget {
  _StickyHeaderList({
    Key? key,
    required this.title,
    this.index,
  }) : super(key: key);

  final int? index;
  final String title;

  // 指定したドキュメントの情報
  String orderDocumentInfo = '';

  var list = [];

  /// グラデーション
  final Shader _linearGradient = const LinearGradient(
    colors: <Color>[
      Color(0xff1A2980),
      Color(0xff26D0CE),
    ],
  ).createShader(
    const Rect.fromLTWH(
      0.0,
      0.0,
      250.0,
      70.0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    switch (title) {
      case '北海道・東北':
        list = ['北海道', '青森県', '岩手県', '宮城県', '秋田県', '山形県', '福島県'];
        break;
      case '関東':
        list = ['茨城県', '栃木県', '群馬県', '埼玉県', '千葉県', '東京都', '神奈川県'];
        break;
      case '北陸・甲信越':
        list = ['新潟県', '富山県', '石川県', '福井県', '山梨県', '長野県'];
        break;
      case '東海':
        list = ['岐阜県', '静岡県', '愛知県', '三重県'];
        break;
      case '近畿':
        list = ['滋賀県', '京都府', '大阪府', '兵庫県', '奈良県', '和歌山県'];
        break;
      case '中国':
        list = ['鳥取県', '島根県', '岡山県', '広島県', '山口県'];
        break;
      case '四国':
        list = ['徳島県', '香川県', '愛媛県', '高知県'];
        break;
      case '九州':
        list = ['福岡県', '佐賀県', '長崎県', '熊本県', '大分県', '宮崎県', '鹿児島県', '沖縄県'];
        break;
    }
    ;
    return Container(
        // decoration: const BoxDecoration(
        //     color: AppColor.mainBackColor,
        //     image: DecorationImage(
        //       image: AssetImage('images/background-image.png'),
        //       fit: BoxFit.cover,
        //     )),
        child: SliverStickyHeader(
          header: Header(
            title: title,
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => ListTile(
                  // leading: CircleAvatar(
                  //   backgroundColor: AppColor.mainBackColor,
                  //   child: Text('$index'),
                  // ),
                  //title: Text(list[i]),
                  title: Text(
                    list[i],
                    style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()..shader = _linearGradient),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      // TODO: areaIdを動的に変更
                      MaterialPageRoute(
                          builder: (context) => ShopList(areaId: 13)),
                    );
                  }
                  // onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute<WebViewScreen>(
                  //       builder: (BuildContext _context) => WebViewScreen(),
                  //     ),
                  //   );
                  // },
                  // onTap: () async {
                  //   // コレクションIDとドキュメントIDを指定して取得
                  //   final document = await FirebaseFirestore.instance.collection('users').doc('id_abc').get();
                  //   List<QueryDocumentSnapshot> shopList = [];
                  //   final QuerySnapshot collection = await FirebaseFirestore.instance.collection('shop_info').get();
                  //   collection.docs.forEach((element) {shopList.add(element);});
                  //   print('##### DB TEST #####');
                  //   shopList.forEach((element) {print(element.data());});
                  //
                  //   //final document = collection.doc()
                  //   // 取得したドキュメントの情報をUIに反映
                  //   orderDocumentInfo = '${document['age']} ${document['name']}円';
                  //   await Navigator.push(
                  //       context,
                  //       //   MaterialPageRoute(
                  //       //       settings: RouteSettings(name: '/nextPage'),
                  //       //       builder: (BuildContext context) => NextPage()),
                  //       // )
                  //       MaterialPageRoute(
                  //         //builder: (context) => NextPage(),
                  //           builder: (context) => OpenContainerTransformDemo(areaName: list[i], paramText: orderDocumentInfo,shopList: shopList),
                  //       ));
                  // },
                  ),
              childCount: list.length,
            ),
          ),
        ));
  }
}
