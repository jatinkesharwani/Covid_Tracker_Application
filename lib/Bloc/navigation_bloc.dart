import 'package:bloc/bloc.dart';
import 'package:covid19_tracker/screens/Home_Screen_Pages/faqs_page.dart';
import 'package:covid19_tracker/screens/Home_Screen_Pages/home_page.dart';
import 'package:covid19_tracker/screens/Home_Screen_Pages/news_updates_page.dart';
import 'package:covid19_tracker/screens/Home_Screen_Pages/vaccine_slots_page.dart';
import 'package:covid19_tracker/screens/Home_Screen_Pages/virus_details_page.dart';

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
