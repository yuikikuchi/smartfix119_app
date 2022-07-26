import '../configs/config.dart';
import '../configs/importer.dart';
import '../configs/auth/auth_state.dart';

import 'package:smartfix119/services/shopDetails.dart';

class ShopList extends StatefulWidget {
  const ShopList({
    Key? key,
    required this.areaId,
  }) : super(key: key);

  final int areaId;

  @override
  _StateShopList createState() => _StateShopList();
}

class _StateShopList extends AuthState<ShopList>
    with SingleTickerProviderStateMixin {
  var datasets = <String, dynamic>{};
  int index = 0;

  @override
  void initState() {
    super.initState();
    _areaData(widget.areaId);
  }

  void _areaData(int areaId) {
    // TODO: implement _areaData
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainBackColor,
      appBar: AppBar(
        title: const Text('戻る'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/background-image.png'),
              fit: BoxFit.cover,
            )),
            width: double.maxFinite,
            child: SizedBox(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height,
              child: FutureBuilder(
                  future: Supabase.instance.client
                      .from('detail')
                      .select(
                          'id, shop_name,shop_image,address,access,phone,holiday,shop_hp,hours,area_id,region')
                      .eq('area_id', widget.areaId)
                      // .order('')
                      // .range((1 * 0) - 1, 1 * 15)
                      .execute(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print('非同期処理終了:');
                      // return snapshot.hasData;
                    } else {
                      print('非同期処理中...');
                      return Center(
                          // width: 30,
                          /// ローディングアニメーションを表示
                          child: LoadingAnimationWidget.staggeredDotsWave(
                        color: AppColor.mainTextColor,
                        size: 100,
                      ));
                    }
                    final doc = snapshot.data as PostgrestResponse?;
                    if (doc == null) return const SizedBox();
                    final datasets = this.datasets;
                    datasets['Info'] =
                        doc.data as List<dynamic>? ?? <dynamic>[];

                    List<Widget> cards =
                        List.generate(datasets['Info'].length, (int index) {
                      return Container(
                        child: GestureDetector(
                          onTap: () async {
                            await Navigator.push<void>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShopDetails(
                                  id: datasets['Info'][index]['id'].toString(),
                                  shopName: datasets['Info'][index]['shop_name']
                                      .toString(),
                                  shopImage: datasets['Info'][index]
                                          ['shop_image']
                                      .toString(),
                                  address: datasets['Info'][index]['address']
                                      .toString(),
                                  access: datasets['Info'][index]['access']
                                      .toString(),
                                  phone: datasets['Info'][index]['phone']
                                      .toString(),
                                  holiday: datasets['Info'][index]['holiday']
                                      .toString(),
                                  hours: datasets['Info'][index]['hours']
                                      .toString(),
                                  shopHP: datasets['Info'][index]['shop_hp']
                                      .toString(),
                                  region: datasets['Info'][index]['region']
                                      .toString(),
                                ),
                              ),
                            );
                          },
                          // child: Hero(
                          //     tag: '1',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.maxFinite,
                                height: MediaQuery.of(context).size.height *
                                    (30 / 100),
                                child: Image.network(
                                  datasets['Info'][index]['shop_image'],
                                  width: double.maxFinite,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: double.maxFinite,
                                height: MediaQuery.of(context).size.height *
                                    (42 / 100),
                                child: Container(
                                  width: double.maxFinite,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF000000),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: double.maxFinite,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                (4 / 100),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(r'''出典：''',
                                                style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                    color: Color(0xFFFFFFFF),
                                                    fontWeight: FontWeight.w100,
                                                    fontSize: 12,
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 1),
                                            Text(
                                                datasets['Info'][index]
                                                        ['shop_hp']
                                                    .toString(),
                                                style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                    color: Color(0xFFFFFFFF),
                                                    fontWeight: FontWeight.w100,
                                                    fontSize: 12,
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 2),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: double.maxFinite,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                (10 / 100),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 4,
                                            right: 4,
                                          ),
                                          child: Text(
                                              datasets['Info'][index]
                                                      ['shop_name']
                                                  .toString(),
                                              style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                  color: Color(0xFFFFFFFF),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 24,
                                                  fontStyle: FontStyle.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                              textAlign: TextAlign.left,
                                              textDirection: TextDirection.ltr,
                                              maxLines: 2),
                                        ),
                                      ),
                                      SizedBox(
                                        width: double.maxFinite,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                (22 / 100),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 16,
                                            right: 16,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(r'''住所''',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                      color: Color(0xFFFFFFFF),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      decoration:
                                                          TextDecoration.none,
                                                    ),
                                                  ),
                                                  textAlign: TextAlign.left,
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  maxLines: 1),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 16,
                                                ),
                                                child: Text(
                                                    datasets['Info'][index]
                                                            ['address']
                                                        .toString(),
                                                    style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                        color:
                                                            Color(0xFFFFFFFF),
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 16,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        decoration:
                                                            TextDecoration.none,
                                                      ),
                                                    ),
                                                    textAlign: TextAlign.left,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    maxLines: 3),
                                              ),
                                              Text(r'''営業時間''',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                      color: Color(0xFFFFFFFF),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      decoration:
                                                          TextDecoration.none,
                                                    ),
                                                  ),
                                                  textAlign: TextAlign.left,
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  maxLines: 1),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 16,
                                                ),
                                                child: Text(
                                                    datasets['Info'][index]
                                                            ['hours']
                                                        .toString(),
                                                    style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                        color:
                                                            Color(0xFFFFFFFF),
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 16,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        decoration:
                                                            TextDecoration.none,
                                                      ),
                                                    ),
                                                    textAlign: TextAlign.left,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    maxLines: 1),
                                              ),
                                              Text(r'''定休日''',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                      color: Color(0xFFFFFFFF),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      decoration:
                                                          TextDecoration.none,
                                                    ),
                                                  ),
                                                  textAlign: TextAlign.left,
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  maxLines: 1),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 16,
                                                ),
                                                child: Text(
                                                    datasets['Info'][index]
                                                            ['holiday']
                                                        .toString(),
                                                    style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                        color:
                                                            Color(0xFFFFFFFF),
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 16,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        decoration:
                                                            TextDecoration.none,
                                                      ),
                                                    ),
                                                    textAlign: TextAlign.left,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    maxLines: 1),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // SizedBox(
                                      //   width: double.maxFinite,
                                      //   height: MediaQuery.of(context)
                                      //       .size
                                      //       .height *
                                      //       (2 / 100),
                                      //   child: Center(
                                      //     child: Align(
                                      //       // alignment: null,
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // )
                      );
                    });

                    return Builder(builder: (context) {
                      return TCard(
                          onForward: (index, info) async {},
                          lockYAxis: false,
                          slideSpeed: 20,
                          delaySlideFor: 500,
                          cards: cards

                          // cards: (datasets['Supabase future builder']
                          // as List<dynamic> ??
                          //     <dynamic>[])
                          //     .map((e) => GestureDetector(
                          //   // onTap: () async {
                          //   //   await Navigator.push<void>(
                          //   //     context,
                          //   //     MaterialPageRoute(
                          //   //       builder: (context) => shopDetails(
                          //   //         id: datasets[
                          //   //         'Supabase future builder']
                          //   //         ?[_index]?['id'] ??
                          //   //             '',
                          //   //         shopName: datasets[
                          //   //         'Supabase future builder']
                          //   //         ?[_index]?['shop_name'] ??
                          //   //             '',
                          //   //         shopImage: datasets[
                          //   //         'Supabase future builder']
                          //   //         ?[index]?['shop_image'] ??
                          //   //             '',
                          //   //         address: datasets[
                          //   //         'Supabase future builder']
                          //   //         ?[index]?['address'] ??
                          //   //             '',
                          //   //         access: datasets[
                          //   //         'Supabase future builder']
                          //   //         ?[index]?['access'] ??
                          //   //             '',
                          //   //         phone: datasets[
                          //   //         'Supabase future builder']
                          //   //         ?[index]?['phone'] ??
                          //   //             '',
                          //   //         holiday: datasets[
                          //   //         'Supabase future builder']
                          //   //         ?[index]?['holiday'] ??
                          //   //             '',
                          //   //         hours: datasets[
                          //   //         'Supabase future builder']
                          //   //         ?[index]?['hours'] ??
                          //   //             '',
                          //   //         shopHP: datasets[
                          //   //         'Supabase future builder']
                          //   //         ?[index]?['shop_hp'] ??
                          //   //             '',
                          //   //         region: datasets[
                          //   //         'Supabase future builder']
                          //   //         ?[index]?['region'] ??
                          //   //             '',
                          //   //       ),
                          //   //     ),
                          //   //   );
                          //   // },
                          // ))
                          //     .toList(),
                          );
                    });
                  }),
            ),
          ),
          // BottomBar
          // Positioned(left: 0, right: 0, bottom: 0, child: bottomBar()),
        ],
      ),
      // bottomNavigationBar: test(),
    );
  }
}
