import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:migrant/components/resently_searched_card.dart';
import 'package:migrant/components/search_top_modal.dart';

class SearchMain extends StatelessWidget {
  const SearchMain({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.white,
          //   title: const Text('Search'),
          // ),
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            reverse: true,
            child: Padding(
                padding: const EdgeInsets.all(0),
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(16),
                        right: Radius.circular(16),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff78909c),
                            spreadRadius: 0,
                            blurRadius: 12),
                      ],
                    ),
                    child: SearchTopModal(
                      // get data from navigator and pass to data
                      onConfirm: () {
                        Navigator.pushNamed(context, "/home-page");
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Recently Searched",
                    style: TextStyle(fontSize: 18, color: Color(0xff90a4ae)),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 440,
                    //color transparent
                    color: Colors.transparent,
                    child: const SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          // resently searched trip
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                ResentlySearchedCard(),
                                SizedBox(
                                  height: 16,
                                ),
                                ResentlySearchedCard(),
                                SizedBox(
                                  height: 16,
                                ),
                                ResentlySearchedCard(),
                                SizedBox(
                                  height: 16,
                                ),
                                ResentlySearchedCard(),
                                SizedBox(
                                  height: 16,
                                ),
                                ResentlySearchedCard(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ])),
          ),
        ),
      ),
    );
  }
}
