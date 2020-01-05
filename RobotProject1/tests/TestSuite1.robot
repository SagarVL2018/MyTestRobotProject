*** Settings ***
Library    SeleniumLibrary 

Test Setup    Log    I am in Test SetUP  
Test Teardown    Log    I am in Test TearDown    

Suite Setup    Log    I am in Suite SetUP    
Suite Teardown    Log    I am in Suite TearDown           

*** Variables ***
${URL}            https://opensource-demo.orangehrmlive.com/
${Browser}        chrome
@{Login}          Admin    admin123
&{Credentials}    username=Admin    password=admin123  


*** Keywords ***
LoginKW
    Input Text        id=txtUsername    @{Login}[0]    
    Input Password    id=txtPassword    &{Credentials}[password] 
    Click Button      id=btnLogin



*** Test Cases ***
MyFirstTestCase
    Log    Hello World!    
    
MyFirstSeleniumTestCase
    Open Browser    https://google.com    chrome
    Set Browser Implicit Wait    5
    Input Text    name=q    Automation step by step
    Press Keys    name=q    ENTER
    Close Browser
    
SampleLoginTest
    [Documentation]    This is a sample testcase for login
    Open Browser    https://opensource-demo.orangehrmlive.com/    chrome
    Set Browser Implicit Wait    10
    Input Text        id=txtUsername    Admin    
    Input Password    id=txtPassword    admin123
    Click Button      id=btnLogin    
    Click Element     id=welcome    
    Click Element     Link=Logout 
    Wait Until Element Is Visible    id=txtUsername
    Sleep    2           
    Close Browser
    Log               Login successful            

Sample_Login_Test_With_Variables
    [Documentation]    This is a sample testcase for login with variables
    [Tags]    smoke
    Open Browser    ${URL}    ${Browser}
    Set Browser Implicit Wait    10
    LoginKW    
    Click Element     id=welcome    
    Click Element     Link=Logout 
    Wait Until Element Is Visible    id=txtUsername
    Sleep    2           
    Close Browser
    Log               Login successful, Login test was executed by %{username} and %{os}    

MyFifthTestCase
    Log    I am in Fifth Test case need to be addded to GIT    


