*Settings*
Documentation    Suite de Teste do cadastro de personagens na API da Marvel

Resource    ${EXECDIR}/resources/Base.robot
Library     ${EXECDIR}/resources/factories/Guardians.py
Library     ${EXECDIR}/resources/factories/Deadpool.py

Suite Setup    Super Setup  sgabrielcardosoc@gmail.com


*Test Cases*
Deve cadastrar um Personagem

    ${personagem}    Factory Star Lord
    ${response}      POST New Character    ${personagem}

    Status Should Be    200    ${response}

Não deve cadastrar com o mesmo nome
    [Tags]    dup

    ${personagem}         Factory Groot 
    POST New Character    ${personagem}


    ${response}    POST New Character    ${personagem}

    Status Should be    409                          ${response}
    Should Be Equal     ${response.json()}[error]    Character already exists :(