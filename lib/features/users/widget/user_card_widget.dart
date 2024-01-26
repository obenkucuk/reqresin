import 'package:flutter/material.dart';
import 'package:reqres_in_api_example/constants/icons.dart';
import 'package:reqres_in_api_example/core/theme/text_styles.dart';
import 'package:reqres_in_api_example/features/users/model/users_model.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({
    super.key,
    this.user,
  });

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DecoratedBox(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(500)),
                color: Colors.white,
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.green],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(500)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: user?.avatar != null
                          ? NetworkImage(user!.avatar!)
                          : null,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${user?.firstName} ${user?.lastName}",
                  style: s14W700,
                ),
                Text('${user?.email}', style: s14W400),
              ],
            ),
            const Spacer(),
            MyIcons.angle_right.toWidget(color: Colors.grey, size: 20)
          ],
        ),
      ),
    );
  }
}
