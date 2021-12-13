# Colending::BodyCreateTranche

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**tranche_number** | **Integer** | Tranche Number | [optional] 
**principal_amount** | **Integer** | Principal amount to be disbursed in the tranche | [optional] 
**differential_interest** | **Integer** | Broken period interest amount | [optional] 
**interest_start_date** | **Date** | Pre Emi interest due date | [optional] 
**processing_fee** | **Integer** | Processing fee amount (Inckusive of GST) | [optional] 
**stamp_duty** | **Integer** | Stamp duty amount | [optional] 
**insurance_charges** | **Integer** | Insurance premium inclusive of GST | [optional] 
**documentation_charges** | **Integer** | Total documentation charges inclusive of GST | [optional] 
**other_charges** | **Integer** | Any other charges inclusive of GST | [optional] 
**closing_loan_principal** | **Integer** | Balance principal amount after this tranche | [optional] 
**tranche_doc_link** | **String** | Link to the corresponding document | [optional] 
**tranche_doc_link_password** | **String** | Link to the corresponding document | [optional] 
**disbursement_accounts** | [**Array&lt;ResponseCreateTrancheDisbursementAccounts&gt;**](ResponseCreateTrancheDisbursementAccounts.md) | Refer table DisbursementAccounts for attributes | [optional] 
**loan_data** | [**Array&lt;ResponseCreateTrancheLoanData&gt;**](ResponseCreateTrancheLoanData.md) | Refer table LoanData for attributes | [optional] 
**bureau_report_data** | [**ResponseCreateTrancheBureauReportData**](ResponseCreateTrancheBureauReportData.md) |  | [optional] 
**client_loan_id** | **String** | Loan ID as per Partner&amp;#39;s LMS | [optional] 
**business_data** | [**ResponseCreateTrancheBusinessData**](ResponseCreateTrancheBusinessData.md) |  | [optional] 

