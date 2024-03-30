library my_prj.globals;

String? userName;
String? userId;
String? documentStatus;
bool? addressProofFront;
String? city;
int? contactNo;
String? token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWVlZDI1YzQ4NTczZGM0ODBjZjg5YTkiLCJyb2xlIjoiREVBTEVSIiwiaWF0IjoxNzExNzA4NTE3LCJleHAiOjE3MTQzMDA1MTd9.hqPsjFWxlTDNUC5MioZaCHpsyjsgK5uNYuq5KwXOBrQ';
String? carId;
String? phoneNum;
String? password;
var headers = {'Authorization': 'Bearer $token'};
var jsonHeaders = {'Authorization': 'Bearer $token','Content-Type': 'application/json',};
