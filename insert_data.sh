#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Iterar sobre games.csv

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_SCORE OPPONENT_SCORE
do
  if [[  $YEAR != 'year' ]]
  then
    # Verificar que el equipo local no este registrado.

    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    if [[ -z "$WINNER_ID" ]]
    then
      # Cargar el equipo en la base de datos.

      INSERT_WINNER=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")

      # Verificar insercion exitosa.

      if [[ "$INSERT_WINNER" == 'INSERT 0 1' ]]
      then
        echo -e "\n$WINNER fue agregado a la base de datos con exito."

        # Cargar el ID recientemente generado.

        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
      else
        echo -e "\nHubo un error en la insercion del equipo."
      fi
    fi

    # Verificar que el equipo visitante no este registrado.

    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    if [[ -z "$OPPONENT_ID" ]]
    then
      # Cargar el equipo en la base de datos.

      INSERT_OPPONENT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")

      # Verificar insercion exitosa.

      if [[ "$INSERT_OPPONENT" == 'INSERT 0 1' ]]
      then
        echo -e "\n$OPPONENT fue agregado a la base de datos con exito."

        # Cargar el ID recientemente generado.

        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
      else
        echo -e "\nHubo un error en la insercion del equipo."
      fi
    fi

    # Insertar datos del partido en la base de datos.

    INSERT_GAME=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_SCORE,$OPPONENT_SCORE)")

    # Verificar insercion exitosa.

    if [[ "$INSERT_GAME" == 'INSERT 0 1' ]]
    then
      echo -e "\nSe agrego $WINNER vs $OPPONENT del mundial $YEAR"
    else
      echo -e "\nHubo un error en la insercion del juego"
    fi
  fi
done