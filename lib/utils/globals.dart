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
String? carId;
String? phoneNum;
String? password;
var headers = {'Authorization': 'Bearer $token'};
var jsonHeaders = {'Authorization': 'Bearer $token','Content-Type': 'application/json',};

void clearData(){
  userName = null;
  userId = null;
  uniqueUserId = null;
  documentStatus = null;
  addressProofFront = null;
  isDeposited = null;
  isOnboarding = true;
  city = null;
  contactNo = null;
  token = null;
  carId = null;
  phoneNum = null;
  password = null;
}
