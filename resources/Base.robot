*Settings*
Documentation       Base Test

Library             Browser
Library             Collections
Library             factories/Users.py

Resource            actions/_SharedActions.robot
Resource            actions/AuthActions.robot
Resource            actions/GeekActions.robot
Resource            actions/SignupActions.robot

Resource            Database.robot
Resource            Helpers.robot

*Variables*
${BASE_URL}         https://getgeeks-raphael.herokuapp.com

*Keywords*
Start Session
    New Browser     chromium        headless=false      slowMo=00:00:00
    New Page        ${BASE_URL} 

Finish Session
    Take Screenshot
