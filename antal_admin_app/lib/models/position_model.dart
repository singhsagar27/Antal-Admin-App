class PositionModel {

  var admin_id, department_name, position_name, years_of_exp, salary_offered, accepted_educational_qualification, target_industry, position_type, position_level, 
  position_location, key_responsibility1, key_responsibility2, key_responsibility3, key_skill1, key_skill2, key_skill3, gender_preference, disability_hiring, type_disability_hiring, 
  working_days, working_timing, no_of_vacancies, expected_closure_date, special_req_note, id;
  

  PositionModel({ this.admin_id, this.department_name, this.position_name, this.years_of_exp, this.salary_offered, this.accepted_educational_qualification, this.target_industry, 
  this.position_type, this.position_level, this.position_location, this.key_responsibility1, this.key_responsibility2, this.key_responsibility3, this.key_skill1, this.key_skill2, 
  this.key_skill3, this.gender_preference, this.disability_hiring, this.type_disability_hiring, this.working_days, this.working_timing, this.no_of_vacancies, this.expected_closure_date,
   this.special_req_note, this.id});

  factory PositionModel.fromJson(Map<String, dynamic> item) {  
    return PositionModel(
      id: item['id'],
      admin_id: item['admin_id'],
      department_name: item['department_name'],
      position_name: item['position_name'],
      years_of_exp: item['years_of_exp'],
      salary_offered: item['salary_offered'],
      accepted_educational_qualification: item['accepted_educational_qualification'],
      target_industry: item['target_industry'],
      position_type: item['position_type'],
      position_level: item['position_level'],
      position_location: item['position_location'],
      key_responsibility1: item['key_responsibility1'],
      key_responsibility2: item['key_responsibility2'],
      key_responsibility3: item['key_responsibility3'],
      key_skill1: item['key_skill1'],
      key_skill2: item['key_skill2'],
      key_skill3: item['key_skill3'],
      gender_preference: item['gender_preference'],
      disability_hiring: item['disability_hiring'],
      type_disability_hiring: item['type_disability_hiring'],
      working_days: item['working_days'],
      working_timing: item['working_timing'],
      no_of_vacancies: item['no_of_vacancies'],
      expected_closure_date: item['expected_closure_date'],
      special_req_note: item['special_req_note'],

      );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "admin_id": admin_id,
      "department_name": department_name,
      "position_name": position_name,
      "years_of_exp": years_of_exp,
      "salary_offered": salary_offered,
      "accepted_educational_qualification": accepted_educational_qualification,
      "target_industry": target_industry,
      "position_type": position_type,
      "position_level": position_level,
      "position_location": position_location,
      "key_responsibility1": key_responsibility1,
      "key_responsibility2": key_responsibility2,
      "key_responsibility3": key_responsibility3,
      "key_skill1": key_skill1,
      "key_skill2": key_skill2,
      "key_skill3": key_skill3,
      "gender_preference": gender_preference,
      "disability_hiring": disability_hiring,
      "type_disability_hiring": type_disability_hiring,
      "working_days": working_days,
      "working_timing": working_timing,
      "no_of_vacancies": no_of_vacancies,
      "expected_closure_date": expected_closure_date,
      "special_req_note": special_req_note,
    };
  }
}