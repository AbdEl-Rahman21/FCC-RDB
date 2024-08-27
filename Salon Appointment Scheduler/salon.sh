#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon -t -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
    echo -e "Welcome to My Salon, how can I help you?\n"

    SERVICES=$($PSQL "select * from services")

    echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
    do
        echo "$SERVICE_ID) $SERVICE_NAME"
    done

    read SERVICE_ID_SELECTED

    if [[ $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
        VAILD_ID=$($PSQL "select * from services where service_id = $SERVICE_ID_SELECTED")

        if [[ ! -z $VAILD_ID ]]
        then
            RESERVE_APP $SERVICE_ID_SELECTED
        else
            MAIN_MENU
        fi
    else
        MAIN_MENU
    fi
}

RESERVE_APP() {
    echo -e "\nWhat's your phone number?"

    read CUSTOMER_PHONE

    CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'")

    if [[ -z $CUSTOMER_ID ]]
    then
        echo -e "\nI don't have a record for that phone number, what's your name?"

        read CUSTOMER_NAME

        TEMP=$($PSQL "insert into customers(phone, name) values('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    
        CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'")
    else
        CUSTOMER_NAME=$($PSQL "select name from customers where customer_id = $CUSTOMER_ID")
    fi

    echo -e "\nWhat time would you like your cut, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"

    read SERVICE_TIME

    TEMP=$($PSQL "insert into appointments(customer_id, service_id, time) values($CUSTOMER_ID, $1, '$SERVICE_TIME')")

    SERVICE_NAME=$($PSQL "select name from services where service_id = $1")

    echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $(echo $SERVICE_TIME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
}

MAIN_MENU
