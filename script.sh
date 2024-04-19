#!/bin/bash

# Sprawdzenie połączenia z frontend do backend
echo "Test połączenia z frontend do backend:"
docker-compose exec frontend curl -s backend:3000 || echo "Połączenie z frontend do backend NIEUDANE"

# Sprawdzenie połączenia z backend do database
echo "Test połączenia z backend do database:"
docker-compose exec backend curl -s database:5432 || echo "Połączenie z backend do database NIEUDANE"

# Sprawdzenie połączenia z frontend do database
echo "Test połączenia z frontend do database:"
docker-compose exec frontend curl -s database:5432 && echo "Połączenie NIEPOWODZENIE - frontend NIE POWINIEN mieć dostępu do database" || echo "Połączenie zablokowane jak oczekiwano"
