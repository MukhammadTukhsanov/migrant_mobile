import 'package:flutter/material.dart';
import 'package:migrant/components/date_picker.dart';
import 'package:migrant/pages/home_page/choose_country_input.dart';
import 'package:migrant/pages/home_page/home_page_header_card/index.dart';
import 'package:migrant/pages/home_page/trip_card/trip_card_item.dart';
import 'package:migrant/pages/home_page/trip_card/trip_card_item_model.dart';
import 'package:migrant/skelton/index.dart';

class HomePageSliver extends StatefulWidget {
  const HomePageSliver({super.key});

  @override
  State<HomePageSliver> createState() => _HomePageSliverState();
}

class _HomePageSliverState extends State<HomePageSliver> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: BorderSide.strokeAlignCenter,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Image.asset(
              'assets/images/exLogo.png',
            ),
          ),
          leadingWidth: 146,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Container(
              color: Colors.blueGrey,
              height: 1,
            ),
          ),
          actions: [
            IconButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.all(8),
                ),
              ),
              icon: const Icon(Icons.search, color: Colors.blueGrey),
              onPressed: () {},
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              clipBehavior: Clip.hardEdge,
              expandedHeight: 222,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              floating: true,
              elevation: 0,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                background: HomePageHeader(),
              ),
            ),
            // double app bar
            SliverList(
              delegate: _isLoading
                  ? SliverChildListDelegate(List.generate(
                      5,
                      (index) => const Padding(
                        // ignore: unnecessary_const
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: TripCardSkelton(),
                      ),
                    ))
                  : SliverChildListDelegate(List.generate(
                      20,
                      (index) => Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: TripCard(
                          card: TripCardItemModel(
                            price: "149 000",
                            startDate: "22 : 30",
                            endDate: "06 : 30",
                            countOfFreeSeats: "4",
                            endLocation: "Moscow",
                            startLocation: "Saint Petersburg",
                            user: 'Alisher Haidarov',
                          ),
                        ),
                      ),
                    )),
            ),
          ],
        ));
  }
}
