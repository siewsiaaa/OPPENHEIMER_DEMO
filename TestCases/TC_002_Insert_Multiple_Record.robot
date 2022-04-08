*** Settings ***
Library           SeleniumLibrary
Library           RequestsLibrary
Library           JSONLibrary
Library           Collections

*** Variables ***
${base_url}     http://localhost:8080/

*** Test Cases ***
TC_002 Insert Multiple Records
    [Tags]  api

    Create Session      AddData     ${base_url}
    ${wch1}=            Create Dictionary   birthday=24021954   gender=F    name=Mary Chia   natid=9876543210    salary=8400   tax=470
    ${wch2}=            Create Dictionary   birthday=15071961   gender=M    name=Peter Liu   natid=5548613284    salary=45000   tax=840
    ${data_list}=       Convert string to JSON  [{"birthday": "19111968","gender": "M","name": "Albert Khoo","natid": "98743173214","salary": "64980","tax": "206" },{"birthday": "28041982","gender": "F","name": "Winnie Wang","natid": "23435SA458436","salary": "84606","tax": "716"}]
    ${body}             Evaluate    json.dumps(${data_list})  json
    ${header}=          Create Dictionary   Content-Type=application/json    accept=*/*
    ${response}=        Post On Session     AddData     /calculator/insertMultiple    data=${body}    headers=${header}

    #Verify Response Code 202
    Request Should Be Successful    ${response}
    #${actual_code}=         convert to string   ${response.status_code}
    #should be equal         ${actual_code}      202         #undocumented server response
    #${actual_content}=      convert to string   ${response.content}
    #should be equal         ${actual_content}   Alright     #undocumented
