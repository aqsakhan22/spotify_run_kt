import 'dart:ui';

class Constants{
  Constants._();
  static const String pwRequired = "Password is required";
  static const String emailRequired = "Email is required";
  static const String emailValid = "Please provide a valid email address";
  static const String phoneRequired = "Phone Number is required.";
  static const String policyAgreementRequired = "Please check the user policy and terms of service to continue";
  static const String phoneCharacters = "Phone Number must be greater than 12 character.";
  static const String inputRequired = "Please enter a text value here to continue";

  ///   KEYS FOR PREFERENCES
  static const keyUser = "user";
  static const keySignedIn = "signedIn";
  static const keyStepsCounter = "stepsCounter";
  static const keyUserRunning = "userRunning";
  static const keyRunDistance = "runDistance";
  static const keyLocationData = "locationData";
  static const keyRunSpeed = "RunSpeed";
  static const keyAvgRunSpeed = "AvgRunSpeed";
  static const keyProgramRegistrarId = "ProgramRegistrarId";
  static const keyNotificationCounter = "NotificationCounter";
  static const keyShowSpotifyPlayer = "ShowSpotifyPlayer";
  static const keySpotifyToken = "SpotifyToken";
  static const keyRunTime = "RunTime";
  static const keyGroupChatMembers = "GroupChatMembers";

  ///   SCREEN PATHS
  static const signupScreen = "/signup";
  static const signInScreen = "/signIn";
  static const homeScreen = "/home";
  static const letsSweatScreen = "/letsSweat";
  static const userProfileScreen = "/userProfile";
  static const programScreen = "/program";
  static const programListScreen = "/programList";
  static const communityHomeScreen = "/communityHome";
  static const communityChatScreen = "/communityChat";
  static const peopleListScreen = "/peopleList";
  static const friendsScreen = "/friends";
  static const runningScreen = "/running";
  static const addClubScreen = "/addClub";
  static const clubsListScreen = "/clubsList";
  static const subscriptionScreen = "/subscription";
  static const testSubscriptionScreen = "/testSubscription";
  static const addProgramScreen = "/addProgram";
  static const addEventScreen = "/addEvent";
  static const notificationsScreen = "/notifications";
  static const searchScreen = "/search";
  static const addRunningGearScreen = "/addRunningGear";
  static const chatListScreen = "/chatList";
  static const postsScreen = "/posts";

  ///   COLORS
  static const Color mehrooon = Color.fromARGB(255, 177, 44, 38);
  static const Color pink = Color.fromARGB(255, 239, 185, 178);
  static const Color grey = Color.fromARGB(255, 196, 212, 217);
  static const Color spotify = Color.fromARGB(255, 29, 208, 94);

  ///   RUN TAGS
  static const List<String> runTags = [
    'CARDIO',
    'FULL BODY',
    'SPEED',
    'STRENGTH',
    'STAMINA',
    'AGILITY',
    'RELAX',
    'FUN'
  ];

  ///   WEEK DAYS
  static const List<String> weekDays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

}