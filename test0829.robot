# -*- coding: utf-8 -*-
*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${首頁}  https://www.tigerairtw.com/zh-tw/
${下次再說}  //div[@class="insider-opt-in-notification-button insider-opt-in-disallow-button"][contains(.,"下次再說")]
# ${下次再說}  //div[@class="insider-opt-in-notification-inner-container"]//div[contains(.,"下次再說")]
${出發}  //*[@id="select2-selectOrigin-container"]/span
${抵達}  //*[@id="select2-selectDestination-container"]/span
# ${地點輸入框}  //span[@class="select2-container select2-container--default select2-container--open"]//input
# ${地點輸入框}  //span[@class="select2-dropdown select2-dropdown--below"]//input
${地點輸入框}  //span[@class="select2-search select2-search--dropdown"]/input
${出發日}  //*[@id="searchform"]//span[contains(text(),'出發日')]/../..  # 目標是div

*** Test Cases ***
# Test
#     [Tags]  amber
#     Keyword ABC  apple
#     Keyword ABC  lemon  green

機票購買
    Open Browser  ${首頁}  chrome
    點擊  ${下次再說}
    點擊  ${出發}
    輸入  ${地點輸入框}  TPE
    點擊  ${抵達}
    輸入  ${地點輸入框}  KIX
    點擊  ${出發日}
    選月曆日期  14
    選月曆日期  20
    Close Browser

*** Keywords ***
Keyword ABC
    [Arguments]  ${fruit}  ${color}=122
    Log To Console  ${fruit} is ${color}

輸入
    [Arguments]  ${xpath}  ${string}
    # Wait Until Page Contains Element  ${xpath}  10
    Wait Until Element Is Visible  ${xpath}  10
    Input Text  ${xpath}  ${string}
    Press Key   ${xpath}  \\13

點擊
    [Arguments]  ${xpath}
    # Wait Until Page Contains Element  ${xpath}  10  # 下次再說會GG
    Wait Until Element Is Visible  ${xpath}  10
    Click Element  ${xpath}

選月曆日期
    [Arguments]  ${day}
    點擊  //*[@id="ui-datepicker-div"]//a[text()='${day}']
    #    //*[@id="ui-datepicker-div"]//a[text()='31']  # 使用文字定位
    Sleep  0.3
