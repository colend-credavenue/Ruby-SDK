=begin
#Allcloud (Allcloud)

## Integration Document  The following are the endpoints to be called during and pre/post disbursement state of a loan.  ## Authentication  Authentication details and host will be shared privately.  ## Workflow  **Create Loan** is the initial endpoint to be called to create a loan. Loan will be processed in the background and the status of loan will be provided through the configured Webhook. However, the client can also poll the server via the **Get Loan Details** endpoint to know the loan's status(**Get Loan Details** is rate throttled and polling this API will be restricted). Loan's shall be considered rejected if proper response is not available within 10minutes.  All other endpoints are self-explanatory and can be retried upto 3 times before marking as failure.  ## Allowed Links  All Link attributes should contain 1. Accessible File Link URL which can be Public/Expiry URL/Whitelisted File Server Link(Write to tech.colending@credavenue.com for obtaining our IP address to whitelist) 2. File Link URL with Header Authentication (Header values should be shared with tech.colending@credavenue.com)  ## Allowed Fields Length <table border=\"2\" cellspacing=\"0\" cellpadding=\"6\" rules=\"groups\" frame=\"hsides\">  <colgroup>  <col  class=\"org-left\" />  <col  class=\"org-left\" />  </colgroup> <thead> <tr> <th scope=\"col\" class=\"org-left\">Data Type</th> <th scope=\"col\" class=\"org-left\">Max Length</th> </tr> </thead>  <tbody> <tr> <td class=\"org-left\">String</td> <td class=\"org-left\">65,535 bytes</td> </tr>  <tr> <td class=\"org-left\">Float</td> <td class=\"org-left\">8 bytes</td> </tr>  <tr> <td class=\"org-left\">Integer</td> <td class=\"org-left\">4 bytes</td> </tr>  <tr> <td class=\"org-left\">Date</td> <td class=\"org-left\">10 characters</td> </tr>  </tbody> </table>  # Webhooks  Webhooks can be configured for the below events  1. Loan status change      Response Payload :      {         \"product_id\": \"\",         \"client_loan_id\": \"\",         \"principal_amount\": \"\",         \"interest_rate\": \"\",         \"tenure\": \"\",         \"tenure_frequency\": \"MONTHLY\",         \"cibil_score\": \"\",         \"purpose\": \"\",         \"repayment_frequency\":\"\",         \"number_of_repayments\": \"\",         \"status\": \"\",         \"principal_outstanding\": \"\",         \"reject_reason\": \"\"     }          Statuses : ['new', 'approved', 'rejected', 'agreement_signed', 'dropped', 'disbursement_ready', 'disbursed', 'matured', 'partner_settled']     2. Loan disbursement details (Disbursed through razorpay)      Callback Payload:      {         \"client_loan_id\":\"\",         \"status\":\"borrower_disbursed\",         \"disbursed_date\":\"\",         \"utr_number\":\"\",         \"disbursement_type\":\"\",         \"payment_reversed\": \"TRUE/FALSE\",         \"disbursement_amount\":\"\",         \"investor_disbursed_amount\": \"\",         \"partner_disbursed_amount\": \"\",         \"differential_interest\":\"\",         \"investor_differential_interest\":\"\",         \"partner_differential_interest\":\"\",         \"differential_days\":\"\",         \"interest_start_date\":\"\",         \"investor_processing_fee\":\"\",         \"partner_processing_fee\":\"\",         \"investor_stamp_duty\":\"\",         \"partner_stamp_duty\":\"\",         \"investor_documentation_charges\":\"\",         \"partner_documentation_charges\":\"\"     }  Provide the following details to configure the webhooks 1. callback URL 2. authentication for the callback URL (header authentication)    # Validations  **PAN**  - **Example**: ABGPA1232P - **Sequence**: First five digits will be alpha, next four will be Numerical and again last single digit will be alpha  **GSTIN**  - **Example**: 33AAACT2727Q1ZV - **Sequence**: First two digits is Numerical, Next is PAN sequence as specified above, again thirteenth digit will be numerical, fourteenth digit is alpha, last digit will be alpha or numerical  **CIN**  - **Example**: U65929TN2017PTC117196 - **Sequence**: First digit is Alpha, next 5 numeric digits, next two alpha, next set of 4 numeric digits, Next 3 alpha, last 6 numeric digits  **PASSPORT**  - **Example**: A2096457 - **Sequence**: Total 8 digits, first digit is Alpha, remaining digits are numerical  **AADHAR NO**  - The standard 12 digits numerical.  **MOBILE NO**  - **Sequence**: 10 numerical digits  **IFSC CODE**  - **Example**: PUNB0596600 - **Sequence**: First four alpha, next fifth digit is 0 (zero) always and last six digit is alpha/numeric. Totally 11 digits.  **PIN CODE**  - 6 numerical digits

OpenAPI spec version: 0.0.1
Contact: support@colending.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 3.0.29
=end

require 'date'

module Colending
  # Refer table BureauReportData for attributes
  class ResponseCreateTrancheBureauReportData
    # Cibil / Experian / Himark
    attr_accessor :name_of_bureau

    # Vintage in the bureau. Number of years from the first trade line
    attr_accessor :bureau_vintage

    # Bureau Score
    attr_accessor :bureau_score

    # Document of the bureau
    attr_accessor :bureau_report_link

    # Document of the bureau - Password
    attr_accessor :bureau_report_link_password

    # Bureau Json placed in a link
    attr_accessor :bureau_json_link

    # Bureau Json placed in a link - Password
    attr_accessor :bureau_json_link_password

    # Refer table BureauJson for attributes
    attr_accessor :bureau_json

    # CRIF score
    attr_accessor :commercial_bureau_score

    # Commercial Bureau Document
    attr_accessor :commercial_bureau_score_link

    # Commercial Bureau Document Password
    attr_accessor :commercial_bureau_score_link_password

    # Score Captured by the Partner
    attr_accessor :partner_score_on_the_customer

    # Total Existing Obligations basis the Bureau Report
    attr_accessor :total_existing_obligations

    # Total Credit Card Limit basis the Bureau Report
    attr_accessor :credit_card_limit

    # Total Number of Credit Cards per Bureau Report
    attr_accessor :number_of_credit_cards

    # Total Number of Unsecured Loans per Bureau Report
    attr_accessor :number_of_unsecured_loans

    # Total value of unsecured loans
    attr_accessor :value_of_total_unsecured_loans

    # Total Number of Loans per Bureau Report
    attr_accessor :number_of_loans

    # Total value of loans
    attr_accessor :value_of_total_loans

    # Number of Enquiries in the Last 3 Months per Bureau Report
    attr_accessor :number_of_enquiries_3months

    # Number of Enquiries in the Last 6 Months per Bureau Report
    attr_accessor :number_of_enquiries_6months

    # Number of Enquiries in the Last 12 Months per Bureau Report
    attr_accessor :number_of_enquiries_12months

    # Maximum DPD Tradeline in the Last 3 Months
    attr_accessor :max_dpd_tradeline_last_3months

    # Maximum DPD Tradeline in the Last 6 Months
    attr_accessor :max_dpd_tradeline_last_6months

    # Number of Pl enquiries in the Last 30 days
    attr_accessor :number_of_pl_enquiries_in_last_30days

    # Value of total outstanding loans
    attr_accessor :value_of_total_outstanding_loans

    # Number of Writeoff Suitfiled Settled in the Last 12 Months
    attr_accessor :number_of_writeoff_suitfiled_settled_12months

    # Maximum DPD Tradeline in the Last 12 Months
    attr_accessor :max_dpd_tradeline_12months

    # Maximum Overdue Tradeline
    attr_accessor :max_overdue_tradeline

    # Total Overdue Amount in the Last 12 Months
    attr_accessor :total_overdue_amount_12months

    # Loan Amount Settled in the Last 12 Months
    attr_accessor :loan_amount_settled_12months

    # The nature of past loan settlement if any (Loan 1) - Settled/ Closed/ Written-off
    attr_accessor :nature_of_loan_settled1

    # The nature of past loan settlement if any (Loan 2) - Settled/ Closed/ Written-off
    attr_accessor :nature_of_loan_settled2

    # Total EMI Bounces
    attr_accessor :total_emi_bounces

    # EMI Bounces in the Last 6 Months
    attr_accessor :emi_bounces_6months

    # EMI Bounces in the Last 12 Months
    attr_accessor :emi_bounces_12months

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'name_of_bureau' => :'name_of_bureau',
        :'bureau_vintage' => :'bureau_vintage',
        :'bureau_score' => :'bureau_score',
        :'bureau_report_link' => :'bureau_report_link',
        :'bureau_report_link_password' => :'bureau_report_link_password',
        :'bureau_json_link' => :'bureau_json_link',
        :'bureau_json_link_password' => :'bureau_json_link_password',
        :'bureau_json' => :'bureau_json',
        :'commercial_bureau_score' => :'commercial_bureau_score',
        :'commercial_bureau_score_link' => :'commercial_bureau_score_link',
        :'commercial_bureau_score_link_password' => :'commercial_bureau_score_link_password',
        :'partner_score_on_the_customer' => :'partner_score_on_the_customer',
        :'total_existing_obligations' => :'total_existing_obligations',
        :'credit_card_limit' => :'credit_card_limit',
        :'number_of_credit_cards' => :'number_of_credit_cards',
        :'number_of_unsecured_loans' => :'number_of_unsecured_loans',
        :'value_of_total_unsecured_loans' => :'value_of_total_unsecured_loans',
        :'number_of_loans' => :'number_of_loans',
        :'value_of_total_loans' => :'value_of_total_loans',
        :'number_of_enquiries_3months' => :'number_of_enquiries_3months',
        :'number_of_enquiries_6months' => :'number_of_enquiries_6months',
        :'max_dpd_tradeline_last_3months' => :'max_dpd_tradeline_last_3months',
        :'max_dpd_tradeline_last_6months' => :'max_dpd_tradeline_last_6months',
        :'number_of_pl_enquiries_in_last_30days' => :'number_of_pl_enquiries_in_last_30days',
        :'value_of_total_outstanding_loans' => :'value_of_total_outstanding_loans',
        :'number_of_enquiries_12months' => :'number_of_enquiries_12months',
        :'number_of_writeoff_suitfiled_settled_12months' => :'number_of_writeoff_suitfiled_settled_12months',
        :'max_dpd_tradeline_12months' => :'max_dpd_tradeline_12months',
        :'max_overdue_tradeline' => :'max_overdue_tradeline',
        :'total_overdue_amount_12months' => :'total_overdue_amount_12months',
        :'loan_amount_settled_12months' => :'loan_amount_settled_12months',
        :'nature_of_loan_settled1' => :'nature_of_loan_settled1',
        :'nature_of_loan_settled2' => :'nature_of_loan_settled2',
        :'total_emi_bounces' => :'total_emi_bounces',
        :'emi_bounces_6months' => :'emi_bounces_6months',
        :'emi_bounces_12months' => :'emi_bounces_12months'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'name_of_bureau' => :'Object',
        :'bureau_vintage' => :'Object',
        :'bureau_score' => :'Object',
        :'bureau_report_link' => :'Object',
        :'bureau_report_link_password' => :'Object',
        :'bureau_json_link' => :'Object',
        :'bureau_json_link_password' => :'Object',
        :'bureau_json' => :'Object',
        :'commercial_bureau_score' => :'Object',
        :'commercial_bureau_score_link' => :'Object',
        :'commercial_bureau_score_link_password' => :'Object',
        :'partner_score_on_the_customer' => :'Object',
        :'total_existing_obligations' => :'Object',
        :'credit_card_limit' => :'Object',
        :'number_of_credit_cards' => :'Object',
        :'number_of_unsecured_loans' => :'Object',
        :'value_of_total_unsecured_loans' => :'Object',
        :'number_of_loans' => :'Object',
        :'value_of_total_loans' => :'Object',
        :'number_of_enquiries_3months' => :'Object',
        :'number_of_enquiries_6months' => :'Object',
        :'number_of_enquiries_12months' => :'Object',
        :'number_of_writeoff_suitfiled_settled_12months' => :'Object',
        :'max_dpd_tradeline_12months' => :'Object',
        :'max_dpd_tradeline_last_12months' => :'Object',
        :'max_dpd_tradeline_last_3months' => :'Object',
        :'max_dpd_tradeline_last_6months' => :'Object',
        :'number_of_pl_enquiries_in_last_30days' => :'Object',
        :'value_of_total_outstanding_loans' => :'Object',
        :'max_overdue_tradeline' => :'Object',
        :'total_overdue_amount_12months' => :'Object',
        :'loan_amount_settled_12months' => :'Object',
        :'nature_of_loan_settled1' => :'Object',
        :'nature_of_loan_settled2' => :'Object',
        :'total_emi_bounces' => :'Object',
        :'emi_bounces_6months' => :'Object',
        :'emi_bounces_12months' => :'Object'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end
  
    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Colending::ResponseCreateTrancheBureauReportData` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Colending::ResponseCreateTrancheBureauReportData`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'name_of_bureau')
        self.name_of_bureau = attributes[:'name_of_bureau']
      end

      if attributes.key?(:'bureau_vintage')
        self.bureau_vintage = attributes[:'bureau_vintage']
      end

      if attributes.key?(:'bureau_score')
        self.bureau_score = attributes[:'bureau_score']
      end

      if attributes.key?(:'bureau_report_link')
        if (value = attributes[:'bureau_report_link']).is_a?(Array)
          self.bureau_report_link = value
        end
      end

      if attributes.key?(:'bureau_report_link_password')
        self.bureau_report_link_password = attributes[:'bureau_report_link_password']
      end

      if attributes.key?(:'bureau_json_link')
        if (value = attributes[:'bureau_json_link']).is_a?(Array)
          self.bureau_json_link = value
        end
      end

      if attributes.key?(:'bureau_json_link_password')
        self.bureau_json_link_password = attributes[:'bureau_json_link_password']
      end

      if attributes.key?(:'bureau_json')
        if (value = attributes[:'bureau_json']).is_a?(Array)
          self.bureau_json = value
        end
      end

      if attributes.key?(:'commercial_bureau_score')
        self.commercial_bureau_score = attributes[:'commercial_bureau_score']
      end

      if attributes.key?(:'commercial_bureau_score_link')
        if (value = attributes[:'commercial_bureau_score_link']).is_a?(Array)
          self.commercial_bureau_score_link = value
        end
      end

      if attributes.key?(:'commercial_bureau_score_link_password')
        self.commercial_bureau_score_link_password = attributes[:'commercial_bureau_score_link_password']
      end

      if attributes.key?(:'partner_score_on_the_customer')
        self.partner_score_on_the_customer = attributes[:'partner_score_on_the_customer']
      end

      if attributes.key?(:'total_existing_obligations')
        self.total_existing_obligations = attributes[:'total_existing_obligations']
      end

      if attributes.key?(:'credit_card_limit')
        self.credit_card_limit = attributes[:'credit_card_limit']
      end

      if attributes.key?(:'number_of_credit_cards')
        self.number_of_credit_cards = attributes[:'number_of_credit_cards']
      end

      if attributes.key?(:'number_of_unsecured_loans')
        self.number_of_unsecured_loans = attributes[:'number_of_unsecured_loans']
      end

      if attributes.key?(:'value_of_total_unsecured_loans')
        self.value_of_total_unsecured_loans = attributes[:'value_of_total_unsecured_loans']
      end

      if attributes.key?(:'number_of_loans')
        self.number_of_loans = attributes[:'number_of_loans']
      end

      if attributes.key?(:'value_of_total_loans')
        self.value_of_total_loans = attributes[:'value_of_total_loans']
      end

      if attributes.key?(:'number_of_enquiries_3months')
        self.number_of_enquiries_3months = attributes[:'number_of_enquiries_3months']
      end

      if attributes.key?(:'number_of_enquiries_6months')
        self.number_of_enquiries_6months = attributes[:'number_of_enquiries_6months']
      end

      if attributes.key?(:'number_of_enquiries_12months')
        self.number_of_enquiries_12months = attributes[:'number_of_enquiries_12months']
      end

      if attributes.key?(:'number_of_writeoff_suitfiled_settled_12months')
        self.number_of_writeoff_suitfiled_settled_12months = attributes[:'number_of_writeoff_suitfiled_settled_12months']
      end

      if attributes.key?(:'max_dpd_tradeline_12months')
        self.max_dpd_tradeline_12months = attributes[:'max_dpd_tradeline_12months']
      end

      if attributes.key?(:'max_dpd_tradeline_last_3months')
        self.max_dpd_tradeline_last_3months = attributes[:'max_dpd_tradeline_last_3months']
      end

      if attributes.key?(:'number_of_pl_enquiries_in_last_30days')
        self.number_of_pl_enquiries_in_last_30days = attributes[:'number_of_pl_enquiries_in_last_30days']
      end

      if attributes.key?(:'max_dpd_tradeline_last_6months')
        self.max_dpd_tradeline_last_6months = attributes[:'max_dpd_tradeline_last_6months']
      end

      if attributes.key?(:'value_of_total_outstanding_loans')
        self.value_of_total_outstanding_loans = attributes[:'value_of_total_outstanding_loans']
      end

      if attributes.key?(:'max_overdue_tradeline')
        self.max_overdue_tradeline = attributes[:'max_overdue_tradeline']
      end

      if attributes.key?(:'total_overdue_amount_12months')
        self.total_overdue_amount_12months = attributes[:'total_overdue_amount_12months']
      end

      if attributes.key?(:'loan_amount_settled_12months')
        self.loan_amount_settled_12months = attributes[:'loan_amount_settled_12months']
      end

      if attributes.key?(:'nature_of_loan_settled1')
        self.nature_of_loan_settled1 = attributes[:'nature_of_loan_settled1']
      end

      if attributes.key?(:'nature_of_loan_settled2')
        self.nature_of_loan_settled2 = attributes[:'nature_of_loan_settled2']
      end

      if attributes.key?(:'total_emi_bounces')
        self.total_emi_bounces = attributes[:'total_emi_bounces']
      end

      if attributes.key?(:'emi_bounces_6months')
        self.emi_bounces_6months = attributes[:'emi_bounces_6months']
      end

      if attributes.key?(:'emi_bounces_12months')
        self.emi_bounces_12months = attributes[:'emi_bounces_12months']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          name_of_bureau == o.name_of_bureau &&
          bureau_vintage == o.bureau_vintage &&
          bureau_score == o.bureau_score &&
          bureau_report_link == o.bureau_report_link &&
          bureau_report_link_password == o.bureau_report_link_password &&
          bureau_json_link == o.bureau_json_link &&
          bureau_json_link_password == o.bureau_json_link_password &&
          bureau_json == o.bureau_json &&
          commercial_bureau_score == o.commercial_bureau_score &&
          commercial_bureau_score_link == o.commercial_bureau_score_link &&
          commercial_bureau_score_link_password == o.commercial_bureau_score_link_password &&
          partner_score_on_the_customer == o.partner_score_on_the_customer &&
          total_existing_obligations == o.total_existing_obligations &&
          credit_card_limit == o.credit_card_limit &&
          number_of_credit_cards == o.number_of_credit_cards &&
          number_of_unsecured_loans == o.number_of_unsecured_loans &&
          value_of_total_unsecured_loans == o.value_of_total_unsecured_loans &&
          number_of_loans == o.number_of_loans &&
          value_of_total_loans == o.value_of_total_loans &&
          number_of_enquiries_3months == o.number_of_enquiries_3months &&
          number_of_enquiries_6months == o.number_of_enquiries_6months &&
          number_of_enquiries_12months == o.number_of_enquiries_12months &&
          number_of_writeoff_suitfiled_settled_12months == o.number_of_writeoff_suitfiled_settled_12months &&
          max_dpd_tradeline_12months == o.max_dpd_tradeline_12months &&
          max_dpd_tradeline_last_3months == o.max_dpd_tradeline_last_3months &&
          max_dpd_tradeline_last_6months == o.max_dpd_tradeline_last_6months &&
          number_of_pl_enquiries_in_last_30days == o.number_of_pl_enquiries_in_last_30days &&
          value_of_total_outstanding_loans == o.value_of_total_outstanding_loans &&
          max_overdue_tradeline == o.max_overdue_tradeline &&
          total_overdue_amount_12months == o.total_overdue_amount_12months &&
          loan_amount_settled_12months == o.loan_amount_settled_12months &&
          nature_of_loan_settled1 == o.nature_of_loan_settled1 &&
          nature_of_loan_settled2 == o.nature_of_loan_settled2 &&
          total_emi_bounces == o.total_emi_bounces &&
          emi_bounces_6months == o.emi_bounces_6months &&
          emi_bounces_12months == o.emi_bounces_12months
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [name_of_bureau, bureau_vintage, bureau_score, bureau_report_link, bureau_report_link_password, bureau_json_link, bureau_json_link_password, bureau_json, commercial_bureau_score, commercial_bureau_score_link, commercial_bureau_score_link_password, partner_score_on_the_customer, total_existing_obligations, credit_card_limit, number_of_credit_cards, number_of_unsecured_loans, value_of_total_unsecured_loans, number_of_loans, value_of_total_loans, number_of_enquiries_3months, number_of_enquiries_6months, number_of_enquiries_12months, number_of_writeoff_suitfiled_settled_12months, max_dpd_tradeline_12months, number_of_pl_enquiries_in_last_30days, value_of_total_outstanding_loans, max_dpd_tradeline_last_3months, max_dpd_tradeline_last_6months, max_overdue_tradeline, total_overdue_amount_12months, loan_amount_settled_12months, nature_of_loan_settled1, nature_of_loan_settled2, total_emi_bounces, emi_bounces_6months, emi_bounces_12months].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.openapi_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        elsif attributes[self.class.attribute_map[key]].nil? && self.class.openapi_nullable.include?(key)
          self.send("#{key}=", nil)
        end
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        Colending.const_get(type).build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end  end
end
