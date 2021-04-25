if [ grep -q '[com.cognitect.aws/api "0.8.505"]' /root/aws-api-tutorial/project.clj ]
    && [ grep -q '[com.cognitect.aws/endpoints "1.1.11.976"]' /root/aws-api-tutorial/project.clj ]
    && [ grep -q '[com.cognitect.aws/lambda "811.2.865.0"]' /root/aws-api-tutorial/project.clj ]
    && [ grep -q '[com.cognitect.aws/iam "811.2.889.0"]' /root/aws-api-tutorial/project.clj ]; then
  echo "done"
fi
