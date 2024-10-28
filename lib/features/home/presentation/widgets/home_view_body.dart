import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/core/helpers/spacing.dart';
import 'package:movie/core/utils/custom_text_style.dart';
import 'package:movie/core/utils/my_colors.dart';
import 'package:movie/features/home/presentation/widgets/item_list_view_vertical.dart';
import 'package:movie/features/home/presentation/widgets/list_view_bulder.dart';
import 'heders_icons.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  _HomeViewBodyState createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int _currentIndex = 0;

  // Define different views for each tab
  final List<Widget> _views = [
    HomeContentView(),   // Main content for "Home" tab
    TicketsView(),       // Replace this with actual widget for "Tickets" tab
    BookmarksView(),     // Replace this with actual widget for "Bookmarks" tab
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _views,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/bookmark.svg',
              height: 15,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/bookmark-1.svg',
              height: 15,
            ),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/bookmark-2.svg',
              height: 15,
            ),
            label: 'Bookmarks',
          ),
        ],
      ),
    );
  }
}

// Content widgets for each tab

class HomeContentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, left: 16, right: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          stops: const [0.6, 0.5],
          colors: [
            MyColors.primary,
            MyColors.bg.withOpacity(0.2),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderIcons(),
          verticalSpace(10),

          // Now Showing Row with See More button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Now Showing',
                style: CustomTextStyles.text20Black,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  backgroundColor: Colors.grey.withOpacity(.25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Creates the egg shape
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SeeMoreView()),
                  );
                },
                child: Text(
                  'See More',
                  style: CustomTextStyles.text16Black.copyWith(
                    color: Colors.black, // Text color
                    fontSize: 12,        // Smaller font size
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(6),
          const ShowingListViewWidget(),
          verticalSpace(6),

          // Popular Row with See More button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular',
                style: CustomTextStyles.text20Black,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  backgroundColor: Colors.grey.withOpacity(.25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Creates the egg shape
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SeeMoreView()),
                  );
                },
                child: Text(
                  'See More',
                  style: CustomTextStyles.text16Black.copyWith(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const Expanded(child: ItemListViewVertical()),
        ],
      ),
    );
  }
}

// See More View for displaying additional items
class SeeMoreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('See More'),
      ),
      body: Center(
        child: Text('More items coming soon!'), // Replace with actual content
      ),
    );
  }
}

class TicketsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Tickets View'),
    );
  }
}

class BookmarksView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Bookmarks View'),
    );
  }
}
