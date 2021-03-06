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
  # Refer table FinancialData for attributes
  class BodyCreateLoanFinancialData
    # Annual Business Turnover (in Rupees)
    attr_accessor :annual_business_turnover

    # Annual Gross Profit (in Rupees)
    attr_accessor :annual_gross_profit

    # Annual Business EBITDA (in Rupees)
    attr_accessor :annual_business_ebitda

    # Monthly Net Profit (in Rupees)
    attr_accessor :monthly_net_profit

    # Annual Net Income
    attr_accessor :annual_net_income

    # Net Profit After Tax (in Rupees)
    attr_accessor :annual_net_profit

    # GST Annual Turnover
    attr_accessor :gst_annual_turnover

    # GST return image for last year
    attr_accessor :gst_return_year_1_link

    # GST return image password for last year
    attr_accessor :gst_return_year_1_link_password

    # GST return image for last year -1
    attr_accessor :gst_return_year_2_link

    # GST return image password for last year -1
    attr_accessor :gst_return_year_2_link_password

    # GST return image for last year -2
    attr_accessor :gst_return_year_3_link

    # GST return image password for last year -2
    attr_accessor :gst_return_year_3_link_password

    # IT return image for last year
    attr_accessor :it_return_year_1_link

    # IT return image password for last year
    attr_accessor :it_return_year_1_link_password

    # IT return image for last year -1
    attr_accessor :it_return_year_2_link

    # IT return image for last year -1
    attr_accessor :it_return_year_2_link_password

    # IT return image for last year - 2
    attr_accessor :it_return_year_3_link

    # IT return image for last year - 2
    attr_accessor :it_return_year_3_link_password

    # Image of other bills
    attr_accessor :other_income_assesment_proof_link

    # Image password of other bills
    attr_accessor :other_income_assesment_proof_link_password

    # CAM Document
    attr_accessor :cam_link

    # CAM Document Password
    attr_accessor :cam_link_password

    # CFA Document
    attr_accessor :cfa_link

    # CFA Document Password
    attr_accessor :cfa_link_password

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'annual_business_turnover' => :'annual_business_turnover',
        :'annual_gross_profit' => :'annual_gross_profit',
        :'annual_business_ebitda' => :'annual_business_ebitda',
        :'monthly_net_profit' => :'monthly_net_profit',
        :'annual_net_income' => :'annual_net_income',
        :'annual_net_profit' => :'annual_net_profit',
        :'gst_annual_turnover' => :'gst_annual_turnover',
        :'gst_return_year_1_link' => :'gst_return_year_1_link',
        :'gst_return_year_1_link_password' => :'gst_return_year_1_link_password',
        :'gst_return_year_2_link' => :'gst_return_year_2_link',
        :'gst_return_year_2_link_password' => :'gst_return_year_2_link_password',
        :'gst_return_year_3_link' => :'gst_return_year_3_link',
        :'gst_return_year_3_link_password' => :'gst_return_year_3_link_password',
        :'it_return_year_1_link' => :'it_return_year_1_link',
        :'it_return_year_1_link_password' => :'it_return_year_1_link_password',
        :'it_return_year_2_link' => :'it_return_year_2_link',
        :'it_return_year_2_link_password' => :'it_return_year_2_link_password',
        :'it_return_year_3_link' => :'it_return_year_3_link',
        :'it_return_year_3_link_password' => :'it_return_year_3_link_password',
        :'other_income_assesment_proof_link' => :'other_income_assesment_proof_link',
        :'other_income_assesment_proof_link_password' => :'other_income_assesment_proof_link_password',
        :'cam_link' => :'cam_link',
        :'cam_link_password' => :'cam_link_password',
        :'cfa_link' => :'cfa_link',
        :'cfa_link_password' => :'cfa_link_password'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'annual_business_turnover' => :'Object',
        :'annual_gross_profit' => :'Object',
        :'annual_business_ebitda' => :'Object',
        :'monthly_net_profit' => :'Object',
        :'annual_net_income' => :'Object',
        :'annual_net_profit' => :'Object',
        :'gst_annual_turnover' => :'Object',
        :'gst_return_year_1_link' => :'Object',
        :'gst_return_year_1_link_password' => :'Object',
        :'gst_return_year_2_link' => :'Object',
        :'gst_return_year_2_link_password' => :'Object',
        :'gst_return_year_3_link' => :'Object',
        :'gst_return_year_3_link_password' => :'Object',
        :'it_return_year_1_link' => :'Object',
        :'it_return_year_1_link_password' => :'Object',
        :'it_return_year_2_link' => :'Object',
        :'it_return_year_2_link_password' => :'Object',
        :'it_return_year_3_link' => :'Object',
        :'it_return_year_3_link_password' => :'Object',
        :'other_income_assesment_proof_link' => :'Object',
        :'other_income_assesment_proof_link_password' => :'Object',
        :'cam_link' => :'Object',
        :'cam_link_password' => :'Object',
        :'cfa_link' => :'Object',
        :'cfa_link_password' => :'Object'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `Colending::BodyCreateLoanFinancialData` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Colending::BodyCreateLoanFinancialData`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'annual_business_turnover')
        self.annual_business_turnover = attributes[:'annual_business_turnover']
      end

      if attributes.key?(:'annual_gross_profit')
        self.annual_gross_profit = attributes[:'annual_gross_profit']
      end

      if attributes.key?(:'annual_business_ebitda')
        self.annual_business_ebitda = attributes[:'annual_business_ebitda']
      end

      if attributes.key?(:'monthly_net_profit')
        self.monthly_net_profit = attributes[:'monthly_net_profit']
      end

      if attributes.key?(:'annual_net_income')
        self.annual_net_income = attributes[:'annual_net_income']
      end

      if attributes.key?(:'annual_net_profit')
        self.annual_net_profit = attributes[:'annual_net_profit']
      end

      if attributes.key?(:'gst_annual_turnover')
        self.gst_annual_turnover = attributes[:'gst_annual_turnover']
      end

      if attributes.key?(:'gst_return_year_1_link')
        if (value = attributes[:'gst_return_year_1_link']).is_a?(Array)
          self.gst_return_year_1_link = value
        end
      end

      if attributes.key?(:'gst_return_year_1_link_password')
        self.gst_return_year_1_link_password = attributes[:'gst_return_year_1_link_password']
      end

      if attributes.key?(:'gst_return_year_2_link')
        if (value = attributes[:'gst_return_year_2_link']).is_a?(Array)
          self.gst_return_year_2_link = value
        end
      end

      if attributes.key?(:'gst_return_year_2_link_password')
        self.gst_return_year_2_link_password = attributes[:'gst_return_year_2_link_password']
      end

      if attributes.key?(:'gst_return_year_3_link')
        if (value = attributes[:'gst_return_year_3_link']).is_a?(Array)
          self.gst_return_year_3_link = value
        end
      end

      if attributes.key?(:'gst_return_year_3_link_password')
        self.gst_return_year_3_link_password = attributes[:'gst_return_year_3_link_password']
      end

      if attributes.key?(:'it_return_year_1_link')
        if (value = attributes[:'it_return_year_1_link']).is_a?(Array)
          self.it_return_year_1_link = value
        end
      end

      if attributes.key?(:'it_return_year_1_link_password')
        self.it_return_year_1_link_password = attributes[:'it_return_year_1_link_password']
      end

      if attributes.key?(:'it_return_year_2_link')
        if (value = attributes[:'it_return_year_2_link']).is_a?(Array)
          self.it_return_year_2_link = value
        end
      end

      if attributes.key?(:'it_return_year_2_link_password')
        self.it_return_year_2_link_password = attributes[:'it_return_year_2_link_password']
      end

      if attributes.key?(:'it_return_year_3_link')
        if (value = attributes[:'it_return_year_3_link']).is_a?(Array)
          self.it_return_year_3_link = value
        end
      end

      if attributes.key?(:'it_return_year_3_link_password')
        self.it_return_year_3_link_password = attributes[:'it_return_year_3_link_password']
      end

      if attributes.key?(:'other_income_assesment_proof_link')
        if (value = attributes[:'other_income_assesment_proof_link']).is_a?(Array)
          self.other_income_assesment_proof_link = value
        end
      end

      if attributes.key?(:'other_income_assesment_proof_link_password')
        self.other_income_assesment_proof_link_password = attributes[:'other_income_assesment_proof_link_password']
      end

      if attributes.key?(:'cam_link')
        if (value = attributes[:'cam_link']).is_a?(Array)
          self.cam_link = value
        end
      end

      if attributes.key?(:'cam_link_password')
        self.cam_link_password = attributes[:'cam_link_password']
      end

      if attributes.key?(:'cfa_link')
        if (value = attributes[:'cfa_link']).is_a?(Array)
          self.cfa_link = value
        end
      end

      if attributes.key?(:'cfa_link_password')
        self.cfa_link_password = attributes[:'cfa_link_password']
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
          annual_business_turnover == o.annual_business_turnover &&
          annual_gross_profit == o.annual_gross_profit &&
          annual_business_ebitda == o.annual_business_ebitda &&
          monthly_net_profit == o.monthly_net_profit &&
          annual_net_income == o.annual_net_income &&
          annual_net_profit == o.annual_net_profit &&
          gst_annual_turnover == o.gst_annual_turnover &&
          gst_return_year_1_link == o.gst_return_year_1_link &&
          gst_return_year_1_link_password == o.gst_return_year_1_link_password &&
          gst_return_year_2_link == o.gst_return_year_2_link &&
          gst_return_year_2_link_password == o.gst_return_year_2_link_password &&
          gst_return_year_3_link == o.gst_return_year_3_link &&
          gst_return_year_3_link_password == o.gst_return_year_3_link_password &&
          it_return_year_1_link == o.it_return_year_1_link &&
          it_return_year_1_link_password == o.it_return_year_1_link_password &&
          it_return_year_2_link == o.it_return_year_2_link &&
          it_return_year_2_link_password == o.it_return_year_2_link_password &&
          it_return_year_3_link == o.it_return_year_3_link &&
          it_return_year_3_link_password == o.it_return_year_3_link_password &&
          other_income_assesment_proof_link == o.other_income_assesment_proof_link &&
          other_income_assesment_proof_link_password == o.other_income_assesment_proof_link_password &&
          cam_link == o.cam_link &&
          cam_link_password == o.cam_link_password &&
          cfa_link == o.cfa_link &&
          cfa_link_password == o.cfa_link_password
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [annual_business_turnover, annual_gross_profit, annual_business_ebitda, monthly_net_profit, annual_net_income, annual_net_profit, gst_annual_turnover, gst_return_year_1_link, gst_return_year_1_link_password, gst_return_year_2_link, gst_return_year_2_link_password, gst_return_year_3_link, gst_return_year_3_link_password, it_return_year_1_link, it_return_year_1_link_password, it_return_year_2_link, it_return_year_2_link_password, it_return_year_3_link, it_return_year_3_link_password, other_income_assesment_proof_link, other_income_assesment_proof_link_password, cam_link, cam_link_password, cfa_link, cfa_link_password].hash
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
