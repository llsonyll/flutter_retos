import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const backGroundColors = [
  Color(0XFF8122BF),
  Color(0XFFCA32F5),
  Color(0XFFF2B634),
];

class MainSocialShareButton extends StatelessWidget {
  const MainSocialShareButton({Key key}) : super(key: key);

  static String flutter = 'https://flutter.dev';
  static String google = 'https://www.google.com';
  static String diario = 'https://www.wow-colombia.com';
  static String reactiva = 'https://www.reactiva-peru.com';

  _launchUrl(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: backGroundColors),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SocialShareButton(
              items: [
                IconButton(
                    icon: Icon(Icons.mediation),
                    onPressed: () {
                      _launchUrl(flutter);
                    }),
                IconButton(
                    icon: Icon(Icons.padding),
                    onPressed: () {
                      _launchUrl(google);
                    }),
                IconButton(
                    icon: Icon(Icons.qr_code),
                    onPressed: () {
                      _launchUrl(diario);
                    }),
                IconButton(
                    icon: Icon(Icons.map_rounded),
                    onPressed: () {
                      _launchUrl(reactiva);
                    }),
              ],
              buttonLabel: 'SHARE',
            ),
          ),
        ),
      ),
    );
  }
}

class SocialShareButton extends StatefulWidget {
  const SocialShareButton(
      {Key key,
      this.height = 100,
      @required this.buttonLabel,
      @required this.items,
      this.background = Colors.black,
      this.childrenColor = Colors.white,
      this.letterSpacing = 8,
      this.textStyle})
      : super(key: key);
  final double height;
  final String buttonLabel;
  final List<Widget> items;
  final Color background;
  final Color childrenColor;
  final double letterSpacing;
  final TextStyle textStyle;

  @override
  _SocialShareButtonState createState() => _SocialShareButtonState();
}

class _SocialShareButtonState extends State<SocialShareButton> {
  final border = BorderRadius.circular(10);
  final _buttonsKey = GlobalKey();
  double _buttonsWidth = 0.0;
  bool _expanded = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _buttonsWidth = _buttonsKey.currentContext.size.width + 10;
      });
    });
    super.initState();
  }

  Widget _topArea() {
    return Container(
      height: widget.height / 2,
      decoration: BoxDecoration(
        color: widget.childrenColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        key: _buttonsKey,
        children: widget.items,
      ),
    );
  }

  Widget _bottomArea() {
    return Material(
      elevation: 5,
      color: widget.background,
      borderRadius: border,
      child: InkWell(
        onTap: () {
          setState(() {
            _expanded = !_expanded;
          });
        },
        borderRadius: border,
        child: Container(
          width: _buttonsWidth,
          height: widget.height / 2,
          child: Center(
            child: Text(
              widget.buttonLabel,
              style: widget.textStyle ??
                  Theme.of(context).textTheme.headline5.copyWith(
                      color: widget.childrenColor,
                      letterSpacing: widget.letterSpacing,
                      fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final movement = widget.height / 4;
    return TweenAnimationBuilder(
      tween:
          _expanded ? Tween(begin: 0.0, end: 1.0) : Tween(begin: 1.0, end: 0.0),
      duration: _buttonsWidth == 0
          ? Duration(milliseconds: 1)
          : Duration(milliseconds: 300),
      builder: (context, value, _) {
        return Container(
          height: widget.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Transform.translate(
                offset: Offset(0.0, movement * value),
                child: _topArea(),
              ),
              Transform.translate(
                offset: Offset(0.0, -movement * value),
                child: _bottomArea(),
              ),
            ],
          ),
        );
      },
    );
  }
}
