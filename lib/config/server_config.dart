class ServerConfig {
  //DomainNameServer
  static const DNS = 'http://192.168.233.138:8000/api';
  //auth
  static const login = '/login';

  static const teacherAds = '/tescher-ads';
  static const changeLang = '/change-language';

  // teachercourser
  static const Uploadvideo = '/upload-video';
  static const Teachervideos = '/teacher-videos';
  static const Teachergrades = '/teacher-grades';
  //uploadfile
  static const Uploadfile = '/upload-file';
  //deleteVedio
  static const delete = '/delet-video?Video_Id=';
  //teacherclasses
  static const teacher_classes = '/my-classes';
  static const class_studens = '/class-studens?Class_Id=';
  static const evaluat_student = '/evaluat-student?student_id=';
  static const teacher_documents = '/teacher-documents';
  static const delete_file = '/delet-file?File_Id=';
  // student auth
  static const studentlogin = '/student-login';
  static const studentchangeLang = '/student-change-language';

  // student history
  static const studentevaloations = '/student-evaloations';
  static const studentmarks = '/student-marks';
  // student home page
  static const studentAds = '/student-ads';
  static const student_Ads_file = '/student-ads-files';
  static const subjects_list = '/subjects-list';
  static const my_notes = '/my-notes';
  static const documents_list = '/documents-list?subject_id=';
  static const send_note = '/send-note?note=';
  // student video by subject id
  static const getStudent_video = '/videos-list?subject_id=';
  // guist
  static const guist_course = '/guest-course';
  static const guist_class = '/grade-list';
  static const guist_subject = '/subject-list';
  //notification
  static const update_fir_token = '/update-firebase-token';
  static const user_notification = '/index';


}
