#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

$PSQL "truncate games, teams"

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    W_ID=$($PSQL "select team_id from teams where name = '$WINNER'")

    if [[ -z $W_ID ]]
    then
      $PSQL "insert into teams(name) values('$WINNER')"

      W_ID=$($PSQL "select team_id from teams where name = '$WINNER'")
    fi

    O_ID=$($PSQL "select team_id from teams where name = '$OPPONENT'")

    if [[ -z $O_ID ]]
    then
      $PSQL "insert into teams(name) values('$OPPONENT')"

      O_ID=$($PSQL "select team_id from teams where name = '$OPPONENT'")
    fi

    $PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($YEAR, '$ROUND', $W_ID, $O_ID, $W_GOALS, $O_GOALS)"
  fi
done
