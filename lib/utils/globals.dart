library my_prj.globals;

String? userName;
String? userId;
String? uniqueUserId = '65eed25c48573dc480cf89a9';
String? documentStatus;
bool? addressProofFront;
bool? isDeposited = false;
String? city;
int? contactNo;
String? token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWVlZDI1YzQ4NTczZGM0ODBjZjg5YTkiLCJyb2xlIjoiREVBTEVSIiwiaWF0IjoxNzEyNTYwNDcxLCJleHAiOjE3MTUxNTI0NzF9.PZWwL-7l9YLKhRXsRVTz-DHdb_yJaJmtyWkrdSPPhUQ';
String? carId;
String? phoneNum;
String? password;
var headers = {'Authorization': 'Bearer $token'};
var jsonHeaders = {'Authorization': 'Bearer $token','Content-Type': 'application/json',};
