import 'package:weartest/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Counter',
          style: TextStyle(color: Color.fromARGB(234, 255, 255, 255)),
        ),
        backgroundColor: Colors.white10,
      ),
      body: Padding( 
        padding: const EdgeInsets.only(left: 25.0),
        child: SizedBox.expand(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => context.read<CounterCubit>().increment(),
                    child: const Icon(Icons.add)),
                  //const SizedBox(height: 5,),
                  const CounterText(),
                  //const SizedBox(height: 5,),
                  ElevatedButton(
                    onPressed: () => context.read<CounterCubit>().decrement(), 
                    child: const Icon(Icons.remove)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => context.read<CounterCubit>().reset(),
                      child: const Icon(Icons.restore),),
                  ],
                ),
              ) 
          ],),
        ),
      )
    );
  }
}

// class CounterText extends StatelessWidget {
//   const CounterText({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Text('0');
//   }
// }

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((CounterCubit cubit) => cubit.state);
    return Text('$count', style: theme.textTheme.displayMedium);
  }
}