class CreateEvaluationRequest {
  String? vehicleLocation;
  String? make;
  String? model;
  String? variant;
  String? rto;
  int? engineCylinder;
  String? fuelType;
  String? monthAndYearOfManufacture;
  String? ownershipNumber;
  String? regDate;
  String? regValidity;
  String? taxValidity;
  String? regState;
  String? bodyType;
  String? vehicleUsage;
  String? duplicateKey;
  String? rcAvailability;
  String? engineCC;
  String? engineNumber;
  String? chasisNumber;
  String? color;
  String? seats;
  String? odometerWorking;
  int? odometerReading;
  String? accidential;
  String? oemWarrantyRemain;
  int? oemMonthRemain;
  String? oemKmRemain;
  String? isCarRegistered;
  String? regNumber;
  String? sellerName;
  String? rcOwnerName;
  String? sellerAddress;
  int? sellerMobileNumber;
  int? rcOwnerMobileNumber;
  String? customerPrice;
  String? transmission;
  String? remarks;

  CreateEvaluationRequest(
      {this.vehicleLocation,
        this.make,
        this.model,
        this.variant,
        this.rto,
        this.engineCylinder,
        this.fuelType,
        this.monthAndYearOfManufacture,
        this.ownershipNumber,
        this.regDate,
        this.regValidity,
        this.taxValidity,
        this.regState,
        this.bodyType,
        this.vehicleUsage,
        this.duplicateKey,
        this.rcAvailability,
        this.engineCC,
        this.engineNumber,
        this.chasisNumber,
        this.color,
        this.seats,
        this.odometerWorking,
        this.odometerReading,
        this.accidential,
        this.oemWarrantyRemain,
        this.oemMonthRemain,
        this.oemKmRemain,
        this.isCarRegistered,
        this.regNumber,
        this.sellerName,
        this.rcOwnerName,
        this.sellerAddress,
        this.sellerMobileNumber,
        this.rcOwnerMobileNumber,
        this.customerPrice,
        this.transmission,
        this.remarks});

  CreateEvaluationRequest.fromJson(Map<String, dynamic> json) {
    vehicleLocation = json['vehicleLocation'];
    make = json['make'];
    model = json['model'];
    variant = json['variant'];
    rto = json['rto'];
    engineCylinder = json['engineCylinder'];
    fuelType = json['fuelType'];
    monthAndYearOfManufacture = json['monthAndYearOfManufacture'];
    ownershipNumber = json['ownershipNumber'];
    regDate = json['regDate'];
    regValidity = json['regValidity'];
    taxValidity = json['taxValidity'];
    regState = json['regState'];
    bodyType = json['bodyType'];
    vehicleUsage = json['vehicleUsage'];
    duplicateKey = json['duplicateKey'];
    rcAvailability = json['rcAvailability'];
    engineCC = json['engineCC'];
    engineNumber = json['engineNumber'];
    chasisNumber = json['chasisNumber'];
    color = json['color'];
    seats = json['seats'];
    odometerWorking = json['odometerWorking'];
    odometerReading = json['odometerReading'];
    accidential = json['accidential'];
    oemWarrantyRemain = json['oemWarrantyRemain'];
    oemMonthRemain = json['oemMonthRemain'];
    oemKmRemain = json['oemKmRemain'];
    isCarRegistered = json['isCarRegistered'];
    regNumber = json['regNumber'];
    sellerName = json['sellerName'];
    rcOwnerName = json['rcOwnerName'];
    sellerAddress = json['sellerAddress'];
    sellerMobileNumber = json['sellerMobileNumber'];
    rcOwnerMobileNumber = json['rcOwnerMobileNumber'];
    customerPrice = json['customerPrice'];
    transmission = json['transmission'];
    remarks = json['remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vehicleLocation'] = vehicleLocation;
    data['make'] = make;
    data['model'] = model;
    data['variant'] = variant;
    data['rto'] = rto;
    data['engineCylinder'] = engineCylinder;
    data['fuelType'] = fuelType;
    data['monthAndYearOfManufacture'] = monthAndYearOfManufacture;
    data['ownershipNumber'] = ownershipNumber;
    data['regDate'] = regDate;
    data['regValidity'] = regValidity;
    data['taxValidity'] = taxValidity;
    data['regState'] = regState;
    data['bodyType'] = bodyType;
    data['vehicleUsage'] = vehicleUsage;
    data['duplicateKey'] = duplicateKey;
    data['rcAvailability'] = rcAvailability;
    data['engineCC'] = engineCC;
    data['engineNumber'] = engineNumber;
    data['chasisNumber'] = chasisNumber;
    data['color'] = color;
    data['seats'] = seats;
    data['odometerWorking'] = odometerWorking;
    data['odometerReading'] = odometerReading;
    data['accidential'] = accidential;
    data['oemWarrantyRemain'] = oemWarrantyRemain;
    data['oemMonthRemain'] = oemMonthRemain;
    data['oemKmRemain'] = oemKmRemain;
    data['isCarRegistered'] = isCarRegistered;
    data['regNumber'] = regNumber;
    data['sellerName'] = sellerName;
    data['rcOwnerName'] = rcOwnerName;
    data['sellerAddress'] = sellerAddress;
    data['sellerMobileNumber'] = sellerMobileNumber;
    data['rcOwnerMobileNumber'] = rcOwnerMobileNumber;
    data['customerPrice'] = customerPrice;
    data['transmission'] = transmission;
    data['remarks'] = remarks;
    return data;
  }
}
