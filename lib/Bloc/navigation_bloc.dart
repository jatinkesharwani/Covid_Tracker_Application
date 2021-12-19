import 'package:bloc/bloc.dart';
import 'package:covid19_tracker/screens/faqs_page.dart';
import 'package:covid19_tracker/screens/home_page.dart';
import 'package:covid19_tracker/screens/news_updates_page.dart';
import 'package:covid19_tracker/screens/vaccine_slots_page.dart';
import 'package:covid19_tracker/screens/virus_details_page.dart';

enum NavigationEvents {
  homePageClickedEvent,
  updatesClickedEvent,
  faqsClickedEvent,
  vaccineSlotsClickedEvent,
  aboutVaccineClickedEvent
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc(NavigationStates initialState) : super(initialState);

  //NavigationStates get initialState => MyAccountsPage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.homePageClickedEvent:
        yield const HomeScreen();
        break;
      case NavigationEvents.updatesClickedEvent:
        yield const UpdatesScreen();
        break;
      case NavigationEvents.faqsClickedEvent:
        yield const FAQPage();
        break;
      case NavigationEvents.vaccineSlotsClickedEvent:
        yield const VaccineSlots();
        break;
      case NavigationEvents.aboutVaccineClickedEvent:
        yield const VirusDetailsScreen();
        break;
    }
  }
}
