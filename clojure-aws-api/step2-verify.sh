var occurences = grep -o '[com.cognitect.aws/api "0.8.505"]' /root/aws-api-tutorial/project.clj
if [ occurences == 1 ] ; then
  echo "done"
fi
