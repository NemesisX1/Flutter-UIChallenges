import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'widgets/creditCard.dart';
import 'widgets/carouselCircle.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    Key? key,
    this.withDivider = true,
    required this.amount,
    required this.date,
    required this.title,
    required this.subtitle,
    required this.icon,
  }) : super(key: key);
  final bool withDivider;
  final String? title;
  final String? subtitle;
  final String? amount;
  final String? date;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 10,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  this.icon,
                  color: Theme.of(context).accentColor,
                ),
              ),
              Gap(10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.title!,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(5),
                  Text(
                    this.subtitle!,
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    this.amount!,
                    style: TextStyle(
                      color: this.amount![0] == "-" ? Colors.red : Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(5),
                  Text(
                    this.date!,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Gap(5),
          this.withDivider
              ? Divider(
                  thickness: 1.1,
                  color: Colors.grey.withOpacity(0.15),
                )
              : Container(),
        ],
      ),
    );
  }
}

class _HomeViewState extends State<HomeView> {
  CarouselController buttonCarouselController = CarouselController();
  int active = 0;

  @override
  Widget build(BuildContext context) {
    final double radius = MediaQuery.of(context).size.height * (0.01);

    List<Widget> circle = [
      CarouselCircle(
        isActive: active == 0 ? true : false,
        radius: radius,
      ),
      CarouselCircle(
        isActive: active == 1 ? true : false,
        radius: radius,
      ),
      CarouselCircle(
        isActive: active == 2 ? true : false,
        radius: radius,
      ),
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(kToolbarHeight, 70),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Back,",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "Junior Medehou",
                          style: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Stack(
                      children: [
                        Icon(
                          FontAwesomeIcons.bell,
                          color: Colors.grey,
                        ),
                        Positioned(
                          left: 11,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(10),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          'https://randomuser.me/api/portraits/men/15.jpg',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Column(
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1.5,
                  height: MediaQuery.of(context).size.height * (0.3),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  onPageChanged: (index, reason) {
                    setState(() {
                      active = index;
                    });
                  },
                ),
                items: <Widget>[
                  CreditCard(),
                  CreditCard(),
                  CreditCard(),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: Wrap(
                  direction: Axis.horizontal,
                  children: circle,
                  spacing: 10,
                ),
              ),
            ],
          ),
          Gap(15),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor.withOpacity(0.05),
              ),
              padding: EdgeInsets.only(
                top: 10,
                left: 25,
                right: 25,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recent Transactions",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "See all",
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(top: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          TransactionTile(
                            icon: FontAwesomeIcons.dropbox,
                            title: "Dropdown Plan",
                            subtitle: "Subscription",
                            amount: "-\$144.00",
                            date: "18 Sept 2019",
                          ),
                          TransactionTile(
                            icon: FontAwesomeIcons.music,
                            title: "Spotify Subscr.",
                            subtitle: "Subscription",
                            amount: "-\$24.00",
                            date: "12 Sept 2019",
                          ),
                          TransactionTile(
                            icon: FontAwesomeIcons.youtube,
                            title: "Youtube Ads.",
                            subtitle: "Income",
                            amount: "+\$32.00",
                            date: "10 Sept 2019",
                            withDivider: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
