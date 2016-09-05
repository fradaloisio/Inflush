# Influ.sh
A bash script writes data in InfluxDB

#USAGE
./influ.sh -H="http://MY_INFLUX_SERVER" -U="user" -P="passowrd" -D="my_database" -M="my_measure" -f="field1=2,field2=5" -t="tag1=2,tag2=5"
`

**-H** (--host) : Influx server

**-U** (--user) : Influx user

**-P** (--password) : Influx password

**-D** (--database) : Influx database

**-M** (--measurement) : Measurement name

**-T** (--time) : Force measurement time (in epoch)

**-f** (--fields) : List of fileds comma separated

**-t** (--tags) : List of ftags comma separated

**--raw** : raw input in line protocol



**-v** (--verbose) : Verbose

**-o** (--output) : Print status code

`
