*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${URL}                      https://konia.com.br/
${MENU_QUEM_SOMOS}          (//a[@href='https://konia.com.br/quem-somos/'][contains(.,'Quem Somos')])[1]
${TITLE_QUEM_SOMOS}         Quem Somos - Konia Consultoria e Informática
${MENU_BLOG}                menu-item-218
${BOTAO_PESQUISA}           //button[@type='submit'][contains(.,'Pesquisar')]
${CAMPO_PESQUISA_BLOG}      wp-block-search__input-1
${VALIDACAO_ARTIGO}         //a[contains(.,'O que é o JMeter?')]


*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Dado que o usuário esteja na página home page da Konia.com.br
    Go To    url=${URL}

Quando ele clicar no menu "Quem Somos"
    Click Element    locator=${MENU_QUEM_SOMOS}

Então o título da página deverá ser "Quem Somos - Konia Consultoria e informática"
    Wait Until Page Contains    text=${TITLE_QUEM_SOMOS}

Quando ele clicar no menu "Blog"
    Click Element    locator=${MENU_BLOG}

E pesquisar por "${PESQUISA}" no campo de busca
    Input Text    locator=${CAMPO_PESQUISA_BLOG}    text=${PESQUISA}
    Click Element    locator=${BOTAO_PESQUISA}

Então deverá ser exibido na tela artigos referente ao tema buscado
    Wait Until Page Contains Element    locator=${VALIDACAO_ARTIGO}
