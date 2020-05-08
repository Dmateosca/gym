#!/usr/bin/env bash

# base dir
BASEDIR='/home/gym'
COMMON_FLAGS='--ignore-not-found=true'

printf 'Iniciando el proceso de limpieza en el cluster ... \n'

# clean objets from chapter pods
kubectl --namespace default delete -f $BASEDIR/pods/ $COMMON_FLAGS
kubectl --namespace default delete -f $BASEDIR/labels/ $COMMON_FLAGS
kubectl --namespace default delete -f $BASEDIR/replicasets/ $COMMON_FLAGS
kubectl --namespace default delete -f $BASEDIR/deployments/ $COMMON_FLAGS
kubectl --namespace default delete -f $BASEDIR/services/ $COMMON_FLAGS
kubectl --namespace default delete -f $BASEDIR/ingress/ $COMMON_FLAGS
kubectl delete -f $BASEDIR/namespaces/ $COMMON_FLAGS
kubectl delete -f $BASEDIR/volumes/ $COMMON_FLAGS
kubectl --namespace default delete -f $BASEDIR/configmaps/ $COMMON_FLAGS
kubectl --namespace default delete -f $BASEDIR/secrets/ $COMMON_FLAGS

printf '\nHa terminado el proceso de limpieza en el cluster.\n'