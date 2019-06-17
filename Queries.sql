COLUMN PersonalDetails.first_last_name.firstname          HEADING 'FIRST | NAME'
COLUMN PersonalDetails.first_last_name.surname    HEADING 'LAST | NAME'
SELECT e.PersonalDetails.first_last_name.firstname, e.PersonalDetails.first_last_name.surname
FROM EMPLOYEE e
WHERE e.PersonalDetails.first_last_name.firstname LIKE '%on%' AND e.Address.Address_Street_City.city = 'Glasgow'  ;

COLUMN COUNT(A.ACCID)          HEADING 'Num Savings Accs'
COLUMN COUNT(A.ACCID) FORMAT A17
COLUMN BRANCHID.BID          HEADING 'BranchID'
COLUMN BRANCHID.BID FORMAT A10
COLUMN BRANCHID.bAddress.Address_Street_City.street          HEADING 'Branch Street'
COLUMN BRANCHID.bAddress.Address_Street_City.city          HEADING 'Branch City'
COLUMN BRANCHID.bAddress.postal_code          HEADING 'Branch Post Code'
SELECT count(a.ACCID), a.BRANCHID.bID, a.BRANCHID.bAddress.Address_Street_City.street, a.BRANCHID.bAddress.Address_Street_City.city, a.BRANCHID.bAddress.postal_code
FROM ACCOUNT a
WHERE a.ACCTYPE = 'savings' group by a.BRANCHID.bID, a.BRANCHID.bAddress.Address_Street_City.street, a.BRANCHID.bAddress.Address_Street_City.city, a.BRANCHID.bAddress.postal_code;

COLUMN ACCOUNTID.branchID.bID          HEADING 'Branch ID'
COLUMN ACCOUNTID.branchID.bID  FORMAT A6
COLUMN CUSTID.PersonalDetails.first_last_name.firstname          HEADING 'First Name'
COLUMN CUSTID.PersonalDetails.first_last_name.firstname          HEADING 'First Name'
COLUMN CUSTID.PersonalDetails.first_last_name.surname          HEADING 'Last Name'
COLUMN max(a.ACCOUNTID.balance)          HEADING 'Balance'
COLUMN max(a.ACCOUNTID.balance) FORMAT A10
COLUMN ACCOUNTID.limitOfFreeOD HEADING 'OverDraft size'
COLUMN ACCOUNTID.limitOfFreeOD FORMAT A15
SELECT a.ACCOUNTID.branchID.bID, a.CUSTID.PersonalDetails.first_last_name.firstname,a.CUSTID.PersonalDetails.first_last_name.surname, max(a.ACCOUNTID.balance), a.ACCOUNTID.limitOfFreeOD
FROM CUSTOMERACCOUNT a 
WHERE a.ACCOUNTID.accType = 'savings'
group by a.ACCOUNTID.branchID.bID, a.CUSTID.PersonalDetails.first_last_name.firstname, a.CUSTID.PersonalDetails.first_last_name.surname, a.ACCOUNTID.limitOfFreeOD;