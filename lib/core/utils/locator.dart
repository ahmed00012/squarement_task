
import 'package:get_it/get_it.dart';
import 'package:squarement_task/features/main_layout/screens/main_layout_screen.dart';

import '../../features/home/data/repositories/home_repository.dart';
import 'dio_utils.dart';

GetIt sl = GetIt.I;

setup() async {
  sl.allowReassignment = true;

  sl.registerSingleton<DioUtils>(DioUtils.getInstance());

  //repository locator
  sl.registerSingleton<HomeRepository>(HomeRepository.getInstance());


}

// //set and get language (ar, en)
// setLanguagePrefs(String lang) {
//   sl<SharedPreferencesUtils>().setString(kLanguage, lang);
// }
//
// getLanguagePrefs() {
//   return sl<SharedPreferencesUtils>().getString(kLanguage) ?? 'en';
// }
//


