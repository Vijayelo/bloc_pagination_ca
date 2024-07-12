import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_demo/core/services/services_locator.dart';
import 'package:bloc_demo/pagination/ui/widgets/post_item_detail_view.dart';

import '../../data/model/post.dart';
import '../bloc/pagination_bloc.dart';
import '../widgets/error_dialog.dart';
import '../widgets/post_item.dart';

class PostsOverviewScreen extends StatelessWidget {
  const PostsOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          appServiceLocator<PaginationBloc>()..add(const LoadPageEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Our Users",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'SFPro',
              color: Color(0XFF4C4C4C),
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<PaginationBloc, PaginationState>(
          builder: (context, state) {
            if (context.read<PaginationBloc>().posts.isEmpty) {
              if (state == PaginationLoadingState()) {
                return const Center(
                    child: Padding(
                  padding: EdgeInsets.all(8),
                  child: CircularProgressIndicator(),
                ));
              } else if (state == PaginationErrorState()) {
                return Center(
                    child: errorDialog(
                        size: 20,
                        onPressed: () {
                          context
                              .read<PaginationBloc>()
                              .add(const LoadPageEvent());
                        }));
              }
            }
            return ListView.builder(
                itemCount: context.read<PaginationBloc>().posts.length +
                    (context.read<PaginationBloc>().isLastPage ? 0 : 1),
                itemBuilder: (context, index) {
                  // request more data when the user has reached the trigger point.
                  context
                      .read<PaginationBloc>()
                      .add(CheckIfNeedMoreDataEvent(index: index));
                  // when the user gets to the last item in the list, check whether
                  // there is an error, otherwise, render a progress indicator.
                  if (index == context.read<PaginationBloc>().posts.length) {
                    if (state == PaginationErrorState()) {
                      return Center(
                          child: errorDialog(
                              size: 15,
                              onPressed: () {
                                context
                                    .read<PaginationBloc>()
                                    .add(const LoadPageEvent());
                              }));
                    } else {
                      return const Center(
                          child: Padding(
                        padding: EdgeInsets.all(8),
                        child: CircularProgressIndicator(),
                      ));
                    }
                  }

                  final Datum post =
                      context.read<PaginationBloc>().posts[index];
                  return Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16, bottom: 16),
                      child: InkWell(
                        onTap: () {
                          print(post.email.toString());
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => UserDetailView(
                                post.firstName.toString(),
                                post.email.toString(),
                                post.avatar.toString(),
                                post.lastName.toString(),
                                post.id.toString(),
                              ),
                            ),
                          );
                        },
                        child: UserItem(post.firstName.toString(),
                            post.email.toString(), post.avatar.toString()),
                      ));
                });
          },
        ),
      ),
    );
  }
}
