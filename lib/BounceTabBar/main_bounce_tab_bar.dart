import 'package:flutter/material.dart';

class MainBounceTabBar extends StatefulWidget {
  const MainBounceTabBar({Key key}) : super(key: key);

  @override
  _MainBounceTabBarState createState() => _MainBounceTabBarState();
}

class _MainBounceTabBarState extends State<MainBounceTabBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          'Bounche Tab Bar',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Container(color: Colors.redAccent),
          Container(color: Colors.yellowAccent),
          Container(color: Colors.blueAccent),
          Container(color: Colors.greenAccent),
        ],
      ),
      bottomNavigationBar: BounceTabBar(
        onTabChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          Icon(Icons.ac_unit, color: Colors.white),
          Icon(Icons.person, color: Colors.white),
          Icon(Icons.mobile_friendly_outlined, color: Colors.white),
          Icon(Icons.exit_to_app_outlined, color: Colors.white),
        ],
        backGroundColor: Colors.purple,
      ),
    );
  }
}

/* Constante movimiento */
class BounceTabBar extends StatefulWidget {
  const BounceTabBar({
    Key key,
    this.backGroundColor = Colors.red,
    @required this.items,
    @required this.onTabChanged,
    this.initialValue = 0,
    this.movement = 100.0,
  }) : super(key: key);

  final Color backGroundColor;
  final List<Widget> items;
  /* valor que cambia */
  final ValueChanged<int> onTabChanged;
  /* INDEX INICIAL */
  final int initialValue;
  final double movement;
  @override
  _BounceTabBarState createState() => _BounceTabBarState();
}

class _BounceTabBarState extends State<BounceTabBar>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animTabBarIn;
  Animation _animTabBarOut;
  Animation _animCircleItem;
  Animation _animElevationIn;
  Animation _animElevationOut;

  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialValue ?? 0;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _animTabBarIn = CurveTween(
      curve: Interval(
        0.1,
        0.6,
        curve: Curves.decelerate,
      ),
    ).animate(_controller);

    _animTabBarOut = CurveTween(
      curve: Interval(
        0.6,
        1.0,
        curve: Curves.bounceOut,
      ),
    ).animate(_controller);

    _animCircleItem = CurveTween(
      curve: Interval(
        0.0,
        0.5,
      ),
    ).animate(_controller);

    _animElevationIn = CurveTween(
      curve: Interval(
        0.3,
        0.5,
        curve: Curves.decelerate,
      ),
    ).animate(_controller);

    _animElevationOut = CurveTween(
      curve: Interval(
        0.55,
        1.0,
        curve: Curves.bounceOut,
      ),
    ).animate(_controller);

    _controller.forward(from: 1.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double currentWidth = width;
    double currentElevation = 0.0;
    final movement = widget.movement;
    return SizedBox(
      height: kBottomNavigationBarHeight,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          currentWidth = width -
              (movement * _animTabBarIn.value) +
              (movement * _animTabBarOut.value);
          currentElevation = -movement * _animElevationIn.value +
              (movement - kBottomNavigationBarHeight / 3) *
                  _animElevationOut.value;
          return Center(
            child: Container(
              width: currentWidth,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: widget.backGroundColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  widget.items.length,
                  (index) {
                    final child = widget.items[index];
                    if (index == _currentIndex) {
                      return Expanded(
                        child: CustomPaint(
                          foregroundPainter:
                              _CircleItemPainter(_animCircleItem.value),
                          child: Transform.translate(
                            offset: Offset(0.0, currentElevation),
                            child: CircleAvatar(
                              backgroundColor: widget.backGroundColor,
                              child: child,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            widget.onTabChanged(index);
                            _controller.forward(from: 0.0);
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                          child: child,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CircleItemPainter extends CustomPainter {
  final double progress;
  _CircleItemPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = progress * 20.0;
    final strokeWidth = 10.0;
    final currentStrokeWidth = strokeWidth * (1 - progress);
    if (progress < 1.0) {
      canvas.drawCircle(
          center,
          radius,
          Paint()
            ..color = Colors.black
            ..style = PaintingStyle.stroke
            ..strokeWidth = currentStrokeWidth);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
