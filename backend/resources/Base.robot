*Settings*
Documentation       Base test

Library             RequestsLibrary
Library             factories/Users.py

Resource            Helpers.robot
Resource            routes/GeeksRoute.robot
Resource            routes/SessionsRoute.robot
Resource            routes/UsersRoute.robot

*Variables*
${API_USERS}        https://getgeeks-users-raphael.herokuapp.com
${API_GEEKS}        https://getgeeks-geeks-raphael.herokuapp.com


