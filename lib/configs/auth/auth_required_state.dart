import '../importer.dart';

class AuthRequiredState<T extends StatefulWidget>
      extends SupabaseAuthRequiredState<T> {
    @override
    void onUnauthenticated() {
      Navigator.pushNamedAndRemoveUntil(context, '/null', (route) => false);
    }
  }
  