import '../configs/config.dart';
import '../configs/importer.dart';
import "package:latlong2/latlong.dart";
import 'package:smartfix119/services/shopDetails.dart';

// void main() => runApp(MyApp());
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   await Supabase.initialize(
//     url: Config.supabaseURL,
//     anonKey: Config.supabaseAnonKey,
//   );
//   runApp(AreaMap());
// }

class AreaMap extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

/// エラーハンドリング
extension ShowSnackBar on BuildContext {
  void showSnackBar({
    required String message,
    Color backgroundColor = Colors.white,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    ));
  }

  void showErrorSnackBar({required String message}) {
    showSnackBar(message: message, backgroundColor: Colors.red);
  }
}

class _HomePageState extends State<HomePage> {
  final PopupController _popupController = PopupController();

  late List<Marker> markers;
  late Map<String, String> shop_data;
  late List<Map<String, String>> shop_data_list;
  late int pointIndex;
  late int shop_index;
  List points = [
    LatLng(35.5040246, 138.6454937),
    // LatLng(49.8566, 3.3522),
  ];

  var _loading = false;

  Future<void> _getProfile() async {
    setState(() {
      _loading = true;
    });
    final response = await Supabase.instance.client
        .from('detail')
        .select(
            'id, shop_name,shop_image,address,access,phone,holiday,shop_hp,hours,area_id,region, map_lat, map_lng')
        .execute();

    final error = response.error;
    if (error != null && response.status != 406) {
      context.showErrorSnackBar(message: error.message);
    }
    final data = response.data;

    markers = [];
    markers.add(Marker(
      point: points[pointIndex],
      anchorPos: AnchorPos.align(AnchorAlign.center),
      height: 30,
      width: 30,
      builder: (ctx) => Icon(Icons.pin_drop),
    ));

    int count = 0;
    for (final detail in data) {
      markers.add(
        Marker(
          anchorPos: AnchorPos.align(AnchorAlign.center),
          height: 30,
          width: 30,
          point: LatLng(
              double.parse(detail['map_lat']), double.parse(detail['map_lng'])),
          builder: (ctx) => IconButton(
              icon: new Icon(Icons.pin_drop),
              onPressed: () {
                Navigator.push<void>(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShopDetails(
                            id: detail['id'].toString(),
                            shopName: detail['shop_name'].toString(),
                            shopImage: detail['shop_image'].toString(),
                            address: detail['address'].toString(),
                            access: detail['access'].toString(),
                            phone: detail['phone'].toString(),
                            holiday: detail['holiday'].toString(),
                            hours: detail['hours'].toString(),
                            shopHP: detail['shop_hp'].toString(),
                            region: detail['region'].toString())));
              }),
        ),
      );
    }

    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    // final data = _getProfile();
    pointIndex = 0;

    _getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('地図から探す'),
      ),
      // resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFF000000),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pointIndex++;
          if (pointIndex >= points.length) {
            pointIndex = 0;
          }
          setState(() {
            markers[0] = Marker(
              point: points[pointIndex],
              anchorPos: AnchorPos.align(AnchorAlign.center),
              height: 30,
              width: 30,
              builder: (ctx) => Icon(Icons.pin_drop),
            );
            markers = List.from(markers);
          });
        },
        child: Icon(Icons.refresh),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: points[0],
          zoom: 5,
          maxZoom: 15,
          plugins: [
            MarkerClusterPlugin(),
          ],
          onTap: (_, __) => _popupController
              .hideAllPopups(), // Hide popup when the map is tapped.
        ),
        children: <Widget>[
          TileLayerWidget(
            options: TileLayerOptions(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c'],
            ),
          ),
          MarkerClusterLayerWidget(
            options: MarkerClusterLayerOptions(
              spiderfyCircleRadius: 80,
              spiderfySpiralDistanceMultiplier: 2,
              circleSpiralSwitchover: 12,
              maxClusterRadius: 120,
              rotate: true,
              size: const Size(40, 40),
              anchor: AnchorPos.align(AnchorAlign.center),
              fitBoundsOptions: const FitBoundsOptions(
                padding: EdgeInsets.all(50),
                maxZoom: 15,
              ),
              markers: markers,
              polygonOptions: const PolygonOptions(
                  borderColor: Colors.blueAccent,
                  color: Colors.black12,
                  borderStrokeWidth: 3),

              /// ポップアップは次フェーズで実装
              // popupOptions: PopupOptions(
              //     popupSnap: PopupSnap.markerTop,
              //     popupController: _popupController,
              //     popupBuilder: (_, marker) =>
              //         Container(
              //           width: 200,
              //           height: 100,
              //           color: Colors.white,
              //           child: GestureDetector(
              //             onTap: () => debugPrint('Popup tap!'),
              //             child: Text('Container popup for marker at',),
              //           ),
              //         )
              // ),
              /// 店舗をまとめたサークルの作成
              builder: (context, markers) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.blue),
                  child: Center(
                    child: Text(
                      markers.length.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
