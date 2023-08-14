*** Settings ***
Resource    ../Resouce/Servrest.resouce.robot

*** Test Cases ***
Criando o email do usuário    
    Quando o email do usuário é criado
    E então o usuário é criado na Servrest
    
