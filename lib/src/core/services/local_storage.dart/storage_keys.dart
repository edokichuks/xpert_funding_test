///USE AN ENUM TO ALLOW DEVS KEEP TRACK OF ALL THE
///AVAILABLE STORED PROPERTIES AND KEY NAMES
enum LocalStoreKeysManger {
  appBox('appBox'),
  password('password'),
  token('token'),
  user('user'),
  userPin('userPin'),
  currentState('current_state'),
  refreshToken('refresh_token'),
  rememberMe('rememberMe'),
  sessionToken("session_token"),
  userLastPositon("last_location.dart"),
  userAddress('user_address'),
  addresses('addresses'),
  categories('meal_categories'),
  fcmToken('fcmToken'),
  hasSavedFcmTokenRemotely('hasSavedFcmTokenRemotely'),
  savedMeals('savedMeals'),
  savedChefs('savedChefs'),
  display('display'),
  balanceVisibility('balanceVisibility');

  final String rawValue;

  const LocalStoreKeysManger(this.rawValue);
}
