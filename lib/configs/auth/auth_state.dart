import '../importer.dart';

class AuthState<T extends StatefulWidget> extends SupabaseAuthState<T> {
    @override
    void onUnauthenticated() {
      Navigator.pushNamedAndRemoveUntil(context, '/null', (route) => false);
    }

    @override
    void onAuthenticated(Session session) {
      Navigator.pushNamedAndRemoveUntil(context, '/null', (route) => false);
    }

    @override
    void onPasswordRecovery(Session session) {
      Navigator.pushNamedAndRemoveUntil(
          context, '/null', (route) => false);
    }

    @override
    void onErrorAuthenticating(String message) {
      print('***** onErrorAuthenticating: $message');
    }
  }
  