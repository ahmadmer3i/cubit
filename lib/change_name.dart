import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sync_app/home_page.dart';
import 'package:sync_app/listener_cubit.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return BlocListener<ListenerCubit, ListenerState>(
          listener: (context, state) {
            if (state is ListenerChangeMyNameLoading) {
              print("Loading State");
              ListenerCubit.get(context).myName.add("Zakaria");
            }
            if (state is ListenerChangeMyNameSuccess) {
              print("Success State");
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: ListenerCubit.get(context).myName.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage())),
                      child: Text(
                        ListenerCubit.get(context).myName[index],
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
