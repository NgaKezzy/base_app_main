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
          return ListView.separated(
              itemBuilder: (context, index) {
                return Column(
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
