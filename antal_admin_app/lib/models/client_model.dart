class ClientModel {

  var member_name,relationship,reporting_manager,office_location,bank_name,account_no,ifsc_code,pan_no,aadhar_no,contact_no,email,emergency_contact_name,emergency_contact_no,
  total_exp,location_of_residence,id;
  

  ClientModel({this.member_name,this.relationship,this.reporting_manager,this.office_location,this.bank_name,this.account_no,this.ifsc_code,this.pan_no,this.aadhar_no,this.contact_no,
  this.email,this.emergency_contact_name,this.emergency_contact_no,this.total_exp,this.location_of_residence,this.id});

  factory ClientModel.fromJson(Map<String, dynamic> item) { 
    return ClientModel(
      id: item['id'],
      member_name: item['member_name'],
      relationship: item['relationship'],
      reporting_manager: item['reporting_manager'],
      office_location: item['office_location'],
      bank_name: item['bank_name'],
      account_no: item['account_no'],
      ifsc_code: item['ifsc_code'],
      pan_no: item['pan_no'],
      aadhar_no: item['aadhar_no'],
      contact_no: item['contact_no'],
      email: item['email'],
      emergency_contact_name: item['emergency_contact_name'],
      emergency_contact_no: item['emergency_contact_no'],
      total_exp: item['total_exp'],
      location_of_residence: item['location_of_residence']

      );
  }

  Map<String, dynamic> toJson() {
    return {
      "id":id,
      "member_name":member_name,
      "relationship":relationship,
      "reporting_manager":reporting_manager,
      "office_location":office_location,
      "bank_name":bank_name,
      "account_no":account_no,
      "ifsc_code":ifsc_code,
      "pan_no":pan_no,
      "aadhar_no":aadhar_no,
      "contact_no":contact_no,
      "email":email,
      "emergency_contact_name":emergency_contact_name,
      "emergency_contact_no":emergency_contact_no,
      "total_exp":total_exp,
      "location_of_residence":location_of_residence,
    };
  }
}