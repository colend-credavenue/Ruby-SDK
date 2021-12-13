# Colending::BodyUpdateLoan

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**principal_amount** | **Float** | Total Loan Amount to the Borrower (in Rupees) | [optional] 
**loan_amount** | **Float** | Total Loan Amount | [optional] 
**interest_rate** | **Float** | Reducing balance interest rate of the customer in %. This is the interest rate to be mentioned in the sanction letter as well | [optional] 
**tenure** | **Integer** | Tenure of the loan | [optional] 
**tenure_frequency** | **String** | Daily / Weekly / Monthly | [optional] 
**repayment_frequency** | **String** | Daily / Weekly / Monthly / Bullet | [optional] 
**number_of_repayments** | **Integer** | Number of repayments as per the repayment schedule | [optional] 
**disbursement_accounts** | [**Array&lt;BodyUpdateLoanDisbursementAccounts&gt;**](BodyUpdateLoanDisbursementAccounts.md) | Refer table DisbursementAccounts for attributes | [optional] 

