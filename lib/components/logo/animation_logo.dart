import 'package:flutter/widgets.dart';

class AnimationLogo extends StatefulWidget {
  const AnimationLogo({
    Key? key,
    required this.size,
  }) : super(key: key);

  final double size;

  @override
  State<AnimationLogo> createState() => _AnimationLogoState();
}

class _AnimationLogoState extends State<AnimationLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );

    controller.forward();

    controller.addStatusListener((status) {});

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'Logo',
      child: SizedBox(
        height: controller.value * widget.size,
        child: Image.asset('assets/images/Vector.png'),
      ),
    );
  }
}
