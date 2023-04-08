import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:niyi/utils/config.dart';

class Doctorcard extends StatelessWidget {
  const Doctorcard({Key? key, required this.route}) : super(key: key);

  final String route;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 150,
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.2),
                Colors.green.withOpacity(0.2),
              ],
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Card(
                elevation: 0,
                color: Colors.white.withOpacity(0.1),
                child: Row(
                  children: [
                    SizedBox(
                      width: Config.widthSize * 0.33,
                      child: Image.asset(
                        'assets/images/doc1.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Dr smith',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'Dental',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const <Widget>[
                                Icon(
                                  Icons.star_border,
                                  color: Colors.yellow,
                                  size: 16,
                                ),
                                Spacer(
                                  flex: 1,
                                ),
                                Text('4.5'),
                                Spacer(
                                  flex: 1,
                                ),
                                Text('Reviews'),
                                Spacer(
                                  flex: 1,
                                ),
                                Text('(20)'),
                                Spacer(
                                  flex: 7,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).pushNamed(route);
        },
      ),
    );
  }
}
