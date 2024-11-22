#!/bin/bash

# Sprawdzenie, czy użytkownik podał wymagany parametr
if [ -z "$1" ]; then
  echo "Użycie: $0 {on|off}"
  exit 1
fi

# Określenie zakresu maszyn
start_id=301
end_id=315

# Funkcja do włączania maszyn
function start_machines {
  for ((i=start_id; i<=end_id; i++)); do
    qm start $i
    if [ $? -eq 0 ]; then
      echo "Maszyna $i została włączona."
    else
      echo "Błąd podczas włączania maszyny $i."
    fi
  done
  echo "Wszystkie maszyny od $start_id do $end_id zostały włączone."
}

# Funkcja do wyłączania maszyn
function stop_machines {
  for ((i=start_id; i<=end_id; i++)); do
    qm stop $i
    if [ $? -eq 0 ]; then
      echo "Maszyna $i została wyłączona."
    else
      echo "Błąd podczas wyłączania maszyny $i."
    fi
  done
  echo "Wszystkie maszyny od $start_id do $end_id zostały wyłączone."
}

# Sprawdzenie parametru i odpowiednie działanie
if [ "$1" == "on" ]; then
  start_machines
elif [ "$1" == "off" ]; then
  stop_machines
else
  echo "Niepoprawny parametr. Użycie: $0 {on|off}"
  exit 1
fi
