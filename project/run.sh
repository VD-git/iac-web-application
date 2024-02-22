#!/bin/bash

if [[ $1 != "preview" && $1 != "delete" && $1 != "deploy" ]];
then
	echo "ERROR. Incorect execution mode. Valid modes: preview, delete and deploy"
	exit 1
fi

EXECUTION_MODE=$1
STACK_NAME=$2
REGION=$3
TEMPLATE_FILE=$4
PARAMETERS_FILE=$5

if [ $EXECUTION_MODE == "preview" ]
then
	aws cloudformation deploy \
		--stack-name $STACK_NAME \
		--template-file $TEMPLATE_FILE \
		--no-execute-changeset \
		--parameter-overrides file://$PARAMETERS_FILE \
		--region=$REGION
fi

if [ $EXECUTION_MODE == "deploy" ]
then
	aws cloudformation deploy \
		--stack-name $STACK_NAME \
		--template-file $TEMPLATE_FILE \
		--parameter-overrides file://$PARAMETERS_FILE \
		--region=$REGION
fi

if [ $EXECUTION_MODE == "delete" ]
then
	aws cloudformation delete-stack \
		--stack-name $STACK_NAME \
		--region=$REGION
fi

