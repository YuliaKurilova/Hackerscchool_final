*** Settings ***
Library    SeleniumLibrary
Variables    ../Objects/Hrm_Objects.py
Variables    ../Resources/Test_Data.py

*** Keywords ***
Open Browser To Orangehrmlive
    Open Browser    https://opensource-demo.orangehrmlive.com/    chrome
Capture Screenshot And Close browser
    Capture Page Screenshot  
    Close Browser  
Login
    [Arguments]    ${admin_loginname}    ${admin_password}
    Input Text    ${username_input}    ${admin_loginname}
    Input Password    ${password_input}    ${admin_password}
    Click button    ${login_button}

Open Sections
    Wait Until Page Contains Element    ${recruitment_tab}    
    Click Element    ${recruitment_tab}
    Click Element    ${vacancies_subtab}
    Wait Until Page Contains Element    ${open_vacancy_form} 

Open form
    Click Element    ${open_vacancy_form}
    Wait Until Page Contains Element    ${job_title_select}
Fill in form and save
    Select From List By Value    ${job_title_select}    8
    Input Text    ${vacancy_name_input}    Julia
    Input Text    ${hiring_manager_input}    ${hiring_manager}
    Input Text    ${number_of_positions_input}    ${number_of_positions}
    Input Text    ${description_textarea}    ${description}
    Select Checkbox    ${vacancy_status_checkbox}
    Checkbox Should Be Selected    ${vacancy_status_checkbox}
    Unselect Checkbox    ${publish_in_rss_checkbox}
    Checkbox Should Not Be Selected    ${publish_in_rss_checkbox}
    Click Button    ${save_vacancy_button}
Verify Saving Vacancy
    Click Element    ${vacancies_subtab} 
    Page Should Contain    Julia    
                          
    
    
Get Vacancy Name
    [Arguments]    ${prefix}
    ${time_in_ms}    Evaluate	int(round(time.time() * 1000))    time
    ${vacancy_name}    Catenate    ${prefix}${time_in_ms}
	[Return]    ${vacancy_name}