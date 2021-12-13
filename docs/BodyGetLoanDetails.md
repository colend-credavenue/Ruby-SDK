# Colending::BodyGetLoanDetails

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**business** | [**BodyCreateLoanBusiness**](BodyCreateLoanBusiness.md) |  | [optional] 
**guarantors** | [**Array&lt;BodyCreateLoanGuarantors&gt;**](BodyCreateLoanGuarantors.md) | Refer table Guarantors for attributes | [optional] 
**co_applicants** | [**Array&lt;BodyCreateLoanCoApplicants&gt;**](BodyCreateLoanCoApplicants.md) | Refer table CoApplicants for attributes | [optional] 
**bank_statement** | [**BodyCreateLoanBankStatement**](BodyCreateLoanBankStatement.md) |  | [optional] 
**financial_data** | [**BodyCreateLoanFinancialData**](BodyCreateLoanFinancialData.md) |  | [optional] 
**product_id** | **String** | Product ID created in CA | [optional] 
**client_loan_id** | **String** | Loan ID as per Partner&amp;#39;s LMS | [optional] 
**purpose** | **String** | Free flowing text | [optional] 
**principal_amount** | **Float** | Total loan amount in Rs (Overall amount to the borrower) | [optional] 
**interest_rate** | **Float** | Reducing balance interest rate of the customer in %. This is the interest rate to be mentioned in the sanction letter as well | [optional] 
**tenure** | **Integer** | Tenure of the loan | [optional] 
**tenure_frequency** | **String** | Whether the tenure is monthly/yearly/weekly | [optional] 
**repayment_frequency** | **String** | Daily/Weekly/Once in 2 weeks/Monthly/Quarterly/Bullet | [optional] 
**number_of_repayments** | **Integer** | Number of repayments as per the repayment schedule | [optional] 
**disbursement_accounts** | [**Array&lt;BodyCreateLoanDisbursementAccounts&gt;**](BodyCreateLoanDisbursementAccounts.md) | Refer table DisbursementAccounts for attributes | [optional] 
**assets** | [**Array&lt;BodyCreateLoanAssets&gt;**](BodyCreateLoanAssets.md) | Refer table Assets for attributes | [optional] 
**references** | [**Array&lt;BodyCreateLoanReferences&gt;**](BodyCreateLoanReferences.md) | Refer table References for attributes | [optional] 
**insurance_details** | [**Array&lt;BodyCreateLoanInsuranceDetails&gt;**](BodyCreateLoanInsuranceDetails.md) | Refer table InsuranceDetails for attributes | [optional] 
**tranches** | [**Array&lt;BodyCreateLoanTranches&gt;**](BodyCreateLoanTranches.md) | Refer table Tranches for attributes | [optional] 

