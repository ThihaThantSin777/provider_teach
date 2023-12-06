import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/bloc/home_page_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageBloc>(
      create: (_) => HomePageBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Provider'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const _NumbersDataView(),
              const SizedBox(
                height: 30,
              ),
              const _ButtonsView(),
              Selector<HomePageBloc, int?>(
                selector: (_, bloc) => bloc.asynValue,
                builder: (_, value, __) {
                  if (value == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Text(value.toString());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        MaterialButton(
          color: Colors.red,
          textColor: Colors.white,
          onPressed: () {
            final bloc = context.read<HomePageBloc>();
            bloc.increaseNumber1();
          },
          child: const Text('Increase'),
        ),
        const SizedBox(
          width: 30,
        ),
        MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            final bloc = context.read<HomePageBloc>();
            bloc.decreaseNumber2();
          },
          child: const Text('Decrease'),
        ),
      ],
    );
  }
}

class _NumbersDataView extends StatelessWidget {
  const _NumbersDataView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<HomePageBloc>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Selector<HomePageBloc, int>(
            selector: (_, bloc) => bloc.getNumber1,
            builder: (_, number1, __) {
              print("Build Number 1");
              return Text('Number1: ===> $number1}');
            }),
        Selector<HomePageBloc, int>(
            selector: (_, bloc) => bloc.getNumber2,
            builder: (_, number2, __) {
              print("Build Number 2");
              return Text('Number1: ===> $number2}');
            }),
        Selector<HomePageBloc, bool>(
            selector: (_, bloc) => bloc.isCheck,
            builder: (_, check, __) => Checkbox(
                  value: check,
                  onChanged: (value) {
                    context.read<HomePageBloc>().setCheckState = value ?? false;
                  },
                )),
      ],
    );
  }
}
