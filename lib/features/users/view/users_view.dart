import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reqres_in_api_example/components/gradient_background_widget.dart';
import 'package:reqres_in_api_example/constants/icons.dart';
import 'package:reqres_in_api_example/core/screen_state/screen_state.dart';
import 'package:reqres_in_api_example/core/toaster/show_toast.dart';
import 'package:reqres_in_api_example/features/auth/controller/auth_controller.dart';
import 'package:reqres_in_api_example/features/users/controller/users_controller.dart';
import 'package:reqres_in_api_example/features/users/model/users_model.dart';
import 'package:reqres_in_api_example/features/users/widget/user_card_widget.dart';

class UsersView extends HookConsumerWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersNotifier = ref.watch(usersProvider.notifier);
    final authNotifier = ref.watch(authProvider.notifier);
    final state = ref.watch(usersProvider);
    final scrollController = useScrollController();

    ref.listen(usersProvider, (_, next) {
      if (next is SuccessState<UsersModel>) {
        scrollController.addListener(() {
          if (next.data.totalPages == next.data.page &&
              scrollController.position.pixels ==
                  scrollController.position.maxScrollExtent) {
            showToast(
              message: 'No more users to load',
              toastType: ToastType.info,
            );
          }
        });
      }
    });

    useEffect(() {
      scrollController.addListener(() {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          usersNotifier.loadUsers();
        }
      });

      return null;
    }, [scrollController]);

    return Material(
      child: GradientBackgroundWidget(
        child: Builder(builder: (context) {
          if (state is LoadingState<UsersModel>) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is SuccessState<UsersModel>) {
            return CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: scrollController,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              slivers: [
                CupertinoSliverNavigationBar(
                  trailing: MyIcons.power.toWidget(
                    onPressed: authNotifier.logout,
                  ),
                  backgroundColor: Colors.transparent,
                  alwaysShowMiddle: false,
                  largeTitle: const Text("Users"),
                  middle: const Text("Find a Friend"),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverList.separated(
                    itemCount: state.data.users?.length,
                    itemBuilder: (context, index) {
                      final user = state.data.users?.elementAt(index);

                      return UserCardWidget(user: user);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 16);
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.paddingOf(context).bottom,
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: Text('Unknown Error Occured'));
          }
        }),
      ),
    );
  }
}
