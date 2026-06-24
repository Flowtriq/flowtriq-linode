#!/bin/bash

DEFAULT_DNS="$(hostname -I | awk '{print $1}'| tr '.' '-' | awk {'print $1 ".ip.linodeusercontent.com"'})"

# custom env variables from cli
if [[ -n ${INSTANCE_ENV} ]]; then
  custom_vars=(${INSTANCE_ENV})
  var_count=${#custom_vars[@]}
  count=0
  while [ ${count} -lt ${var_count} ]; do
    export ${custom_vars[count]}
  count=$(( $count + 1 ))
  done
fi

# UDF Variables

declare -A UDF_VARS

if [[ -n "${USER_NAME}" ]]; then
        UDF_VARS["USER_NAME"]="${USER_NAME}"
else
        UDF_VARS["USER_NAME"]="admin"
fi

if [[ -n "${DISABLE_ROOT}" ]]; then
        UDF_VARS["DISABLE_ROOT"]="${DISABLE_ROOT}"
else
        UDF_VARS["DISABLE_ROOT"]="No"
fi

if [[ -n "${TOKEN_PASSWORD}" ]]; then
        UDF_VARS["TOKEN_PASSWORD"]="${TOKEN_PASSWORD}"
else
        UDF_VARS["TOKEN_PASSWORD"]=""
fi

if [[ -n "${SUBDOMAIN}" ]]; then
        UDF_VARS["SUBDOMAIN"]="${SUBDOMAIN}"
else
        UDF_VARS["SUBDOMAIN"]=""
fi

if [[ -n "${DOMAIN}" ]]; then
        UDF_VARS["DOMAIN"]="${DOMAIN}"
else
        UDF_VARS["DOMAIN"]=""
fi

if [[ -n "${API_KEY}" ]]; then
        UDF_VARS["API_KEY"]="${API_KEY}"
else
        UDF_VARS["API_KEY"]=""
fi

if [[ -n "${NODE_UUID}" ]]; then
        UDF_VARS["NODE_UUID"]="${NODE_UUID}"
else
        UDF_VARS["NODE_UUID"]=""
fi

set_vars() {
  for key in "${!UDF_VARS[@]}"; do
    export "${key}"="${UDF_VARS[$key]}"
  done
}

# main
set_vars
