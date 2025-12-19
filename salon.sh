#!/bin/bash

PSQL="psql -U freecodecamp -d salon -t -A -c"

echo -e "~~ Bienvenido al sistema de turnos de Salon Peretti ~~\n"

while true
do
  SERVICES=$($PSQL "SELECT service_id,name FROM services")

  echo -e "\nA continuacion se muestran los servicios disponibles:\n"

  echo "$SERVICES" | while IFS='|' read SERVICE_ID NAME
  do
    echo "$SERVICE_ID) $NAME"
  done 

  echo -e "\nIngrese la ID de la cita que desea agendar:"

  read SERVICE_ID_SELECTED
  SEARCH_ID=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")

  if [[ -n "$SEARCH_ID" ]]
  then
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    break
  else
    echo -e "\nServicio invalido. Intente de nuevo."
  fi
done

while true
do
  echo -e "\nIngrese su numero de telefono:"
  read CUSTOMER_PHONE

  SEARCH_PHONE=$($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE'")

  if [[ -n "$SEARCH_PHONE" ]]
  then
    echo -e "Ingrese la hora a la que desea asignar el servicio:\n"
    read SERVICE_TIME

    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers where phone='$CUSTOMER_PHONE'")

    ADD_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
    
    if [[ "$ADD_APPOINTMENT" == 'INSERT 0 1' ]]
    then
      echo -e "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
    else
      echo "Hubo un error al asignar la cita. Lo siento."
    fi
  else
    echo -e "\nUsted no esta registrado. Ingrese su nombre:"
    read CUSTOMER_NAME
    echo -e "\nPor ultimo ingrese la hora a la que desea asignar el servicio:\n"
    read SERVICE_TIME

    ADD_CUSTOMER=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
    echo -e "$CUSTOMER_NAME ha sido registrado con exito.\n"

    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers where phone='$CUSTOMER_PHONE'")

    ADD_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
    echo -e "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
  break
done  

    
