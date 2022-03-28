import 'package:flutter/material.dart';
import 'package:s2_ecommerce/screens/dragon_fruit_screen.dart';
import 'package:s2_ecommerce/screens/special_deal_child_screen.dart';

import '../constants/colors.dart';
import '../models/category.dart';
import '../utils/screen_utils.dart';
import '../widgets/custom_nav_bar.dart';
import '../widgets/deal_card.dart';
import '../widgets/indi_deal_card.dart';
import '../widgets/tab_title.dart';
import '../widgets/category_card.dart';
import './search_screen.dart';
import './category_screen.dart';
import './popular_deals_screen.dart';
import './special_deal_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Category> categories = [
    Category(
      'Vegetables',
      'assets/images/vegetable_home.png',
      kAccentGreen,
    ),
    Category(
      'Fruits',
      'assets/images/fruit_home.png',
      kAccentRed,
    ),
    Category(
      'Milks & Egg',
      'assets/images/egg_home.png',
      kAccentYellow,
    ),
    Category(
      'Meat',
      'assets/images/meat_home.png',
      kAccentPurple,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Spacer(),
        HomeAppBar(),
        Spacer(),
        CategoryTab(categories: categories),
        Spacer(),
        DealsTab(),
        Spacer(),
        PopularDealTab(),
      ],
    );
  }
}

class PopularDealTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 10,
      child: Column(
        children: [
          TabTitle(
              title: 'Popular Deals',
              seeAll: () {
                Navigator.of(context).pushNamed(PopularDealsScreen.routeName);
              }),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: getProportionateScreenWidth(8),
              ),
              itemCount: 2,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushNamed(DragonFruitScreen.routeName),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: IndiDealCard(
                      isLeft: true,
                      isSelected: true,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class DealsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabTitle(
            title: 'Special Deals for You',
            seeAll: () {
              Navigator.of(context).pushNamed(SpecialDealScreen.routeName);
            }),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              DealCard(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(SpecialDealChildScreen.routeName);
                },
              ),
              DealCard(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(SpecialDealChildScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    Key key,
    @required this.categories,
  }) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(16.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Categories',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CategoryScreen.routeName);
                },
                child: Text(
                  'See All',
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              categories.length,
              (index) => CategoryCard(categories[index]),
            ),
          )
        ],
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(
          16,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Md Imran Hossain',
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                Text(
                  '50/A Toyanbee Circular Road, Hatkhola, Dhaka-1203',
                  style: TextStyle(
                    color: kTextColorAccent,
                    fontSize: getProportionateScreenWidth(
                      12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(SearchScreen.routeName);
            },
            child: Icon(
              Icons.search,
              color: kPrimaryGreen,
            ),
          ),
        ],
      ),
    );
  }
}
