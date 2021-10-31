import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sync_app/change_name.dart';
import 'package:sync_app/listener_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Rebuild");
    return Builder(builder: (context) {
      return BlocConsumer<ListenerCubit, ListenerState>(
        listener: (context, state) {
          if (state is ListenerChangeMyNameSuccess) {
            print("Success State");
            ListenerCubit.get(context).myName.add("Mahmoud");
          }
          if (state is ListenerChangeMyNameLoading) {
            print("Loading State");
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => ChangeName()));
          }
        },
        builder: (context, state) {
          print("rebulid builder");
          var cubit = ListenerCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("Home"),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: cubit.myName.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 5,
                    ),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        if (state is ListenerChangeMyNameSuccess) print(state);
                        cubit.changeMyName(name: "Ali");
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChangeName(),
                          ),
                        );
                      },
                      child: Text(
                        cubit.myName[index],
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      child: const Text("Add Name"),
                      onPressed: () {
                        cubit.changeMyName(name: "Marwa");
                      },
                    ),
                  ),
                )
              ],
            ),
          );
        },
      );
    });
  }
}
