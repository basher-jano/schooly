import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:my_school/getx_bindings/Teacher_login_binding.dart';
import 'package:my_school/getx_bindings/Teacher_notifi_binding.dart';
import 'package:my_school/getx_bindings/about_us_binding.dart';
import 'package:my_school/getx_bindings/class_binding.dart';
import 'package:my_school/getx_bindings/help_binding.dart';
import 'package:my_school/getx_bindings/login_as_binding.dart';
import 'package:my_school/getx_bindings/setting_binding.dart';
import 'package:my_school/getx_bindings/splash_binding.dart';
import 'package:my_school/getx_bindings/student_binding.dart';
import 'package:my_school/getx_bindings/teacher_classes_binding.dart';
import 'package:my_school/getx_bindings/teacher_courses_binding.dart';
import 'package:my_school/getx_bindings/teacher_file_binding.dart';
import 'package:my_school/getx_bindings/teacher_home_binding.dart';
import 'package:my_school/getx_bindings/teacher_main_page_binding.dart';
import 'package:my_school/getx_bindings/teacher_profile_binding.dart';
import 'package:my_school/getx_bindings/teacher_upload_file_binding.dart';
import 'package:my_school/getx_bindings/teacher_videos_binding.dart';
import 'package:my_school/getx_bindings/upload_video_binding.dart';
import 'package:my_school/getx_bindings/video_binding.dart';
import 'package:my_school/getx_bindings/video_student.dart';
import 'package:my_school/models/teacher_files_model.dart';
import 'package:my_school/modules/About_us/about_us.dart';
import 'package:my_school/modules/Class/class.dart';
import 'package:my_school/modules/Help/help.dart';
import 'package:my_school/modules/Teacher_Classes/teacher_classes.dart';
import 'package:my_school/modules/Teacher_Courses/teacher_courses.dart';
import 'package:my_school/modules/Teacher_Courses/teacher_vedio_courses.dart';
import 'package:my_school/modules/Teacher_Courses/upload_video.dart';
import 'package:my_school/modules/Teacher_Courses/video.dart';
import 'package:my_school/modules/Teacher_Courses/video_controller.dart';
import 'package:my_school/modules/Teacher_Files/teacher_files.dart';
import 'package:my_school/modules/Teacher_HomePage/teacher_home_page.dart';
import 'package:my_school/modules/Teacher_Notifi/teacher_notifi.dart';
import 'package:my_school/modules/Teacher_Profile/teacher_profile.dart';
import 'package:my_school/modules/Teacher_login/teacher_login.dart';
import 'package:my_school/modules/Teacher_upload_file/Teacher_upload_file.dart';
import 'package:my_school/modules/login_as/login_as.dart';
import 'package:my_school/modules/settings/settings.dart';
import 'package:my_school/modules/splash/splash.dart';
import 'package:my_school/modules/student/student.dart';
import 'package:my_school/modules/teacher_main_page/localization_service.dart';
import 'package:my_school/modules/teacher_main_page/teacher_main_page_screen.dart';
import 'package:my_school/student_app/getx_bindings/courses_files_binding.dart';
import 'package:my_school/student_app/getx_bindings/guist_code_binding.dart';
import 'package:my_school/student_app/getx_bindings/guist_home_page_binding.dart';
import 'package:my_school/student_app/getx_bindings/guist_subject_binding.dart';
import 'package:my_school/student_app/getx_bindings/student_login_bindeing.dart';
import 'package:my_school/student_app/getx_bindings/student_main_page_binding.dart';
import 'package:my_school/student_app/getx_bindings/student_notification_binding.dart';
import 'package:my_school/student_app/getx_bindings/student_subjects_binding.dart';
import 'package:my_school/student_app/modules/guist_code/guist_code.dart';
import 'package:my_school/student_app/modules/guist_home_page/courses_guest.dart';
import 'package:my_school/student_app/modules/guist_home_page/guist_home_page.dart';
import 'package:my_school/student_app/modules/student_login/student_login.dart';
import 'package:my_school/student_app/modules/student_main_page/student_main_page.dart';
import 'package:my_school/student_app/modules/student_subjects/courses_files.dart';
import 'package:my_school/student_app/modules/student_subjects/student_subjects.dart';
import 'package:my_school/student_app/modules/student_subjects/video.dart';
import 'package:firebase_core/firebase_core.dart';

import 'student_app/getx_bindings/Video_guest_BInding.dart';
import 'student_app/getx_bindings/courses_guist_binding.dart';
import 'student_app/modules/Notification/student_notification.dart';
import 'student_app/modules/guist_home_page/Video.dart';
import 'student_app/modules/guist_home_page/guist_subject._screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print('this is token ________________');
  print(await FirebaseMessaging.instance.getToken());

  runApp(GetMaterialApp(
    builder: EasyLoading.init(),
    debugShowCheckedModeBanner: false,
    initialRoute: '/splash',
    getPages: [
      GetPage(
        name: '/splash',
        page: () => Splash(),
        binding: SplashBinding(),
      ),
      GetPage(
        name: '/loginas',
        page: () => loginAs(),
        binding: loginAsBinding(),
      ),

      /////////////// teacher section  //////////////////

      GetPage(
        name: '/techermainpage',
        page: () => teacherMainPage(),
        binding: teacherMainPageBinding(),
      ),
      GetPage(
        name: '/teacherlogin',
        page: () => TeacherLogin(),
        binding: TeacherLoginBinding(),
      ),
      GetPage(
        name: '/teacherhome',
        page: () => TeacherHomepage(),
        binding: TeacherHomeBinding(),
      ),
      GetPage(
        name: '/teacherclasses',
        page: () => TeacherClasses(),
        binding: TeacherClassesBinding(),
      ),
      GetPage(
        name: '/teacheruploadfile',
        page: () => TeacherUploadFile(),
        binding: TeacherUploadFileBinding(),
      ),
      GetPage(
        name: '/teachercourses',
        page: () => TeacherCourses(),
        binding: TeacherCoursesBinding(),
      ),
      GetPage(
        name: '/teachervideo',
        page: () => TeacherVideos(),
        binding: TeacherVedioBinding(),
      ),
      GetPage(
        name: '/teacherprofile',
        page: () => TeacherProfile(),
        binding: TeacherProfilBinding(),
      ),
      GetPage(
        name: '/teacher_files_page',
        page: () => TeacherFilesPage(),
        binding: TeacherFilesPageBinding(),
      ),
      GetPage(
        name: '/video',
        page: () => Video(),
        binding: VideoBinding(),
      ),
      GetPage(
        name: '/uploadVideo',
        page: () => UploadVideo(),
        binding: UploadVideoBinding(),
      ),
      GetPage(
        name: '/class',
        page: () => Class(),
        binding: ClassBinding(),
      ),
      GetPage(
        name: '/Student',
        page: () => Student(),
        binding: StudentBinding(),
      ),
      GetPage(
        name: '/help',
        page: () => Help(),
        binding: HelpBinding(),
      ),
      GetPage(
        name: '/about_us',
        page: () => AboutUS(),
        binding: AboutUsBinding(),
      ),
      GetPage(
        name: '/setting',
        page: () => Setting(),
        binding: SettingBinding(),
      ),

      /////////////// student section  //////////////////

      GetPage(
        name: '/studentlogin',
        page: () => StudentLogin(),
        binding: StudentLoginBinding(),
      ),
      GetPage(
        name: '/studentmainpage',
        page: () => studentMainPage(),
        binding: StudentMainPageBinding(),
      ),
      GetPage(
        name: '/courses_filse',
        page: () => CoursesFiles(),
        binding: CoursesFilesBinding(),
      ),
      GetPage(
        name: '/student_subjects',
        page: () => StudentSubjects(),
        binding: StudentSubjectsBindings(),
      ),
      GetPage(
        name: '/student_Video',
        page: () => VideoStudentScreen(),
        binding: VideoStudentBinding(),
      ),
      // Guist section

      GetPage(
        name: '/guist_home',
        page: () => GuistHomePage(),
        binding: GuistHomePageBinding(),
      ),
      GetPage(
        name: '/guist_code',
        page: () => GuistCode(),
        binding: GuistCodeBinding(),
      ),
      GetPage(
        name: '/guist_subject',
        page: () => GuestSubject(),
        binding: GeustsubjectBinding(),
      ),
      GetPage(
        name: '/guist_Courses',
        page: () => GeustCourses(),
        binding: CoursesGeustBinding(),
      ),
      GetPage(
        name: '/guist_Video',
        page: () => VideoGuest(),
        binding: VideoGuestBinding(),
      ),
      //notification
      GetPage(
        name: '/student_notification',
        page: () => StudentNotification(),
        binding: StudentNotificationBinding(),
      ),
      GetPage(
        name: '/teacher_notification',
        page: () => TeacherNotification(),
        binding: TeacherNotificationBinding(),
      ),
    ],
    locale: LocalizationService.locale,
    fallbackLocale: LocalizationService.fallbackLocale,
    translations: LocalizationService(),
  ));
}
