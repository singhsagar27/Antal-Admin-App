class CompanyModel {

  var partner_recruiter_id, company_name, business_entity_type, client_location, billing_address, pan_no, gst_no, industry, hr_contact_no, company_email, ceo_name, ceo_contact_no, 
  company_size, key_products, payment_credit_period;
  

  CompanyModel({this.partner_recruiter_id, this.company_name, this.business_entity_type, this.client_location, this.billing_address, this.pan_no, this.gst_no, this.industry, 
  this.hr_contact_no, this.company_email, this.ceo_name, this.ceo_contact_no, this.company_size, this.key_products, this.payment_credit_period, });

  factory CompanyModel.fromJson(Map<String, dynamic> item) {
    return CompanyModel(
      partner_recruiter_id : item['partner_recruiter_id'] ,
      company_name : item['company_name'] ,
      business_entity_type : item['business_entity_type'] ,
      client_location : item['client_location'] ,
      billing_address : item['billing_address'] ,
      pan_no : item['pan_no'] ,
      gst_no : item['gst_no'] ,
      industry : item['industry'] ,
      hr_contact_no : item['hr_contact_no'] ,
      company_email : item['company_email'] ,
      ceo_name : item['ceo_name'] ,
      ceo_contact_no : item['ceo_contact_no'] ,
      company_size : item['company_size'] ,
      key_products : item['key_products'] ,
      payment_credit_period : item['payment_credit_period'] ,

      );
  }

  Map<String, dynamic> toJson() {
    return {
      "partner_recruiter_id": partner_recruiter_id,
      "company_name": company_name,
      "business_entity_type": business_entity_type,
      "client_location": client_location,
      "billing_address": billing_address,
      "pan_no": pan_no,
      "gst_no": gst_no,
      "industry": industry,
      "hr_contact_no": hr_contact_no,
      "company_email": company_email,
      "ceo_name": ceo_name,
      "ceo_contact_no": ceo_contact_no,
      "company_size": company_size,
      "key_products": key_products,
      "payment_credit_period": payment_credit_period,
    };
  }
}