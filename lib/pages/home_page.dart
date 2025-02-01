import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:points_counter/cubit/counter_cubit.dart';
import 'package:points_counter/cubit/counter_state.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  int teamAPoints = 0;
  int teamBPoints = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(builder: (context, State) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Points Conter",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.orange,
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      "Team A",
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      "${BlocProvider.of<CounterCubit>(context).teamAPoints}",
                      style: const TextStyle(fontSize: 150),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context)
                              .teamIncrement(team: 'A', buttonNumber: 1);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: const Size(150, 50)),
                        child: const Text(
                          "Add 1 point",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context)
                              .teamIncrement(team: 'A', buttonNumber: 2);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: const Size(150, 50)),
                        child: const Text(
                          "Add 2 point",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context)
                              .teamIncrement(team: 'A', buttonNumber: 3);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: const Size(150, 50)),
                        child: const Text(
                          "Add 3 point",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 500,
                  child: VerticalDivider(
                    color: Colors.grey,
                    thickness: 2,
                    indent: 20,
                    width: 40,
                  ),
                ),
                Column(
                  children: [
                    const Text(
                      "Team B",
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      "${BlocProvider.of<CounterCubit>(context).teamBPoints}",
                      style: const TextStyle(fontSize: 150),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context)
                              .teamIncrement(team: 'B', buttonNumber: 1);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: const Size(150, 50)),
                        child: const Text(
                          "Add 1 point",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context)
                              .teamIncrement(team: 'B', buttonNumber: 2);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: const Size(150, 50)),
                        child: const Text(
                          "Add 2 point",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context)
                              .teamIncrement(team: 'B', buttonNumber: 3);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: const Size(150, 50)),
                        child: const Text(
                          "Add 3 point",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 64,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size(150, 50),
              ),
              onPressed: () {
                BlocProvider.of<CounterCubit>(context)
                    .teamIncrement(team: 'A', buttonNumber: -teamAPoints);
                BlocProvider.of<CounterCubit>(context)
                    .teamIncrement(team: 'B', buttonNumber: -teamBPoints);
              },
              child: const Text(
                "Reset",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ],
        ),
      );
    }, listener: (context, State) {
      if (State is CounterAIncrementState) {
        teamAPoints = BlocProvider.of<CounterCubit>(context).teamAPoints;
      } else {
        teamBPoints = BlocProvider.of<CounterCubit>(context).teamBPoints;
      }
    });
  }
}
