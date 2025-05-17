import 'package:go_router/go_router.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class BoomerciotnaryLinkButton extends StatefulWidget {
  const BoomerciotnaryLinkButton({super.key});

  @override
  State<BoomerciotnaryLinkButton> createState() => _BoomerciotnaryLinkButtonState();
}

class _BoomerciotnaryLinkButtonState extends State<BoomerciotnaryLinkButton> {
  @override
  Widget build(BuildContext context) {
    return LinkButton(
      leading: Icon(LucideIcons.badgeInfo),
      child: Text('Are you a boomer?').large,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Boomerctionary'),

              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [const Text('Are you a boomer?'), const Gap(16), Image.asset('assets/img/boomer.gif')],
              ),
              actions: [
                PrimaryButton(child: const Text('No')),
                SecondaryButton(
                  onPressed: () {
                    context.pushReplacementNamed('boomerctionary');
                  },
                  child: const Text('Yes'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
