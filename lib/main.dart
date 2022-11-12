import 'package:country_app/data/services/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'presentation/presentation/ui/country_list_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

//TODO: 1 get the app theme working for the toggle first
//TODO: Finish UI for the filter bottom sheet

//TOMROROR
//TODO: Make the filters working
//TODO: By 11pm to submit of they are not working, update the read me
class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final appThemeState = ref.watch(appThemeStateNotifier);
    final toggleDarkMode = ref.watch(darkModeProvider);
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) => MaterialApp(
        // theme: AppTheme.lightTheme,
        // darkTheme: AppTheme.darkTheme,

        darkTheme: ThemeData.dark(),
        // Use dark or light theme based on toggle
        themeMode: toggleDarkMode ? ThemeMode.dark : ThemeMode.light,
        // Use dark or light theme based on system setting.
        // themeMode:
        //     appThemeState.isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        title: 'My Resume App',
        home: const CountryListScreen(),
      ),
    );
  }
}
