import '../configs/config.dart';
import '../configs/importer.dart';
import '../configs/auth/auth_state.dart';
import '../components/articleCard.dart';

class Brog extends StatefulWidget {
  const Brog({
    Key? key,
  }) : super(key: key);

  @override
  _StateBrog createState() => _StateBrog();
}

class _StateBrog extends AuthState<Brog> with SingleTickerProviderStateMixin {
  var datasets = <String, dynamic>{};
  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainBackColor,
      appBar: AppBar(
        title: const Text('ブログ'),
      ),
      // resizeToAvoidBottomInset: true,
      body: Stack(children: [
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
                    .from('note')
                    .select(
                        'id,note_title,note_url,note_image,note_category,note_auther,note_auther_image,note_date')
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
                      color: Colors.white,
                      size: 100,
                    ));
                  }
                  final doc = snapshot.data as PostgrestResponse?;
                  if (doc == null) return const SizedBox();
                  final datasets = this.datasets;
                  datasets['NoteInfo'] =
                      doc.data as List<dynamic>? ?? <dynamic>[];

                  return SizedBox(
                    height: MediaQuery.of(context).size.height * (80 / 100),
                    child: Builder(
                      builder: (context) {
                        return ListView.builder(
                          // reverse: true,
                          shrinkWrap: true,
                          itemCount: datasets['NoteInfo'].length > 0
                              ? datasets['NoteInfo'].length
                              : 0,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                top: 24,
                              ),
                              child: GestureDetector(
                                onTap: () async {
                                  launchUrl(
                                    Uri.parse(datasets['NoteInfo'][index]
                                            ['note_url']
                                        .toString()),
                                  );
                                },
                                child: articleCard(
                                  articleImage: datasets['NoteInfo'][index]
                                          ['note_image']
                                      .toString(),
                                  category: datasets['NoteInfo'][index]
                                          ['note_category']
                                      .toString(),
                                  title: datasets['NoteInfo'][index]
                                          ['note_title']
                                      .toString(),
                                  authorImage: datasets['NoteInfo'][index]
                                          ['note_auther_image']
                                      .toString(),
                                  authorName: datasets['NoteInfo'][index]
                                          ['note_auther']
                                      .toString(),
                                  articleDate: datasets['NoteInfo'][index]
                                          ['note_date']
                                      .toString(),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                }),
          ),
        ),
      ]),
    );
  }
}
