#!/bin/bash
# chkconfig: 2345 10 90
# description: Starts graphql memb-graphql-api

graphql_start() {
  echo Starting memb-graphql-api...
  runuser -u memb-graphql-api /home/memb-graphql-api/graphql.sh start
  RETVAL=$?
}

graphql_stop() {
  echo Stopping memb-graphql-api...
  runuser -u memb-graphql-api /home/memb-graphql-api/graphql.sh stop
  RETVAL=$?
}

graphql_restart() {
  echo Re-starting memb-graphql-api...
  runuser -u memb-graphql-api /home/memb-graphql-api/graphql.sh reboot
  RETVAL=$?
}

graphql_recycle() {
  echo Re-starting memb-graphql-api...
  runuser -u memb-graphql-api /home/memb-graphql-api/graphql.sh reboot
  RETVAL=$?
}

graphql_status() {
  echo Checking status of memb-graphql-api...
  runuser -u memb-graphql-api /home/memb-graphql-api/graphql.sh ping
  RETVAL=$?
}


case "$1" in
  start)
    graphql_start
    ;;
  stop)
    graphql_stop
    ;;
  restart)
    graphql_restart
    ;;
  status)
    graphql_status
    ;;
  recycle)
    graphql_recycle # soft form of restart, without restarting VM
    ;;
  *)
    echo "Usage: $0 {start|stop|restart|status|recycle}"
    exit 1
    ;;
esac

exit $RETVAL
