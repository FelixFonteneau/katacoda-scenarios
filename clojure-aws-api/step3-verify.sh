if [ -d /root/.aws ] && grep -q '(aws/client {:api :iam})' /root/aws-api-tutorial/src/aws_api_tutorial/core.clj ; then
  echo "done"
fi
