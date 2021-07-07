*** Settings ***
Library    SeleniumLibrary   

*** Variables ***
${URL}          
${email}        
${password}       
${browser}      chrome

*** Test Cases ***
GetSetUp Webapp 
    Open Browser                 ${URL}    ${browser}
    Set Browser Implicit Wait    5
    Maximize Browser Window
    Click Element                xpath://*[@id="PopupSignupForm_0"]/div[2]/div[1]   
    Click Button                 xpath://*[@id="__layout"]/div/section[1]/nav[1]/div[2]/div[2]/div/div/button     
    Click Element                xpath://*[@id="__layout"]/div/section/div/div/section/div[1]/section/div/section/span/div/span 
    Input Text                   xpath:(//*[@placeholder='Enter your email address'])[1]      ${email}
    Click Button                 xpath:(//*[@type='submit'])[1]  
    Input Text                   xpath://*[@placeholder='Password']                           ${password}
    Click Button                 xpath:(//*[@type='submit'])[1] 
    ${name} =  Get Text          class:username   
    Log                          Login Successful. Username is ${name}.
    Sleep                        5 
    # Take count of active days,classes taken and wellness mins
    ${active_Days_Count} =      Get Text      xpath://*[@id="__layout"]/div/section[3]/div[1]/div/div[2]/div/div[1]/div/div[2]/h2
    ${classes_taken_count} =    Get Text      xpath://*[@id="__layout"]/div/section[3]/div[1]/div/div[2]/div/div[2]/div/div[2]/h2  
    ${wellness_minute_count} =  Get Text      xpath://*[@id="__layout"]/div/section[3]/div[1]/div/div[2]/div/div[3]/div/div[2]/h2
    Log    Active Days: ${active_Days_Count}, Classes taken:${classes_taken_count}, Wellness minute: ${wellness_minute_count} 
    
    # Validate the info icon and tooltip text
    # For Active days
    Click Element    xpath://*[@id="__layout"]/div/section[3]/div[1]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/span/div[2]/img  
    Sleep    2      
    ${info_of_active_days} =  Get Text    xpath://*[@id="__layout"]/div/section[3]/div[1]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/span/div[1]
    Log    Info of active days : ${info_of_active_days}       

    # for Classes taken
    Click Element    xpath://*[@id="__layout"]/div/section[3]/div[1]/div/div[2]/div/div[2]/div/div[3]/div/div[2]/span/div[2]/img
    Sleep    2    
    ${Info_of_classes_taken} =  Get Text    xpath://*[@id="__layout"]/div/section[3]/div[1]/div/div[2]/div/div[2]/div/div[3]/div/div[2]/span/div[1]
    Log    Info of classes taken : ${Info_of_classes_taken}   
      
    # For wellness minutes
    Click Element    xpath://*[@id="__layout"]/div/section[3]/div[1]/div/div[2]/div/div[3]/div/div[3]/div/div[2]/span/div[2]/img
    Sleep    2    
    ${info_of_wellness_min} =  Get Text    xpath://*[@id="__layout"]/div/section[3]/div[1]/div/div[2]/div/div[3]/div/div[3]/div/div[2]/span/div[1]
    Log    Info of wellness min is :${info_of_wellness_min}         
       
    # Continue For Loop If 
    # Enter text in search and Hit enter button
    # Click Element                             xpath://*[@id="__layout"]/div/section[3]/section/div/div/div/div[2]/a 
    # Wait Until Element Is Visible             xpath://*[@id="__layout"]/div/section[3]/div[1]/div[1]/div/div[1]/h1  
    # Input Text                                xpath://*[@placeholder='Search Guides and Classes']         Book 
    # Press Keys                                xpath://*[@placeholder='Search Guides and Classes']         ENTER
    
    # Need help
    Click Element    xpath://*[@id="__layout"]/div/section[1]/nav[1]/div[2]/div[2]/div/a[1]
    ${help_header_text} =  Get Text    xpath://*[@id="__layout"]/div/section[3]/div[1]/div[1]/div/h1
    Log    Help page Header is : ${help_header_text}  

   # Log out
    Sleep                        5    
    Click Element                xpath://*[@id="__layout"]/div/section[1]/nav[1]/div[2]/div[2]/div/div/div/div[1]/div    
    Click Element                xpath://*[@id="__layout"]/div/section[1]/nav[1]/div[2]/div[2]/div/div/div/div[3]/div/a[2]
    ${signUp_Text} =  Get Text   xpath://*[@id="__layout"]/div/section[1]/nav[1]/div[2]/div[2]/div/div/button/span 
    Log    Log Out Successful.      
    
    

*** Keywords ***



