*** Settings ***
Library         RequestsLibrary
Library         JSONLibrary
Library         Collections

*** Variables ***
${base_url}   http://localhost:8080/

*** Test Cases ***
TC_001 Insert A Record
    [Tags]  smoke

    Create Session          AddData    ${base_url}
    &{body}=                create dictionary   birthday=01011980   gender=M    name=John   natid=0123456789    salary=140000   tax=123

    Dictionary Should Contain Key   ${body}     name
    Dictionary Should Contain Key   ${body}     natid
    Dictionary Should Contain Key   ${body}     birthday
    Dictionary Should Contain Key   ${body}     gender
    Dictionary Should Contain Key   ${body}     salary
    Dictionary Should Contain Key   ${body}     tax

    ${body}                 Evaluate  json.dumps(${body})  json
    ${header}=              Create Dictionary    Content-Type=application/json    accept=*/*
    ${response}=            Post On Session    AddData    calculator/insert    data=${body}    headers=${header}
    ${actual_code}=         convert to string   ${response.status_code}
    #log to console         ${actual_code}
    should be equal         ${actual_code}  202     #undocumented server response
    ${actual_content}=      convert to string   ${response.content}
    should be equal         ${actual_content}  Alright  #undocumented
    #log to console         ${response.content}
