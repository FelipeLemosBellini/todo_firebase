#!/bin/bash

build_type="apk"
environment="qa"

echo "Iniciando build do app Android - Environment: $environment"

cd ../base_app/ && \
flutter clean && \
flutter build $build_type --dart-define=ENV=$environment

echo "Termino da geração build do app Android - Environment: $environment"