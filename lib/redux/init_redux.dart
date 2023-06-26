import 'package:redux/redux.dart';
import 'app/app_middleware.dart';
import 'app/app_reducer.dart';
import 'app/app_state.dart';

class Redux {
  static Store<AppState>? store;
}

void initRedux() {
  Redux.store = Store<AppState>(
    (state, action) => appReducer(state, action),
    initialState: AppState.initial(),
    middleware: appMiddleware(),
    distinct: true,
  );
}
