*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     String

*** Keywords ***
Quando o email do usuário é criado
    ${email}    Generate Random String    length=4    chars=letters
    ${email}    Convert To Lower Case    ${email}
    Set Test Variable    ${EMAIL}    ${email}@teste.com.br
    Log    ${EMAIL}

E então o usuário é criado na Servrest
    ${body}    Create Dictionary    
    ...    nome=Fulano de Tal     
    ...    email=${EMAIL}     
    ...    password=1243     
    ...    administrador=true
    Log    ${body}
    Criar usuário na Servrest
    ${resposta}    POST On Session    alias=Servrest    url=/usuarios    json=${body}
    Log    ${resposta.json()}

Momento em que crio seção na Servrest
    ${headers}    Create Dictionary    accept=application/json    Content-Type=application/json
    Create Session    Servrest    https://serverest.dev    ${headers}
