*** Settings ***
Resource    ../Keywords/Hrm_Keywords.robot
Variables    ../Objects/Hrm_Objects.py
Variables    ../Resources/Test_Data.py
Library    SeleniumLibrary 
Suite Setup    Open Browser To Orangehrmlive
Suite Teardown    Capture Screenshot And Close browser      

*** Variables ***
${prefix}    Julia
${url}    https://opensource-demo.orangehrmlive.com/
${browser}    chrome

*** Test Cases ***
Login Admin
    Login    ${admin_loginname}    ${admin_password}
Open Recruitment / Vacancies section
    Sleep    3    
    Open Sections
    
Open new vacancy form
    Open form
    
Fill in the new vacancies form and save it
    Fill in form and save
    Verify Saving Vacancy
    
#Delete the vacancy
    #Delete vacancy
Test
    ${vacancy_name}    Get Vacancy Name    ${prefix}