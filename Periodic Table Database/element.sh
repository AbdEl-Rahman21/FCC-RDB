#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
    echo "Please provide an element as an argument."
else
    if [[ $1 =~ ^[0-9]+$ ]]
    then
        ELEMENT_ID=$($PSQL "select atomic_number from elements where atomic_number = $1")
    else
        ELEMENT_ID=$($PSQL "select atomic_number from elements where symbol = '$1' or name = '$1'")
    fi

    if [[ -z $ELEMENT_ID ]]
    then
        echo "I could not find that element in the database."
    else
        NAME=$($PSQL "select name from elements where atomic_number = $ELEMENT_ID")
        SYMBOL=$($PSQL "select symbol from elements where atomic_number = $ELEMENT_ID")
        MASS=$($PSQL "select atomic_mass from properties where atomic_number = $ELEMENT_ID")
        MPC=$($PSQL "select melting_point_celsius from properties where atomic_number = $ELEMENT_ID")
        BPC=$($PSQL "select boiling_point_celsius from properties where atomic_number = $ELEMENT_ID")
        TYPE=$($PSQL "select type from properties inner join types using(type_id) where atomic_number = $ELEMENT_ID")

        echo "The element with atomic number $ELEMENT_ID is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MPC celsius and a boiling point of $BPC celsius."
    fi
fi
