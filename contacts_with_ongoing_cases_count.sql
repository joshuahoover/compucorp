SELECT addressee_display, organization_name, COUNT(civicrm_contact.id) as 'Case count'
FROM civicrm_contact
  JOIN civicrm_case_contact ON civicrm_case_contact.contact_id = civicrm_contact.id
  JOIN civicrm_case ON civicrm_case.id = civicrm_case_contact.case_id
  JOIN civicrm_option_value ON civicrm_option_value.value = civicrm_case.status_id
  JOIN civicrm_option_group ON civicrm_option_group.id = civicrm_option_value.option_group_id
WHERE civicrm_contact.contact_type = 'Individual'
  AND civicrm_option_group.name = 'case_status'
GROUP BY civicrm_contact.id;
