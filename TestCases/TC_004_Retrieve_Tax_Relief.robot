*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Library     String
Library     BuiltIn
Library     OperatingSystem
Library     Calculation.py  WITH NAME   cal

*** Variables ***
${base_url}   http://localhost:8080/

*** Test Cases ***
TC_004 Retrieve Tax Relief Record
    [Tags]  smoke

    #AC1: GET endpoint returns list of natid, tax relief amount and name
    Create Session      Get Tax Relief Details  ${base_url}
    ${response}=        GET On Session      Get Tax Relief Details  calculator/taxRelief
    Request Should Be Successful    ${response}
    ${json_data}=       Set Variable  ${response.json()}

    # check for natid
    @{natid_[0]}=       Get Value From Json     ${json_data}     $.[0].natid
    Log To Console      natid ${natid_[0]}
    Should Not Be Empty     ${natid_[0]}

    # check for tax relief amount
    @{relief_[0]}=      Get Value From Json     ${json_data}     $.[0].relief
    Log To Console      relief ${relief_[0]}
    Should Not Be Empty     ${relief_[0]}

    # check for name
    @{name_[0]}=        Get Value From Json     ${json_data}     $.[0].name
    Log To Console      name ${name_[0]}
    Should Not Be Empty     ${name_[0]}

    # Verify that tax paid is not in the list
    @{tax_[0]}=         Get Value From Json     ${json_data}     $.[0].tax
    Log To Console      tax ${tax_[0]}
    Should Be Empty     ${tax_[0]}

    #AC2: Verify that natid field is masked from the 5th character onwards with dollar sign ‘$’
    ${natid_field}=     Convert JSON To String  ${natid_[0]}

    ${natid_object}=    Get Substring   ${natid_field}    2    -2
    Log To Console      natid_object ${natid_object}
    Should Match Regexp     ${natid_object}     \\d\\d\\d-\|\\d\\W
    ${natid_string}=    Get Substring   ${natid_object}    4
    Log To Console      natid_string ${natid_string}

    #${masking}=     Should Match Regexp     ${natid_string}     \$\*
    #Log To Console      masking ${masking}

    Should Start With   ${natid_string}  $
    Should End With     ${natid_string}  $

    #AC3: Verify Tax Relief Computation

    #read csv file
    ${file}=    Get File    C:/Users/10059758/PycharmProjects/OPPENHEIMER/TestData/WorkingClassHeroData.csv    encoding=UTF-8
    @{list}=    Split To Lines  ${file}
    Log To Console  read_csv ${list}
    FOR    ${row}  IN  @{list}
       Log To Console   row ${row}
       ${info}=     Convert To String   ${row}
       ${replace}=  Split To Lines  ${info}
       Log To Console   replace ${replace}
    END



