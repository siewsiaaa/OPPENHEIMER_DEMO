*** Settings ***
Library     Collections
Library     OperatingSystem
Library     String
Library     BuiltIn

Resource  ../Resources/Common.robot

*** Variables ***
${csv_path}     C://Users/10059758/PycharmProjects/OPPENHEIMER/TestData/WorkingClassHeroData.csv

*** Test Cases ***
TC_003 Populate List from CSV file
    [Tags]  DEBUG

    #AC1: Verify Header of CSV file
    ${csv}                  Get File        ../TestData/WorkingClassHeroData.csv
    ${expected_csv_header}  Create List     natid,name,gender,salary,birthday,tax

    @{read}             Create List     ${csv}
    @{header}           Split To Lines  @{read}     0   1
    Log To Console      Header ${header}
    Log To Console      Expected CSV Header ${expected_csv_header}
    Should Be True      ${header}==${expected_csv_header}

    #AC2: Verify CSV Content
    @{read_content}         Create List     ${csv}
    @{content}              Split To Lines  @{read}     1
    Log To Console          Content ${content}
    Should Not Be Empty     ${content}      CSV content is not empty

    Start Browser

    #AC3: Verify Upload CSV File
    @{upload_file}=         Choose File     xpath://input[@type='file']  ${csv_path}
    Should Not Be Empty     ${upload_file}  Upload CSV failed
    Sleep   3

    Close Browser