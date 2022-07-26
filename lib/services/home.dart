import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import '../configs/config.dart';

// import 'backup/homepage.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'SmartFix119',
      home: _Home(),
    );
  }
}

class _Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.mainBackColor,
        appBar: NewGradientAppBar(
          title: const Text('SmartFix119'),
          gradient: const LinearGradient(
            colors: [Color(0xFF00FFA3), Color(0xFF03E1FF), Color(0xFFDC1FFF)],
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/background-image.png'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: const Color(0xff5a348b),
                    gradient: const LinearGradient(
                        colors: [Color(0xFF00FFA3), Color(0xFFDC1FFF)],
                        // begin: Alignment.centerRight,
                        // end: Alignment(-1.0, -3.0)
                    ), //Gradient
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //Text
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: Icon(
                                              FontAwesomeIcons.dropbox,
                                              color: new Color(0xffffffff),
                                              size: 40.0,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            'Plus',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: Text(
                                              '\u00244.99/month',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          //Two Column Table
                          DataTable(
                            columns: <DataColumn>[
                              DataColumn(
                                label: Text(
                                  'Storage',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  '1TB',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                            rows: <DataRow>[
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Smart synchronization',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(
                                    FontAwesomeIcons.times,
                                    color: Colors.white54,
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Full text search',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(
                                    FontAwesomeIcons.times,
                                    color: Colors.white54,
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Folders without connection',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(FontAwesomeIcons.check,
                                      color: new Color(0xffffffff)),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Uploads from camera',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(FontAwesomeIcons.check,
                                      color: new Color(0xffffffff)),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Scanning of documents',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(FontAwesomeIcons.check,
                                      color: new Color(0xffffffff)),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    '24/7 Support',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(
                                    FontAwesomeIcons.times,
                                    color: Colors.white54,
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Custom Email',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(FontAwesomeIcons.check,
                                      color: new Color(0xffffffff)),
                                ),
                              ]),
                            ],
                          ),

                          //Button
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                                color: new Color(0xffffffff),
                                child: Text(
                                  'Get Started',
                                  style: TextStyle(
                                    color: new Color(0xffde4d2a),
                                  ),
                                ),
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
