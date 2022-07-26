

import '../configs/importer.dart';

class WebViewXPage extends StatefulWidget {
  const WebViewXPage({
    Key? key,
  }) : super(key: key);

  @override
  _WebViewXPageState createState() => _WebViewXPageState();
}

class _WebViewXPageState extends State<WebViewXPage> {
  late WebViewXController webviewController;
  //Size get screenSize => MediaQuery.of(context).size;

  @override
  void dispose() {
    webviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: _buildWebViewX(),
    );
  }

  Widget _buildWebViewX() {
    return WebViewX(
      key: const ValueKey('webviewx'),
      initialContent: '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3241.6168175321523!2d139.69775061744386!3d35.661811300000004!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x60188ca9b96ee9d5%3A0x49435ee33b9eea19!2z44K544Oe44Ob5L-u55CG546LIOa4i-iwt-W6lw!5e0!3m2!1sja!2sjp!4v1655813947518!5m2!1sja!2sjp" style="border:0;width:100%;filter:invert(80%);-webkit-filter:invert(80%)"></iframe>',
      initialSourceType: SourceType.html,
      height: 500,//サイズは適当
      width: 500,//サイズは適当
      onWebViewCreated: (controller) => webviewController = controller,
    );
  }

}