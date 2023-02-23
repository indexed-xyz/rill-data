#!/usr/bin/env bash
set -e

ADDRESS=$1
if [[ -z ${ADDRESS} ]]; then
    echo "Usage: $0 <contract_address>"
    exit 1
fi

OS=$(uname -s | tr '[:upper:]' '[:lower:]')
if [ $OS == "darwin" ]; then
    ADDRESS_HASH=$(md5 -qs $ADDRESS)
elif [ $OS == "linux" ]; then
    ADDRESS_HASH=$(echo -n $ADDRESS | md5sum | awk '{print $1}')
else
    printf "Platform not supported: os=$OS\n"
    exit 1
fi

LAST_CHARS=${ADDRESS_HASH:(-2)}
PROJECT=indexed-xyz-$LAST_CHARS

echo "indexed.xyz project initializing..."

echo "installing and updating Rill..."
curl -s https://cdn.rilldata.com/install.sh | bash -s -- --nightly

if [ ! -d "$PROJECT" ]; then
    echo "Cloning your indexed.xyz core analysis to $PROJECT..."
    git clone https://github.com/indexed-xyz/rill-data.git $PROJECT

    echo "Personalizing exploration for contract $ADDRESS..."
    for f in \
        ./$PROJECT/{dashboards,sources}/*.yaml \
        ./$PROJECT/models/*.sql \
        ./$PROJECT/rill.yaml; do
            if [ $OS == "darwin" ]; then
                sed -i '' -e "s/{{ address_hash }}/$ADDRESS_HASH/gi" $f
                sed -i '' -e "s/{{ address }}/$ADDRESS/gi" $f
                sed -i '' -e "s/{{ last_chars }}/$LAST_CHARS/gi" $f
            elif [ $OS == "linux" ]; then
                sed -i -e "s/{{ address_hash }}/$ADDRESS_HASH/gi" $f
                sed -i -e "s/{{ address }}/$ADDRESS/gi" $f
                sed -i -e "s/{{ last_chars }}/$LAST_CHARS/gi" $f
            fi
    done
fi

echo "Setting up demo credentials for the R2 bucket data..."
export AWS_ACCESS_KEY_ID=$2
export AWS_SECRET_ACCESS_KEY=$3

echo "Initializing Rill..."
rill start --project="./$PROJECT"
