import 'package:baseApp/common/shimmer/shimmer.dart';
import 'package:baseApp/common/slidable_widget/slidable_action_pane.dart';
import 'package:baseApp/common/slidable_widget/slidable_widget.dart';
import 'package:baseApp/common/slidable_widget/slide_action.dart';
import 'package:baseApp/core/di/di.dart';
import 'package:baseApp/common/text_style/app_text_style.dart';
import 'package:baseApp/features/home/presentation/cubit/home_cubit.dart';
import 'package:baseApp/features/home/presentation/cubit/home_state.dart';
import 'package:baseApp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeCubit homeCubit = getIt.get<HomeCubit>();
  final Logger logger = getIt.get<Logger>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeCubit>().getUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.unknown),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatus.loading) {
            return Center(
              child: Shimmer(
                child: SizedBox(width: 100, height: 100),
              ),
            );
          }
          return ListView.separated(
              itemBuilder: (context, index) {
                return Slidable(
                  actionExtentRatio: 0.25,
                  actionsPane: SlidableDrawerActionPane(),
                  actionsLeft: [
                    IconSlideAction(
                      color: Colors.red,
                      iconWidget: Icon(Icons.delete),
                      onTap: () => logger.d('Xoá'),
                      borderRadius: BorderRadius.circular(10),
                      closeOnTap: true,
                    ),
                  ],
                  actionsRight: [
                    IconSlideAction(
                      color: Colors.green,
                      iconWidget: Icon(Icons.edit),
                      onTap: () => logger.d('sửa'),
                      borderRadius: BorderRadius.circular(10),
                      closeOnTap: true,
                    ),
                  ],
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.grey,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.users[index].name,
                          style: AppTextStyles.textStyle16,
                        ),
                        Text(
                          state.users[index].email,
                          style: AppTextStyles.textStyle13
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
              itemCount: homeCubit.state.users.length);
        },
      ),
    );
  }
}
