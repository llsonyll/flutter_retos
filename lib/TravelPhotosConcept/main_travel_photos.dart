import 'package:flutter/material.dart';

class MainTravelPhotosConcept extends StatefulWidget {
  const MainTravelPhotosConcept({Key key}) : super(key: key);

  @override
  _MainTravelPhotosConceptState createState() =>
      _MainTravelPhotosConceptState();
}

class _MainTravelPhotosConceptState extends State<MainTravelPhotosConcept> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final topCardHeight = size.height / 2;
    final horizontalListHeight = 160.0;
    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              height: topCardHeight,
              left: 0,
              right: 0,
              child: Placeholder(),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: topCardHeight - horizontalListHeight / 2,
              height: horizontalListHeight,
              child: TravelPhotosList(),
            ),
          ],
        ),
      ),
    );
  }
}

class TravelPhotosList extends StatefulWidget {
  @override
  _TravelPhotosListState createState() => _TravelPhotosListState();
}

class _TravelPhotosListState extends State<TravelPhotosList> {
  final items = List.generate(10, (index) => index);

  final _animatedListKey = GlobalKey<AnimatedListState>();

  final _pageController = PageController();

  double page = 0.0;

  void _listenScroll() {
    setState(() {
      page = _pageController.page;
    });
  }

  @override
  void initState() {
    _pageController.addListener(_listenScroll);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_listenScroll);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _animatedListKey,
      physics: PageScrollPhysics(),
      controller: _pageController,
      itemBuilder: (context, index, animation) {
        final itemInteger = items[index];
        print(page);
        return InkWell(
          onTap: () {
            items.insert(items.length, itemInteger);
            _animatedListKey.currentState.insertItem(items.length - 1);
            final itemDelete = itemInteger;
            items.removeAt(index);
            _animatedListKey.currentState.removeItem(
              index,
              (context, animation) => FadeTransition(
                opacity: animation,
                child: SizeTransition(
                  sizeFactor: animation,
                  axis: Axis.horizontal,
                  child: TravelPhotoItem(
                    index: itemDelete,
                  ),
                ),
              ),
            );
          },
          child: TravelPhotoItem(
            index: itemInteger,
          ),
        );
      },
      scrollDirection: Axis.horizontal,
      initialItemCount: items.length,
    );
  }
}

class TravelPhotoItem extends StatelessWidget {
  final int index;
  const TravelPhotoItem({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      color: Colors.primaries[index % Colors.primaries.length],
      width: 150,
      child: FittedBox(
        child: Text(index.toString()),
      ),
    );
  }
}
