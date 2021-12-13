=begin
#Allcloud (Allcloud)

## Integration Document  The following are the endpoints to be called during and pre/post disbursement state of a loan.  ## Authentication  Authentication details and host will be shared privately.  ## Workflow  **Create Loan** is the initial endpoint to be called to create a loan. Loan will be processed in the background and the status of loan will be provided through the configured Webhook. However, the client can also poll the server via the **Get Loan Details** endpoint to know the loan's status(**Get Loan Details** is rate throttled and polling this API will be restricted). Loan's shall be considered rejected if proper response is not available within 10minutes.  All other endpoints are self-explanatory and can be retried upto 3 times before marking as failure.  ## Allowed Links  All Link attributes should contain 1. Accessible File Link URL which can be Public/Expiry URL/Whitelisted File Server Link(Write to tech.colending@credavenue.com for obtaining our IP address to whitelist) 2. File Link URL with Header Authentication (Header values should be shared with tech.colending@credavenue.com)  ## Allowed Fields Length <table border=\"2\" cellspacing=\"0\" cellpadding=\"6\" rules=\"groups\" frame=\"hsides\">  <colgroup>  <col  class=\"org-left\" />  <col  class=\"org-left\" />  </colgroup> <thead> <tr> <th scope=\"col\" class=\"org-left\">Data Type</th> <th scope=\"col\" class=\"org-left\">Max Length</th> </tr> </thead>  <tbody> <tr> <td class=\"org-left\">String</td> <td class=\"org-left\">65,535 bytes</td> </tr>  <tr> <td class=\"org-left\">Float</td> <td class=\"org-left\">8 bytes</td> </tr>  <tr> <td class=\"org-left\">Integer</td> <td class=\"org-left\">4 bytes</td> </tr>  <tr> <td class=\"org-left\">Date</td> <td class=\"org-left\">10 characters</td> </tr>  </tbody> </table>  # Webhooks  Webhooks can be configured for the below events  1. Loan status change      Response Payload :      {         \"product_id\": \"\",         \"client_loan_id\": \"\",         \"principal_amount\": \"\",         \"interest_rate\": \"\",         \"tenure\": \"\",         \"tenure_frequency\": \"MONTHLY\",         \"cibil_score\": \"\",         \"purpose\": \"\",         \"repayment_frequency\":\"\",         \"number_of_repayments\": \"\",         \"status\": \"\",         \"principal_outstanding\": \"\",         \"reject_reason\": \"\"     }          Statuses : ['new', 'approved', 'rejected', 'agreement_signed', 'dropped', 'disbursement_ready', 'disbursed', 'matured', 'partner_settled']     2. Loan disbursement details (Disbursed through razorpay)      Callback Payload:      {         \"client_loan_id\":\"\",         \"status\":\"borrower_disbursed\",         \"disbursed_date\":\"\",         \"utr_number\":\"\",         \"disbursement_type\":\"\",         \"payment_reversed\": \"TRUE/FALSE\",         \"disbursement_amount\":\"\",         \"investor_disbursed_amount\": \"\",         \"partner_disbursed_amount\": \"\",         \"differential_interest\":\"\",         \"investor_differential_interest\":\"\",         \"partner_differential_interest\":\"\",         \"differential_days\":\"\",         \"interest_start_date\":\"\",         \"investor_processing_fee\":\"\",         \"partner_processing_fee\":\"\",         \"investor_stamp_duty\":\"\",         \"partner_stamp_duty\":\"\",         \"investor_documentation_charges\":\"\",         \"partner_documentation_charges\":\"\"     }  Provide the following details to configure the webhooks 1. callback URL 2. authentication for the callback URL (header authentication)    # Validations  **PAN**  - **Example**: ABGPA1232P - **Sequence**: First five digits will be alpha, next four will be Numerical and again last single digit will be alpha  **GSTIN**  - **Example**: 33AAACT2727Q1ZV - **Sequence**: First two digits is Numerical, Next is PAN sequence as specified above, again thirteenth digit will be numerical, fourteenth digit is alpha, last digit will be alpha or numerical  **CIN**  - **Example**: U65929TN2017PTC117196 - **Sequence**: First digit is Alpha, next 5 numeric digits, next two alpha, next set of 4 numeric digits, Next 3 alpha, last 6 numeric digits  **PASSPORT**  - **Example**: A2096457 - **Sequence**: Total 8 digits, first digit is Alpha, remaining digits are numerical  **AADHAR NO**  - The standard 12 digits numerical.  **MOBILE NO**  - **Sequence**: 10 numerical digits  **IFSC CODE**  - **Example**: PUNB0596600 - **Sequence**: First four alpha, next fifth digit is 0 (zero) always and last six digit is alpha/numeric. Totally 11 digits.  **PIN CODE**  - 6 numerical digits

OpenAPI spec version: 0.0.1
Contact: support@colending.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 3.0.29
=end

# Common files
require 'credavenue_colending/api_client'
require 'credavenue_colending/api_error'
require 'credavenue_colending/version'
require 'credavenue_colending/configuration'

# Models
require 'credavenue_colending/models/agreement_signed_success'
require 'credavenue_colending/models/bad_request'
require 'credavenue_colending/models/body_agreement_signed'
require 'credavenue_colending/models/body_approve_fund_transfer'
require 'credavenue_colending/models/body_create_advance_collection'
require 'credavenue_colending/models/body_create_collection_entry'
require 'credavenue_colending/models/body_create_collection_entry_updated_rs'
require 'credavenue_colending/models/body_create_loan'
require 'credavenue_colending/models/body_create_loan_assets'
require 'credavenue_colending/models/body_create_loan_bank_statement'
require 'credavenue_colending/models/body_create_loan_business'
require 'credavenue_colending/models/body_create_loan_business_partnership_detail'
require 'credavenue_colending/models/body_create_loan_business_partnerships'
require 'credavenue_colending/models/body_create_loan_business_private_entity_detail'
require 'credavenue_colending/models/body_create_loan_co_applicants'
require 'credavenue_colending/models/body_create_loan_deviation_details'
require 'credavenue_colending/models/body_create_loan_disbursement_accounts'
require 'credavenue_colending/models/body_create_loan_financial_data'
require 'credavenue_colending/models/body_create_loan_guarantors'
require 'credavenue_colending/models/body_create_loan_insurance_details'
require 'credavenue_colending/models/body_create_loan_linked_loan_infos'
require 'credavenue_colending/models/body_create_loan_references'
require 'credavenue_colending/models/body_create_loan_sourcing_detail'
require 'credavenue_colending/models/body_create_loan_tranches'
require 'credavenue_colending/models/body_create_loan_video_kyc_detail'
require 'credavenue_colending/models/body_create_repayment_schedule'
require 'credavenue_colending/models/body_create_repayment_schedule_repayment_schedules'
require 'credavenue_colending/models/body_create_tranche'
require 'credavenue_colending/models/body_disburse_loan'
require 'credavenue_colending/models/body_disburse_loan_disbursement_accounts'
require 'credavenue_colending/models/body_get_loan_details'
require 'credavenue_colending/models/body_property_review'
require 'credavenue_colending/models/body_update_advance_collection'
require 'credavenue_colending/models/body_update_collection_entry'
require 'credavenue_colending/models/body_update_loan'
require 'credavenue_colending/models/body_update_loan_disbursement_accounts'
require 'credavenue_colending/models/body_update_post_disbursement'
require 'credavenue_colending/models/body_update_post_disbursement_bank_statement'
require 'credavenue_colending/models/body_update_post_disbursement_co_applicants'
require 'credavenue_colending/models/body_update_post_disbursement_financial_data'
require 'credavenue_colending/models/body_update_post_disbursement_insurance_details'
require 'credavenue_colending/models/body_update_post_disbursement_video_kyc_detail'
require 'credavenue_colending/models/body_update_repayment_schedule'
require 'credavenue_colending/models/body_update_repayment_schedule_repayment_schedules'
require 'credavenue_colending/models/body_upload_interest_accruals'
require 'credavenue_colending/models/client_name'
require 'credavenue_colending/models/create_collection_success'
require 'credavenue_colending/models/create_loan_error'
require 'credavenue_colending/models/create_loan_error_error'
require 'credavenue_colending/models/create_loan_success'
require 'credavenue_colending/models/create_rs_success'
require 'credavenue_colending/models/error_422_create_tranche'
require 'credavenue_colending/models/get_payment_success'
require 'credavenue_colending/models/get_payment_success_inner'
require 'credavenue_colending/models/get_rs_success'
require 'credavenue_colending/models/get_rs_success_inner'
require 'credavenue_colending/models/internal_server_error'
require 'credavenue_colending/models/loan_id'
require 'credavenue_colending/models/not_found'
require 'credavenue_colending/models/payment_id_update_collection_entry'
require 'credavenue_colending/models/product_id'
require 'credavenue_colending/models/property_review_success'
require 'credavenue_colending/models/request_success'
require 'credavenue_colending/models/response_create_tranche'
require 'credavenue_colending/models/response_create_tranche_bureau_report_data'
require 'credavenue_colending/models/response_create_tranche_business_data'
require 'credavenue_colending/models/response_create_tranche_business_data_partnership_detail'
require 'credavenue_colending/models/response_create_tranche_business_data_private_entity_detail'
require 'credavenue_colending/models/response_create_tranche_disbursement_accounts'
require 'credavenue_colending/models/response_create_tranche_loan_data'
require 'credavenue_colending/models/unauthorized'

# APIs
require 'credavenue_colending/api/colending_api'

module Colending
  class << self
    # Customize default settings for the SDK using block.
    #   Colending.configure do |config|
    #     config.username = "xxx"
    #     config.password = "xxx"
    #   end
    # If no block given, return the default Configuration object.
    def configure
      if block_given?
        yield(Configuration.default)
      else
        Configuration.default
      end
    end
  end
end
