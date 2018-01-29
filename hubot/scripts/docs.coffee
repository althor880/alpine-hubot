# Description:
#  <This script does things>
#
# Dependencies:
#   "<module name>": "<module version>"
#
# Configuration:
#   LIST_OF_ENV_VARS_TO_SET
#
# Commands:
#  jules docs for <system>/<service> - <what the respond trigger does>
#  jules logs for <service> - <Returns a link for dev logs for a given service>
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   <github username of the original script author>

module.exports = (robot) ->


  robot.respond /docs for (.*)\/(.*)/i, (res) ->
    system = res.match[1]
    service = res.match[2]
#    if doorType is "pod bay"
##      res.reply "I'm afraid I can't let you do that."
#    else
    res.reply "Returning docs for #{system}/#{service}\n
    https://bitbucket.communitect.com/projects/#{system}/repos/#{service}/browse/README.md"

  robot.respond /logs for (.*)/i, (res) ->
    service = res.match[1]
#    if doorType is "pod bay"
##      res.reply "I'm afraid I can't let you do that."
#    else
    res.reply "Returning logs for #{service}\n
    https://console.cloud.google.com/logs/viewer?project=dev-srplatform&organizationId=610069180481&minLogLevel=0&expandAll=false&resource=container%2Fcluster_name%2Fmain&logName=projects%2Fdev-srplatform%2Flogs%2F#{service}-webapp"
