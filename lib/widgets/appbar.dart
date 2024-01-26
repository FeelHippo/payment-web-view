import 'package:flutter/material.dart';

class AppBarGeneral extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? url;
  final VoidCallback? backPressCallBack;
  final bool? showAction;
  final Widget? action;
  final Key? titleKey;
  final Key? backButtonKey;
  final bool hideBackButton;

  const AppBarGeneral(
      {Key? key,
      this.title,
      this.backPressCallBack,
      this.url,
      this.titleKey,
      this.backButtonKey,
      this.hideBackButton = false,
      this.showAction = false,
      this.action})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: !hideBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              key: backButtonKey,
              onPressed: () {
                if (backPressCallBack != null) {
                  backPressCallBack?.call();
                } else {
                  Navigator.pop(context);
                }
              },
            )
          : null,
      backgroundColor: Colors.white,
      actions: [
        if (showAction == true) action ?? Container(),
        if (url?.isNotEmpty == true)
          // This icon is technically useless but just for better
          // alignment for spacing from both sides
          Theme(
            data: ThemeData(
              highlightColor: Colors.white,
              splashColor: Colors.white,
              hoverColor: Colors.white,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          )
      ],
      title: Text(title ?? '',
          key: titleKey,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 18,
            height: 1.3333333333333333,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
      ),
    );
  }
}
