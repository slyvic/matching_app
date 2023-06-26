import './app_actions.dart';
import './app_state.dart';

AppState appReducer(AppState state, action) {
  if (action is ResetStateAction) return resetStateReducer(state, action);

  return AppState();
}

AppState resetStateReducer(AppState state, ResetStateAction action) {
  return AppState.initial();
}
