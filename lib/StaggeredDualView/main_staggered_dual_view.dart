import 'package:flutter/material.dart';

import 'meal.dart';

class MainStaggeredDualView extends StatelessWidget {
  const MainStaggeredDualView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Meals', style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: StaggeredDualView(
            aspectRatio: 0.7,
            spacing: 40,
            itemBuilder: (context, index) => MealItem(meal: meals[index]),
            itemCount: meals.length,
          ),
        ),
      ),
    );
  }
}

class MealItem extends StatelessWidget {
  final Meal meal;
  const MealItem({Key key, @required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 10,
      shadowColor: Colors.black26,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ClipOval(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    meal.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            Expanded(
              child: Column(
                children: [
                  Text(
                    meal.name,
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    meal.weight,
                    maxLines: 1,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => Icon(
                        index < 4 ? Icons.star_rate : Icons.star_border,
                        color: Colors.yellow,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StaggeredDualView extends StatelessWidget {
  final double percentDesnivel;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final double spacing;
  final double aspectRatio;
  const StaggeredDualView(
      {Key key,
      @required this.itemBuilder,
      @required this.itemCount,
      this.spacing = 0.0,
      this.aspectRatio = 0.5,
      this.percentDesnivel = 0.5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      final itemHeight = (width * 0.5) / aspectRatio;
      final height = constraints.maxHeight + itemHeight;

      return OverflowBox(
        maxWidth: width,
        minWidth: width,
        maxHeight: height,
        minHeight: height,
        child: GridView.builder(
          padding: EdgeInsets.only(top: itemHeight / 2, bottom: itemHeight / 2),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: aspectRatio,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
          ),
          /* itemBuilder: itemBuilder, */
          itemBuilder: (context, index) => Transform.translate(
            offset:
                Offset(0.0, index.isOdd ? itemHeight * percentDesnivel : 0.0),
            child: itemBuilder(context, index),
          ),
          itemCount: itemCount,
        ),
      );
    });
  }
}
