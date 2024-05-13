key_file="pk.txt"
if [ -f "$key_file" ]; then
    echo "start..."
    while IFS= read -r sui_key; do
        echo ${sui_key:0:16}
        WALLET=$sui_key pm2 start --name ${sui_key:0:16} "bun run src/cli/index.ts -- mine"
    done <"$key_file"
    echo "end!"
else
    echo "pk.txt not found"
fi