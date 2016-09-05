#!/bin/bash

for i in "$@"
do
case $i in
    
    -H=*|--host=*)
    HOST="${i#*=}"
    shift
    ;;
    -U=*|--user=*)
    USER="${i#*=}"
    shift
    ;;
    -P=*|--password=*)
    PASSWORD="${i#*=}"
    shift
    ;;
    -T=*|--time=*)
    TIME="${i#*=}"
    shift
    ;;
    -D=*|--database=*)
    DATABASE="${i#*=}"
    shift
    ;;
    -M=*|--measurement=*)
    MEASUREMENT="${i#*=}"
    shift
    ;;
    -f=*|--fields=*)
    FIELDS="${i#*=}"
    shift
    ;;
    -t=*|--tags=*)
    TAGS="${i#*=}"
    shift
    ;;
    --raw=*)
    RAW="${i#*=}"
    shift
    ;;
    -v|--verbose)
    VERBOSE="1"
    shift
    ;;
    -o|--output)
    OUTPUT="1"
    shift
    ;;
    *)
            # unknown option
    ;;
esac
done
if [[ $VERBOSE ]];then
	echo "HOST		= ${HOST}"
	echo "USER		= ${USER}"
	echo "PASSWORD		= ${PASSWORD}"
	echo "TIME		= ${TIME}"
	echo "DATABASE		= ${DATABASE}"
	echo "MEASUREMENT	= ${MEASUREMENT}"
	echo "FIELDS		= ${FIELDS}"
	echo "TAGS		= ${TAGS}"
fi

if [[ ! $RAW ]];then
	DATA="$MEASUREMENT"

	if [[ $TAGS ]];then
		DATA="$DATA,$TAGS"
	fi
	
	if [[ $FIELDS ]];then
	        DATA="$DATA $FIELDS"
	fi
	
	if [[ $TIME ]];then
	        DATA="$DATA $TIME"
	fi
else
	DATA=$RAW
fi

W_URL=$HOST"/write?db="$DATABASE"&u=$USER&p=$PASSWORD"
echo $DATA
R=$(curl -L -w \"%{http_code}\" -s -XPOST "$W_URL" --data-binary "$DATA")
if [[ $OUTPUT ]];then
	echo $R
fi
