# -*- coding: utf-8 -*-
*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${首頁}  https://www.tigerairtw.com/zh-tw/
${出發日}  //*[@id="searchform"]//span[contains(text(),'出發日')]/../..  # 目標是div

*** Test Cases ***
Case Name
    Open Browser  ${首頁}  chrome
    Wait And Click  ${出發日}
    選個日期  30
    選個日期  31
    # Close Browser

*** Keywords ***
Wait And Click
    [Arguments]  ${elem}
    Wait Until Page Contains Element  ${elem}  15
    Click Element  ${elem}

選個日期
    [Arguments]  ${day}
    Wait And Click  //*[@id="ui-datepicker-div"]//a[text()='${day}']
    #               //*[@id="ui-datepicker-div"]//a[text()='31']  # 使用文字定位
