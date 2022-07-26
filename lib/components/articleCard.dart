import '../configs/importer.dart';
import '../configs/auth/auth_state.dart';

class articleCard extends StatefulWidget {
  const articleCard({
    Key? key,
    this.articleImage =
    '''https://assets.st-note.com/production/uploads/images/78468026/rectangle_large_type_2_de519d8d64197708c313d7f8a8501f49.png?width=800''',
    this.category = '''note''',
    this.title = '''スマホの毎月の補償代を見直す話''',
    this.authorImage =
    '''https://assets.st-note.com/production/uploads/images/78578787/profile_c607d18980d7ea12e252e9dcf64bea04.jpeg''',
    this.authorName = '''スマホの先生トーイ''',
    this.articleDate = '''2022/05/14''',
  }) : super(key: key);

  final String articleImage;
  final String category;
  final String title;
  final String authorImage;
  final String authorName;
  final String articleDate;

  @override
  _StateArticleCard createState() => _StateArticleCard();
}

class _StateArticleCard extends AuthState<articleCard>
    with SingleTickerProviderStateMixin {
  var datasets = <String, dynamic>{};
  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Card(
            elevation: 10,
            color: Color(0xFFFFFFFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                        bottomRight: Radius.circular(0),
                        bottomLeft: Radius.circular(0),
                      ),
                      child: Image.network(
                        '''${widget.articleImage}''',
                        height: MediaQuery.of(context).size.height * (30 / 100),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Opacity(
                      opacity: 0.2,
                      child: Container(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        height: MediaQuery.of(context).size.height * (30 / 100),
                        decoration: BoxDecoration(
                          color: const Color(0xFF000000),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                            bottomRight: Radius.circular(0),
                            bottomLeft: Radius.circular(0),
                          ),
                          border: Border(
                            left: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                                color: Color(0xFF000000)),
                            top: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                                color: Color(0xFF000000)),
                            right: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                                color: Color(0xFF000000)),
                            bottom: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                                color: Color(0xFF000000)),
                          ),
                        ),
                        child: Text('',
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
                    SizedBox(
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height * (30 / 100),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 24,
                          right: 24,
                          bottom: 24,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
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
                                border: Border(
                                  left: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                      color: Color(0xFF000000)),
                                  top: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                      color: Color(0xFF000000)),
                                  right: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                      color: Color(0xFF000000)),
                                  bottom: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                      color: Color(0xFF000000)),
                                ),
                              ),
                              child: Text('widget.category',
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
                            Text('widget.title',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 24,
                                    fontStyle: FontStyle.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                textAlign: TextAlign.left,
                                textDirection: TextDirection.ltr,
                                maxLines: 3),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    top: 16,
                    bottom: 16,
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                          bottomLeft: Radius.circular(24),
                        ),
                        child: Image.network(
                          '''${widget.authorImage}''',
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('''${widget.authorName}''',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: const Color(0xFF000000),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                textAlign: TextAlign.left,
                                textDirection: TextDirection.ltr,
                                maxLines: 1),
                            Text('''${widget.articleDate}''',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: const Color(0xFF888888),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                textAlign: TextAlign.left,
                                textDirection: TextDirection.ltr,
                                maxLines: 1),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
