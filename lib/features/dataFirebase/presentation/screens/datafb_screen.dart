import 'package:apicultores_app/features/dataFirebase/presentation/screens/datafb_bloc_provider.dart';
import 'package:apicultores_app/features/dataFirebase/presentation/screens/datafb_screen_builder.dart';
import 'package:design_system/design_system.dart';

class DatafbScreen extends StatelessWidget {
  const DatafbScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Center(
    //   child: Text("eu aqui"),

    return const DatafbBlocProvider(
      child: DatafbScreenBuilder(
      ),
    );
  }


  /*
@override
  void initState() {
    super.initState();
    _activateListeners();
  }

  void _activateListeners() {
    _dailySpecialStream =
        _database.child("dailySpecial/description").onValue.listen((event) {
      final String description = event.snapshot.value.toString();
      setState(() {
        _displayText = 'Today special: $description';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Read examples'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            children: [
              Text(_displayText),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void deactivate() {
    _dailySpecialStream.cancel();
    super.deactivate();
  }
  */
}