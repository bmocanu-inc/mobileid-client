#!/bin/sh
# mobileid-radius.sh - 1.2
#
# Helper script called from freeradius to invoke mobile-sign with correct parameters
#
# Change Log:
#  1.0 13.10.2012: Initial version.
#  1.1 19.11.2013: Update for the exit code
#  1.2 30.12.2013: Updated information
#
# Each of the attributes in the request will be available in an
# environment variable.  The name of the variable depends on the
# name of the attribute.  All letters are converted to upper case,
# and all hyphens '-' to underlines.
#
# For example, the User-Name attribute will be in the $USER_NAME
# environment variable.  If you want to see the list of all of
# the variables, try adding a line 'printenv > /tmp/exec-program-wait'
# to the script.  Then look in the file for a complete list of
# variables.
#
# The return value of the program run determines the result
# of the exec instance call as follows:
# (See doc/configurable_failover for details)
# = 0 : okthe module succeeded
# = 1 : reject    the module rejected the user
# = 2 : fail      the module failed
# = 3 : ok        the module succeeded
# = 4 : handled   the module has done everything to handle the request
# = 5 : invalid   the user's configuration entry was invalid
# = 6 : userlock  the user was locked out
# = 7 : notfound  the user was not found
# = 8 : noop      the module did nothing
# = 9 : updated   the module updated information in the request
# > 9 : fail      the module failed

# Get current path
PWD=$(dirname $0)

# Remove quote and all spaces
CALLED_STATION_ID=`eval echo $CALLED_STATION_ID|sed -e "s/ //g"`
# Remove quote from others
X_MSS_LANGUAGE=`eval echo $X_MSS_LANGUAGE`
X_MSS_MESSAGE=`eval echo $X_MSS_MESSAGE`

# By default a generic failure is returned
RC=10

# Call the MID service
if [ -e $PWD/mobileid-sign.sh ]; then
  $PWD/mobileid-sign.sh $CALLED_STATION_ID "$X_MSS_MESSAGE" $X_MSS_LANGUAGE 2> /dev/null
  RES_MID=$?                                    # Store the result
  if [ "$RES_MID" = "0" ]; then
    RC=0 ; 	                                # accept
  else
    RC=1 ;                                      # deny
  fi
else
  RC=11                                         # MID bash script not found
fi

exit $RC

#==========================================================
