import '../configs/config.dart';
import '../configs/importer.dart';
import '../configs/auth/auth_state.dart';
import '../components/webViewXPage.dart';

class ShopDetails extends StatefulWidget {
  const ShopDetails({
    Key? key,
    required this.id,
    required this.shopName,
    required this.shopImage,
    required this.address,
    required this.access,
    required this.phone,
    required this.holiday,
    required this.hours,
    required this.shopHP,
    required this.region,
  }) : super(key: key);

  final String id;
  final String shopName;
  final String shopImage;
  final String address;
  final String access;
  final String phone;
  final String holiday;
  final String hours;
  final String shopHP;
  final String region;

  @override
  _StateShopDetails createState() => _StateShopDetails();
}

class _StateShopDetails extends AuthState<ShopDetails>
    with SingleTickerProviderStateMixin {
  var datasets = <String, dynamic>{};
  int index = 0;

  @override
  void initState() {
    super.initState();
    _shopData(widget);
  }

  void _shopData(ShopDetails widget) {
    // TODO: implement _areaData
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.mainBackColor,
      body: Stack(
        children: [
          SizedBox(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height, // * (100 / 100),
            // child: Hero(
            //   tag: '1',
            child: ListView(
              // reverse: true,
              primary: true,
              children: [
                Stack(
                  children: [
                    Image.network(
                      widget.shopImage,
                      height: MediaQuery.of(context).size.height * (50 / 100),
                      fit: BoxFit.cover,
                    ),
                    Opacity(
                      opacity: 0.3,
                      child: Container(
                        height: MediaQuery.of(context)
                            .size
                            .height, // * (150 / 100),
                        decoration: const BoxDecoration(
                          color: Color(0xFF000000),
                        ),
                        child: Text(r'''''',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            textAlign: TextAlign.left,
                            textDirection: TextDirection.ltr,
                            maxLines: 1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 200,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 24,
                              right: 24,
                              bottom: 24,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                    bottom: 16,
                                  ),
                                  padding: const EdgeInsets.only(
                                    left: 8,
                                    top: 4,
                                    right: 8,
                                    bottom: 4,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                    ),
                                  ),
                                  // NOTE: 地域
                                  child: Text(widget.region,
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          color: Color(0xFF000000),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      textAlign: TextAlign.left,
                                      textDirection: TextDirection.ltr,
                                      maxLines: 1),
                                ),
                                // NOTE: 店舗名
                                Text(widget.shopName,
                                    style: AppText.regularMainTextStyle,
                                    textAlign: TextAlign.left,
                                    textDirection: TextDirection.ltr,
                                    maxLines: 2),
                                // NOTE: 出典（店舗HP URL)
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('出典：',
                                        style: AppText.regularMainTextStyle,
                                        textAlign: TextAlign.left,
                                        textDirection: TextDirection.ltr,
                                        maxLines: 1),
                                    Text(widget.shopHP,
                                        style: AppText.regularMainTextStyle,
                                        textAlign: TextAlign.left,
                                        textDirection: TextDirection.ltr,
                                        maxLines: 2),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 16,
                              top: 24,
                              right: 16,
                            ),
                            // height: MediaQuery.of(context).size.height *
                            //     (100 / 100),
                            decoration: const BoxDecoration(
                              color: AppColor.mainBackColor,
                              image: DecorationImage(
                                  image: AssetImage(
                                      'images/background-image3.png'),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                                bottomRight: Radius.circular(0),
                                bottomLeft: Radius.circular(0),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('店舗情報',
                                    style: AppText.boldMainTextStyle,
                                    textAlign: TextAlign.left,
                                    textDirection: TextDirection.ltr,
                                    maxLines: 1),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 16,
                                    top: 16,
                                    right: 16,
                                    bottom: 16,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('住所',
                                          style: AppText.regularMainTextStyle,
                                          textAlign: TextAlign.left,
                                          textDirection: TextDirection.ltr,
                                          maxLines: 1),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 16,
                                        ),
                                        child: Text(widget.address,
                                            style: AppText.regularSubTextStyle,
                                            textAlign: TextAlign.left,
                                            textDirection: TextDirection.ltr,
                                            maxLines: 3),
                                      ),
                                      const Text('アクセス',
                                          style: AppText.regularMainTextStyle,
                                          textAlign: TextAlign.left,
                                          textDirection: TextDirection.ltr,
                                          maxLines: 1),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 16,
                                        ),
                                        child: Text(widget.access,
                                            style: AppText.regularSubTextStyle,
                                            textAlign: TextAlign.left,
                                            textDirection: TextDirection.ltr,
                                            maxLines: 3),
                                      ),
                                      const Text('営業時間',
                                          style: AppText.regularMainTextStyle,
                                          textAlign: TextAlign.left,
                                          textDirection: TextDirection.ltr,
                                          maxLines: 1),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 16,
                                        ),
                                        child: Text(widget.hours,
                                            style: AppText.regularSubTextStyle,
                                            textAlign: TextAlign.left,
                                            textDirection: TextDirection.ltr,
                                            maxLines: 1),
                                      ),
                                      const Text('定休日',
                                          style: AppText.regularMainTextStyle,
                                          textAlign: TextAlign.left,
                                          textDirection: TextDirection.ltr,
                                          maxLines: 1),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 16,
                                        ),
                                        child: Text(widget.holiday,
                                            style: AppText.regularSubTextStyle,
                                            textAlign: TextAlign.left,
                                            textDirection: TextDirection.ltr,
                                            maxLines: 1),
                                      ),
                                      const Text('電話番号',
                                          style: AppText.regularMainTextStyle,
                                          textAlign: TextAlign.left,
                                          textDirection: TextDirection.ltr,
                                          maxLines: 1),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 16,
                                        ),
                                        child: Text(widget.phone,
                                            style: AppText.regularSubTextStyle,
                                            textAlign: TextAlign.left,
                                            textDirection: TextDirection.ltr,
                                            maxLines: 1),
                                      ),
                                    ],
                                  ),
                                ),
                                const Text('修理料金',
                                    style: AppText.regularMainTextStyle,
                                    textAlign: TextAlign.left,
                                    textDirection: TextDirection.ltr,
                                    maxLines: 1),
                                const Center(
                                  child: Text(r'''データがありません。
店舗 HP をご確認ください。''',
                                      style: AppText.regularSubTextStyle,
                                      textAlign: TextAlign.center,
                                      textDirection: TextDirection.ltr,
                                      maxLines: 2),
                                ),
                                Text('アクセスマップ',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: AppColor.mainTextColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 24,
                                        fontStyle: FontStyle.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    textAlign: TextAlign.left,
                                    textDirection: TextDirection.ltr,
                                    maxLines: 1),
                                Stack(
                                  children: <Widget>[
                                    SizedBox(
                                      width: double.maxFinite,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              (24 / 100),
                                      child: const Center(
                                          child: Center(
                                            child: WebViewXPage(),
                                          )),
                                    ),
                                    SizedBox(
                                        width: double.maxFinite,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                (24 / 100),
                                        child: GestureDetector(
                                          onTap: () async {
                                            launchUrl(
                                              Uri.parse(widget.shopHP),
                                            );
                                          },
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  width: double.maxFinite,
                                  height: MediaQuery.of(context).size.height *
                                      (10 / 100),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 18,
                                      top: 18,
                                      right: 18,
                                      bottom: 18,
                                    ),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(0),
                                      ),
                                      onPressed: () async {
                                        // if (await canLaunchUrlString(
                                        //     widget.shopHP)) {
                                        //   await launchUrlString(
                                        //     widget.shopHP,
                                        //     mode: LaunchMode.inAppWebView,
                                        //   );
                                        // }
                                        launchUrl(
                                          Uri.parse(widget.shopHP),
                                        );
                                      },
                                      child: Container(
                                          width: double.maxFinite,
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF00FFA3),
                                                Color(0xFF03E1FF),
                                                Color(0xFFDC1FFF)
                                              ],
                                            ),
                                          ),
                                          padding: const EdgeInsets.all(10),
                                          child: const Text(
                                            '店舗 HP',
                                            textAlign: TextAlign.center,
                                          )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SafeArea(
                      left: false,
                      top: true,
                      right: false,
                      bottom: false,
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                top: 24,
                                left: 24,
                              ),
                              padding: const EdgeInsets.only(
                                left: 8,
                                top: 8,
                                right: 8,
                                bottom: 8,
                              ),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24),
                                  bottomRight: Radius.circular(24),
                                  bottomLeft: Radius.circular(24),
                                ),
                              ),
                              child: Icon(
                                MdiIcons.fromString('arrow-left'),
                                size: 24,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              Navigator.of(context).pop();
                            },
                            child: Opacity(
                              opacity: 0.3,
                              child: Container(
                                margin: const EdgeInsets.only(
                                  top: 24,
                                  left: 24,
                                ),
                                padding: const EdgeInsets.only(
                                  left: 8,
                                  top: 8,
                                  right: 8,
                                  bottom: 8,
                                ),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(24),
                                    topRight: Radius.circular(24),
                                    bottomRight: Radius.circular(24),
                                    bottomLeft: Radius.circular(24),
                                  ),
                                ),
                                child: Icon(
                                  MdiIcons.fromString('plus'),
                                  size: 24,
                                  color: const Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // ),
          // BottomBar
          // Positioned(left: 0, right: 0, bottom: 0, child: bottomBar()),
        ],
      ),
    );
  }
}
