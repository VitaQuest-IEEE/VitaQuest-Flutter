import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/dependency_injection/get_it_injection.dart';
import 'firebase_options.dart';
import 'vita_quest.dart';
import 'core/database/database_service.dart';
import 'core/helpers/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //? A list of future methods or dependencies that need to be initialized.
  Future.wait([
    ScreenUtil.ensureScreenSize(),
    CacheHelper().init(),
    gitItInit(),
    GoogleFonts.pendingFonts([
      GoogleFonts.cairo(),
    ]),
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    )
  ]);

  //? Initialize the database.
  await DataBaseService().initDatabase();

  //? Load the google fonts to solve the loading bug.
  GoogleFonts.config.allowRuntimeFetching = false;

  //? Adding a font license in the application.
  LicenseRegistry.addLicense(
    () async* {
      final license = await rootBundle.loadString('assets/fonts/cairo/OFL.txt');
      yield LicenseEntryWithLineBreaks(
        ['assets/fonts/cairo'],
        license,
      );
    },
  );

  //? To set the orientation of the device to portrait and can not rotate.
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const VitaQuest());
  });
}
