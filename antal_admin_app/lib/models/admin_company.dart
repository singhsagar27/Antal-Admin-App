class AdminCompanyModel {

  var company_name , company_email ,mobile ,contact_person ,company_size ,billing_address ,pan_no ,gst_no, password, password_text ;
  

  AdminCompanyModel({ this.company_name, this.company_email, this.contact_person, this.billing_address, this.pan_no, this.gst_no, this.mobile, this.company_size, this.password, this.password_text });

  factory AdminCompanyModel.fromJson(Map<String, dynamic> item) {
    return AdminCompanyModel(
      company_name : item['company_name'] ,
      company_email : item['company_email'] ,
      contact_person : item['contact_person'] ,
      billing_address : item['billing_address'] ,
      pan_no : item['pan_no'] ,
      gst_no : item['gst_no'] ,
      mobile : item['mobile'] ,
      company_size : item['company_size'] ,
      password : item['password'] ,
      password_text : item['password_text'] ,


      );
  }

  Map<String, dynamic> toJson() {
    return {
      "company_name": company_name,
      "company_email": company_email,
      "contact_person": contact_person,
      "billing_address": billing_address,
      "pan_no": pan_no,
      "gst_no": gst_no,
      "mobile": mobile,
      "company_size": company_size,
      "password": password,
      "password_text": password,
    };
  }
}