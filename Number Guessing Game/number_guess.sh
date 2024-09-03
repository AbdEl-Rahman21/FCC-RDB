#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))
NUMBER_OF_TURNS=$(( 1 ))
NUMBER=$(( 0 ))

echo "Enter your username:"
read USERNAME

GAMES_PLAYED=$($PSQL "select games_played from users where username = '$USERNAME'")

if [[ -z $GAMES_PLAYED ]]
then
    TEMP=$($PSQL "insert into users(username) values('$USERNAME')")

    echo "Welcome, $USERNAME! It looks like this is your first time here."
else
    BEST_GAME=$($PSQL "select best_game from users where username = '$USERNAME'")

    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

(( GAMES_PLAYED += 1 ))

echo "Guess the secret number between 1 and 1000:"

while (( $NUMBER != $SECRET_NUMBER ))
do
    (( NUMBER_OF_TURNS += 1 ))

    read NUMBER

    while [[ ! $NUMBER =~ ^[0-9]+$ ]]
    do
        echo "That is not an integer, guess again:"
        read NUMBER
    done

    if (( $NUMBER > $SECRET_NUMBER ))
    then
        echo "It's lower than that, guess again:"
    else
        echo "It's higher than that, guess again:"
    fi
done

echo "You guessed it in $NUMBER_OF_TURNS tries. The secret number was $SECRET_NUMBER. Nice job!"

if [[ -z $BEST_GAME || $NUMBER_OF_TURNS < $BEST_GAME ]]
then
    TEMP=$($PSQL "update users set best_game = $NUMBER_OF_TURNS, games_played = $GAMES_PLAYED where username = '$USERNAME'")
fi
