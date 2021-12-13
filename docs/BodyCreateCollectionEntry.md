# Colending::BodyCreateCollectionEntry

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**installment_no** | **Integer** | Installment Number | [optional] 
**due_date** | **Date** | Due Date for the Installment (YYYY-MM-DD) | [optional] 
**principal** | **Float** | Total principal amount paid for this installment | [optional] 
**interest** | **Float** | Total interest amount paid for this installement | [optional] 
**other_charges** | **Float** | Other Charges | [optional] 
**overdue_charges** | **Float** | Total overdue interest paid | [optional] 
**penalty_charges** | **Float** | Penalty Charges Paid | [optional] 
**fee_charges** | **Float** | Fee Charges Paid | [optional] 
**bounce_charges** | **Float** | Bounce charges paid | [optional] 
**amount** | **Float** | Total Collection Amount | [optional] 
**paid_date** | **Date** | Date when customer paid the amount (YYYY-MM-DD) | [optional] 
**investor_transfer_date** | **Date** | Date when originator transferred the amount to investor (YYYY-MM-DD) | [optional] 
**reference_no** | **String** | Instrument Number of the collection received | [optional] 
**instrument_type** | **String** | Instrument Type of the collection received | [optional] 
**emi_closed** | **String** | Y / N. Input Y if the installment is closed. | [optional] 
**foreclosure** | **String** | Y / N. Input Y if the loan is foreclosed. | [optional] 
**payment_type** | **String** | Normal / Part / Advance | [optional] 
**pos** | **Float** | Before the collection record to mention pos for that loan | [optional] 
**updated_rs** | [**Array&lt;BodyCreateCollectionEntryUpdatedRs&gt;**](BodyCreateCollectionEntryUpdatedRs.md) | Refer table UpdatedRs for attributes | [optional] 

