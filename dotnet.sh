#!/bin/bash

rm dotnet-install.sh

curl -L https://dot.net/v1/dotnet-install.sh -o dotnet-install.sh
chmod +x ./dotnet-install.sh
./dotnet-install.sh --channel 9.0
dotnet tool install -g JetBrains.Resharper.GlobalTools

rm dotnet-install.sh

