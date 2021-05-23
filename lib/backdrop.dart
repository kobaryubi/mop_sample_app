import 'dart:math' as math;
import 'package:flutter/material.dart';

import './category.dart';

const double _kFlingVelocity = 2.0;

class _BackdropPanel extends StatelessWidget {
  const _BackdropPanel({
    Key? key,
    required this.onTap,
    required this.onVerticalDragUpdate,
    required this.onVerticalDragEnd,
    required this.title,
    required this.child,
  }) : super(key: key);

  final VoidCallback onTap;
  final GestureDragUpdateCallback onVerticalDragUpdate;
  final GestureDragEndCallback onVerticalDragEnd;
  final Widget title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onVerticalDragUpdate: onVerticalDragUpdate,
            onVerticalDragEnd: onVerticalDragEnd,
            onTap: onTap,
            child: Container(
              height: 48.0,
              padding: EdgeInsetsDirectional.only(start: 16.0),
              alignment: AlignmentDirectional.centerStart,
              child: DefaultTextStyle(
                style: (Theme.of(context).textTheme.subtitle1)!,
                child: title,
              ),
            ),
          ),
          Divider(
            height: 1.0,
          ),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}

class _BackdropTitle extends AnimatedWidget {
  final Widget frontTitle;
  final Widget backTitle;

  const _BackdropTitle({
    Key? key,
    required Animation<double> animation,
    required this.frontTitle,
    required this.backTitle,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return DefaultTextStyle(
      style: (Theme.of(context).primaryTextTheme.headline6)!,
      softWrap: false,
      overflow: TextOverflow.ellipsis,
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: CurvedAnimation(
              parent: ReverseAnimation(animation),
              curve: Interval(0.5, 1.0),
            ).value,
            child: backTitle,
          ),
          Opacity(
            opacity: CurvedAnimation(
              parent: animation,
              curve: Interval(0.5, 1.0),
            ).value,
            child: frontTitle,
          ),
        ],
      ),
    );
  }
}

class Backdrop extends StatefulWidget {
  final Category currentCategory;
  final Widget frontPanel;
  final Widget backPanel;
  final Widget frontTitle;
  final Widget backTitle;

  const Backdrop({
    required this.currentCategory,
    required this.frontPanel,
    required this.backPanel,
    required this.frontTitle,
    required this.backTitle,
  });

  @override
  _BackdropState createState() => _BackdropState();
}

class _BackdropState extends State<Backdrop>
    with SingleTickerProviderStateMixin {
  final GlobalKey _backdropKey = GlobalKey(debugLabel: "Backdrop");
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      value: 1.0,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  void didUpdateWidget(Backdrop old) {
    super.didUpdateWidget(old);
    if (widget.currentCategory != old.currentCategory) {
      setState(() {
        _animationController.fling(
          velocity: _backdropPanelVisible ? -_kFlingVelocity : _kFlingVelocity,
        );
      });
    } else if (!_backdropPanelVisible) {
      setState(() {
        _animationController.fling(velocity: _kFlingVelocity);
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool get _backdropPanelVisible {
    final AnimationStatus animationStatus = _animationController.status;
    return animationStatus == AnimationStatus.completed ||
        animationStatus == AnimationStatus.forward;
  }

  void _toggleBackdropPanelWidgetVisibility() {
    FocusScope.of(context).requestFocus(FocusNode());
    _animationController.fling(
      velocity: _backdropPanelVisible ? -_kFlingVelocity : _kFlingVelocity,
    );
  }

  double get _backdropHeight {
    final RenderBox renderBox =
        _backdropKey.currentContext!.findRenderObject() as RenderBox;
    return renderBox.size.height;
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    print('_handleDragUpdate');
    if (_animationController.isAnimating ||
        _animationController.status == AnimationStatus.completed) return;
    _animationController.value -= details.primaryDelta! / _backdropHeight;
  }

  void _handleDragEnd(DragEndDetails details) {
    print(DateTime.now());
    print('_handleDragEnd');
    if (_animationController.isAnimating ||
        _animationController.status == AnimationStatus.completed) return;
    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / _backdropHeight;
    if (flingVelocity < 0.0)
      _animationController.fling(velocity: math.max(_kFlingVelocity, -flingVelocity));
    else if (flingVelocity > 0.0)
      _animationController.fling(velocity: math.min(-_kFlingVelocity, -flingVelocity));
    else
      _animationController.fling(
          velocity:
          _animationController.value < 0.5 ? -_kFlingVelocity : _kFlingVelocity);
  }

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    const double panelTitleHeight = 48.0;
    final Size panelSize = constraints.biggest;
    final double panelTop = panelSize.height - panelTitleHeight;

    Animation<RelativeRect> panelAnimation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(
        0.0,
        panelTop,
        0.0,
        panelTop - panelSize.height,
      ),
      end: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(_animationController.view);

    return Container(
      key: _backdropKey,
      color: widget.currentCategory.color,
      child: Stack(
        children: <Widget>[
          widget.backPanel,
          PositionedTransition(
            rect: panelAnimation,
            child: _BackdropPanel(
              onTap: _toggleBackdropPanelWidgetVisibility,
              onVerticalDragUpdate: _handleDragUpdate,
              onVerticalDragEnd: _handleDragEnd,
              title: Text(widget.currentCategory.name),
              child: widget.frontPanel,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.currentCategory.color,
        elevation: 0.0,
        leading: IconButton(
          onPressed: _toggleBackdropPanelWidgetVisibility,
          icon: AnimatedIcon(
            icon: AnimatedIcons.close_menu,
            progress: _animationController.view,
          ),
        ),
        title: _BackdropTitle(
          animation: _animationController.view,
          frontTitle: widget.frontTitle,
          backTitle: widget.backTitle,
        ),
      ),
      body: LayoutBuilder(
        builder: _buildStack,
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
