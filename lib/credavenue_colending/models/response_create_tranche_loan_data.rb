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
  # Refer table LoanData for attributes
  class ResponseCreateTrancheLoanData
    # PAN Number of the Customer (10 digit Alphanumeric)
    attr_accessor :pan_number

    # PAN Document Link
    attr_accessor :pan_link

    # PAN Document Link
    attr_accessor :pan_link_password

    # Form 60 Doument Link (If applicable)
    attr_accessor :form_60_link

    # Form 60 Doument Link Password (If applicable)
    attr_accessor :form_60_link_password

    # Aadhar Number of the Customer (12 digits)
    attr_accessor :aadhar_number

    # Aadhar Document Link
    attr_accessor :aadhar_number_link

    # Aadhar Document Link
    attr_accessor :aadhar_number_link_password

    # Voter ID Number of the Customer
    attr_accessor :voter_id_number

    # Voter Document Link
    attr_accessor :voter_id_number_link

    # Voter Document Link
    attr_accessor :voter_id_number_link_password

    # Driving License Number of the Customer
    attr_accessor :driving_license_number

    # Driving License Document Link
    attr_accessor :driving_license_number_link

    # Driving License Document Link
    attr_accessor :driving_license_number_link_password

    # Passport Number of the Customer
    attr_accessor :passport_number

    # Passport Document Link
    attr_accessor :passport_link

    # Passport Document Link
    attr_accessor :passport_link_password

    # Video Image of the Applicant
    attr_accessor :video_image_link

    # Video Image of the Applicant
    attr_accessor :video_image_link_password

    attr_accessor :video_kyc_detail

    # KYC Number of the Customer
    attr_accessor :other_kyc_number

    # KYC Image of the Customer
    attr_accessor :other_kyc_number_link

    # KYC Image of the Customer
    attr_accessor :other_kyc_number_link_password

    # Rent Agreement Document Link
    attr_accessor :rent_agreement_link

    # Rent Agreement Document Link
    attr_accessor :rent_agreement_link_password

    # Utility Bills Copies (If any)
    attr_accessor :utility_bills_link

    # Utility Bills Copies (If any)
    attr_accessor :utility_bills_link_password

    # Photo Image of the Customer
    attr_accessor :photo_link

    # Photo Image of the Customer
    attr_accessor :photo_link_password

    # tier_1, tier_2 etc. for  the employer
    attr_accessor :employer_tier

    # Salaried / Self-Employed
    attr_accessor :employment_type

    # Employer Name
    attr_accessor :employment_details_name

    # Office Address
    attr_accessor :employment_details_address

    # Applicant&#39;s years of experience in the current organization
    attr_accessor :employment_details_years_of_experience

    # Applicant&#39;s Current Designation
    attr_accessor :employment_details_designation

    # Vintage
    attr_accessor :employement_vintage_current_organisation

    # Last 3 Months Payslips
    attr_accessor :payslip_link

    # Last 3 Months Payslips
    attr_accessor :payslip_link_password

    # Last 3 Years TDS Certificate
    attr_accessor :tds_certificate_link

    # Last 3 Years TDS Certificate
    attr_accessor :tds_certificate_link_password

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'pan_number' => :'pan_number',
        :'pan_link' => :'pan_link',
        :'pan_link_password' => :'pan_link_password',
        :'form_60_link' => :'form_60_link',
        :'form_60_link_password' => :'form_60_link_password',
        :'aadhar_number' => :'aadhar_number',
        :'aadhar_number_link' => :'aadhar_number_link',
        :'aadhar_number_link_password' => :'aadhar_number_link_password',
        :'voter_id_number' => :'voter_id_number',
        :'voter_id_number_link' => :'voter_id_number_link',
        :'voter_id_number_link_password' => :'voter_id_number_link_password',
        :'driving_license_number' => :'driving_license_number',
        :'driving_license_number_link' => :'driving_license_number_link',
        :'driving_license_number_link_password' => :'driving_license_number_link_password',
        :'passport_number' => :'passport_number',
        :'passport_link' => :'passport_link',
        :'passport_link_password' => :'passport_link_password',
        :'video_image_link' => :'video_image_link',
        :'video_image_link_password' => :'video_image_link_password',
        :'video_kyc_detail' => :'video_kyc_detail',
        :'other_kyc_number' => :'other_kyc_number',
        :'other_kyc_number_link' => :'other_kyc_number_link',
        :'other_kyc_number_link_password' => :'other_kyc_number_link_password',
        :'rent_agreement_link' => :'rent_agreement_link',
        :'rent_agreement_link_password' => :'rent_agreement_link_password',
        :'utility_bills_link' => :'utility_bills_link',
        :'utility_bills_link_password' => :'utility_bills_link_password',
        :'photo_link' => :'photo_link',
        :'photo_link_password' => :'photo_link_password',
        :'employer_tier' => :'employer_tier',
        :'employment_type' => :'employment_type',
        :'employment_details_name' => :'employment_details_name',
        :'employment_details_address' => :'employment_details_address',
        :'employment_details_years_of_experience' => :'employment_details_years_of_experience',
        :'employment_details_designation' => :'employment_details_designation',
        :'employement_vintage_current_organisation' => :'employement_vintage_current_organisation',
        :'payslip_link' => :'payslip_link',
        :'payslip_link_password' => :'payslip_link_password',
        :'tds_certificate_link' => :'tds_certificate_link',
        :'tds_certificate_link_password' => :'tds_certificate_link_password'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'pan_number' => :'Object',
        :'pan_link' => :'Object',
        :'pan_link_password' => :'Object',
        :'form_60_link' => :'Object',
        :'form_60_link_password' => :'Object',
        :'aadhar_number' => :'Object',
        :'aadhar_number_link' => :'Object',
        :'aadhar_number_link_password' => :'Object',
        :'voter_id_number' => :'Object',
        :'voter_id_number_link' => :'Object',
        :'voter_id_number_link_password' => :'Object',
        :'driving_license_number' => :'Object',
        :'driving_license_number_link' => :'Object',
        :'driving_license_number_link_password' => :'Object',
        :'passport_number' => :'Object',
        :'passport_link' => :'Object',
        :'passport_link_password' => :'Object',
        :'video_image_link' => :'Object',
        :'video_image_link_password' => :'Object',
        :'video_kyc_detail' => :'Object',
        :'other_kyc_number' => :'Object',
        :'other_kyc_number_link' => :'Object',
        :'other_kyc_number_link_password' => :'Object',
        :'rent_agreement_link' => :'Object',
        :'rent_agreement_link_password' => :'Object',
        :'utility_bills_link' => :'Object',
        :'utility_bills_link_password' => :'Object',
        :'photo_link' => :'Object',
        :'photo_link_password' => :'Object',
        :'employer_tier' => :'Object',
        :'employment_type' => :'Object',
        :'employment_details_name' => :'Object',
        :'employment_details_address' => :'Object',
        :'employment_details_years_of_experience' => :'Object',
        :'employment_details_designation' => :'Object',
        :'employement_vintage_current_organisation' => :'Object',
        :'payslip_link' => :'Object',
        :'payslip_link_password' => :'Object',
        :'tds_certificate_link' => :'Object',
        :'tds_certificate_link_password' => :'Object'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `Colending::ResponseCreateTrancheLoanData` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Colending::ResponseCreateTrancheLoanData`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'pan_number')
        self.pan_number = attributes[:'pan_number']
      end

      if attributes.key?(:'pan_link')
        if (value = attributes[:'pan_link']).is_a?(Array)
          self.pan_link = value
        end
      end

      if attributes.key?(:'pan_link_password')
        self.pan_link_password = attributes[:'pan_link_password']
      end

      if attributes.key?(:'form_60_link')
        if (value = attributes[:'form_60_link']).is_a?(Array)
          self.form_60_link = value
        end
      end

      if attributes.key?(:'form_60_link_password')
        self.form_60_link_password = attributes[:'form_60_link_password']
      end

      if attributes.key?(:'aadhar_number')
        self.aadhar_number = attributes[:'aadhar_number']
      end

      if attributes.key?(:'aadhar_number_link')
        if (value = attributes[:'aadhar_number_link']).is_a?(Array)
          self.aadhar_number_link = value
        end
      end

      if attributes.key?(:'aadhar_number_link_password')
        self.aadhar_number_link_password = attributes[:'aadhar_number_link_password']
      end

      if attributes.key?(:'voter_id_number')
        self.voter_id_number = attributes[:'voter_id_number']
      end

      if attributes.key?(:'voter_id_number_link')
        if (value = attributes[:'voter_id_number_link']).is_a?(Array)
          self.voter_id_number_link = value
        end
      end

      if attributes.key?(:'voter_id_number_link_password')
        self.voter_id_number_link_password = attributes[:'voter_id_number_link_password']
      end

      if attributes.key?(:'driving_license_number')
        self.driving_license_number = attributes[:'driving_license_number']
      end

      if attributes.key?(:'driving_license_number_link')
        if (value = attributes[:'driving_license_number_link']).is_a?(Array)
          self.driving_license_number_link = value
        end
      end

      if attributes.key?(:'driving_license_number_link_password')
        self.driving_license_number_link_password = attributes[:'driving_license_number_link_password']
      end

      if attributes.key?(:'passport_number')
        self.passport_number = attributes[:'passport_number']
      end

      if attributes.key?(:'passport_link')
        if (value = attributes[:'passport_link']).is_a?(Array)
          self.passport_link = value
        end
      end

      if attributes.key?(:'passport_link_password')
        self.passport_link_password = attributes[:'passport_link_password']
      end

      if attributes.key?(:'video_image_link')
        if (value = attributes[:'video_image_link']).is_a?(Array)
          self.video_image_link = value
        end
      end

      if attributes.key?(:'video_image_link_password')
        self.video_image_link_password = attributes[:'video_image_link_password']
      end

      if attributes.key?(:'video_kyc_detail')
        self.video_kyc_detail = attributes[:'video_kyc_detail']
      end

      if attributes.key?(:'other_kyc_number')
        self.other_kyc_number = attributes[:'other_kyc_number']
      end

      if attributes.key?(:'other_kyc_number_link')
        if (value = attributes[:'other_kyc_number_link']).is_a?(Array)
          self.other_kyc_number_link = value
        end
      end

      if attributes.key?(:'other_kyc_number_link_password')
        self.other_kyc_number_link_password = attributes[:'other_kyc_number_link_password']
      end

      if attributes.key?(:'rent_agreement_link')
        if (value = attributes[:'rent_agreement_link']).is_a?(Array)
          self.rent_agreement_link = value
        end
      end

      if attributes.key?(:'rent_agreement_link_password')
        self.rent_agreement_link_password = attributes[:'rent_agreement_link_password']
      end

      if attributes.key?(:'utility_bills_link')
        if (value = attributes[:'utility_bills_link']).is_a?(Array)
          self.utility_bills_link = value
        end
      end

      if attributes.key?(:'utility_bills_link_password')
        self.utility_bills_link_password = attributes[:'utility_bills_link_password']
      end

      if attributes.key?(:'photo_link')
        if (value = attributes[:'photo_link']).is_a?(Array)
          self.photo_link = value
        end
      end

      if attributes.key?(:'photo_link_password')
        self.photo_link_password = attributes[:'photo_link_password']
      end

      if attributes.key?(:'employer_tier')
        self.employer_tier = attributes[:'employer_tier']
      end

      if attributes.key?(:'employment_type')
        self.employment_type = attributes[:'employment_type']
      end

      if attributes.key?(:'employment_details_name')
        self.employment_details_name = attributes[:'employment_details_name']
      end

      if attributes.key?(:'employment_details_address')
        self.employment_details_address = attributes[:'employment_details_address']
      end

      if attributes.key?(:'employment_details_years_of_experience')
        self.employment_details_years_of_experience = attributes[:'employment_details_years_of_experience']
      end

      if attributes.key?(:'employment_details_designation')
        self.employment_details_designation = attributes[:'employment_details_designation']
      end

      if attributes.key?(:'employement_vintage_current_organisation')
        self.employement_vintage_current_organisation = attributes[:'employement_vintage_current_organisation']
      end

      if attributes.key?(:'payslip_link')
        if (value = attributes[:'payslip_link']).is_a?(Array)
          self.payslip_link = value
        end
      end

      if attributes.key?(:'payslip_link_password')
        self.payslip_link_password = attributes[:'payslip_link_password']
      end

      if attributes.key?(:'tds_certificate_link')
        if (value = attributes[:'tds_certificate_link']).is_a?(Array)
          self.tds_certificate_link = value
        end
      end

      if attributes.key?(:'tds_certificate_link_password')
        self.tds_certificate_link_password = attributes[:'tds_certificate_link_password']
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
          pan_number == o.pan_number &&
          pan_link == o.pan_link &&
          pan_link_password == o.pan_link_password &&
          form_60_link == o.form_60_link &&
          form_60_link_password == o.form_60_link_password &&
          aadhar_number == o.aadhar_number &&
          aadhar_number_link == o.aadhar_number_link &&
          aadhar_number_link_password == o.aadhar_number_link_password &&
          voter_id_number == o.voter_id_number &&
          voter_id_number_link == o.voter_id_number_link &&
          voter_id_number_link_password == o.voter_id_number_link_password &&
          driving_license_number == o.driving_license_number &&
          driving_license_number_link == o.driving_license_number_link &&
          driving_license_number_link_password == o.driving_license_number_link_password &&
          passport_number == o.passport_number &&
          passport_link == o.passport_link &&
          passport_link_password == o.passport_link_password &&
          video_image_link == o.video_image_link &&
          video_image_link_password == o.video_image_link_password &&
          video_kyc_detail == o.video_kyc_detail &&
          other_kyc_number == o.other_kyc_number &&
          other_kyc_number_link == o.other_kyc_number_link &&
          other_kyc_number_link_password == o.other_kyc_number_link_password &&
          rent_agreement_link == o.rent_agreement_link &&
          rent_agreement_link_password == o.rent_agreement_link_password &&
          utility_bills_link == o.utility_bills_link &&
          utility_bills_link_password == o.utility_bills_link_password &&
          photo_link == o.photo_link &&
          photo_link_password == o.photo_link_password &&
          employer_tier == o.employer_tier &&
          employment_type == o.employment_type &&
          employment_details_name == o.employment_details_name &&
          employment_details_address == o.employment_details_address &&
          employment_details_years_of_experience == o.employment_details_years_of_experience &&
          employment_details_designation == o.employment_details_designation &&
          employement_vintage_current_organisation == o.employement_vintage_current_organisation &&
          payslip_link == o.payslip_link &&
          payslip_link_password == o.payslip_link_password &&
          tds_certificate_link == o.tds_certificate_link &&
          tds_certificate_link_password == o.tds_certificate_link_password
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [pan_number, pan_link, pan_link_password, form_60_link, form_60_link_password, aadhar_number, aadhar_number_link, aadhar_number_link_password, voter_id_number, voter_id_number_link, voter_id_number_link_password, driving_license_number, driving_license_number_link, driving_license_number_link_password, passport_number, passport_link, passport_link_password, video_image_link, video_image_link_password, video_kyc_detail, other_kyc_number, other_kyc_number_link, other_kyc_number_link_password, rent_agreement_link, rent_agreement_link_password, utility_bills_link, utility_bills_link_password, photo_link, photo_link_password, employer_tier, employment_type, employment_details_name, employment_details_address, employment_details_years_of_experience, employment_details_designation, employement_vintage_current_organisation, payslip_link, payslip_link_password, tds_certificate_link, tds_certificate_link_password].hash
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