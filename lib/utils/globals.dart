library my_prj.globals;

String? userName;
String? userId;
String? uniqueUserId;
String? documentStatus;
bool? addressProofFront;
bool? isDeposited = false;
bool? isOnboarding;
String? city;
int? contactNo;
String? token ;
String? refreshToken ;
String? carId;
String? phoneNum;
String? email;
String? fcmToken;
var headers = {'Authorization': 'Bearer $token'};
var jsonHeaders = {'Content-Type': 'application/json','Authorization': 'Bearer $token',};

void clearData(){
  userName = null;
  userId = null;
  // uniqueUserId = null;
  documentStatus = null;
  addressProofFront = null;
  isDeposited = null;
  isOnboarding = null;
  city = null;
  contactNo = null;
  token = null;
  refreshToken = null;
  carId = null;
  phoneNum = null;
  email = null;
  headers = {};
  // jsonHeaders = {};
}
