import 'configs/config.dart';
import 'configs/importer.dart';
import 'package:smartfix119/services/app.dart';

void main() async {
  await Supabase.initialize(
    url: Config.supabaseURL,
    anonKey: Config.supabaseAnonKey,
  );
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: 'MPLUS1P',
    ),
    home: Scaffold(
      body: App(),
    ),
  ));
}