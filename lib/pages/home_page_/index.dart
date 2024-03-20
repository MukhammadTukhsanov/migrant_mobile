import 'package:flutter/material.dart';
import 'package:migrant/components/trip_card/trip_card_item.dart';
import 'package:migrant/components/trip_card/trip_card_item_model.dart';
import 'package:migrant/pages/home_page_/home_page_header_card/index.dart';
import 'package:migrant/pages/skelton/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: 222,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            floating: false,
            elevation: 1,
            stretch: false,
            flexibleSpace: FlexibleSpaceBar(
              background: HomePageHeader(),
            ),
          ),
        ],
        body: _isLoading
            ? ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => const TripCardSkelton(),
              )
            : ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) => TripCard(
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
      ),
    );
  }
}
