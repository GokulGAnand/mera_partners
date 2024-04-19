library my_prj.globals;

String? userName;
String? userId;
String? uniqueUserId;
String? documentStatus;
bool? addressProofFront;
bool? isDeposited = false;
String? city;
int? contactNo;
String? token ;
String? carId;
String? phoneNum;
String? password;
var headers = {'Authorization': 'Bearer $token'};
var jsonHeaders = {'Authorization': 'Bearer $token','Content-Type': 'application/json',};
