function droneenv () {
    SERVER=$(environ=$1 python -c "import os; print os.getenv('DRONE_SERVER_'+os.getenv('environ').upper())")
    TOKEN=$(environ=$1 python -c "import os; print os.getenv('DRONE_TOKEN_'+os.getenv('environ').upper())")
    export DRONE_SERVER=$SERVER
    export DRONE_TOKEN=$TOKEN
}
