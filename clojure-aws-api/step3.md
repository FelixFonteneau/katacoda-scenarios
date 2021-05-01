# Set up of the credentials
In this part of the tutorial, we will set up the system to access AWS services. 

We will use the IAM (Identity and Access Management) service of AWS. A user has been created for this tutorial, with an access key ID, a secret access key, and an associated region. When IAM users make calls to AWS, credentials are searched on the system. One location where the credentials can be stored is environment variables. 

_(note that the following key is useless and only serve as an example, no general access or important service is attached to it)_

## AWS-CLI configuration

We could manually configure the files but we will use AWS-CLI for simplicity. As the name suggests, AWS-CLI is the command-line interface of AWS. Let's set our credentials as environment variables with aws-cli:

- `aws configure`{{execute}}

In the command execution feel the following:
- AWS_ACCESS_KEY_ID = `AKIATDGHMRLCBX4MNVEG`{{execute}}
- AWS_SECRET_ACCESS_KEY = `oVFGLfaXqsgHhVvYAJMhJqDYDoZ0xHhL5EaGQwrW`{{execute}}
- DEFAULT_REGION = `eu-north-1`{{execute}}
- DEFAULT_FORMAT = `json`{{execute}}

_Of course, you will replace the previous information with the IAM of your project._

You should now be able to connect as a tester to AWS using aws-cli:
- `aws iam get-user`{{execute}}

You should now see a result similar at:
```json
{
    "User": {
        "Path": "/",
        "UserName": "tester",
        "UserId": "AIDATDGHMRLCPRPCVQVM5",
        "Arn": "arn:aws:iam::213019036356:user/tester",
        "CreateDate": "2021-04-25T10:22:15+00:00"
    }
}
```

## Clojure

The tutorial aims at proposing an alternative to the aws-cli. 

You can now create a client and check your info. Let's update our main function: 


<pre class="file" data-filename="aws-api-tutorial/src/aws_api_tutorial/core.clj" 
    data-target="replace">
(ns aws-api-tutorial.core
  (:gen-class))

(require '[cognitect.aws.client.api :as aws])

(defn -main 
  "main"
  [& args]
  ( ->  (aws/client {:api :iam})
        (aws/invoke {:op :GetUser})
        (print)))
</pre>

Let's now run our code! 

- `lein run`{{execute}}

You should be able to see user information in JSON.

## Explanation of the code

`(aws/client {:api :iam})` calls the function aws/client with parameters `:api` and `:iam`. 
`(aws/invoke {:op :GetUser})` calls the function aws/invoke that takes 2 parameters: a client and an operation. Because of the `->` operator, the output of the previous line is passed as parameter to the function. This means that the first parameter of aws/invoke is actually the client that we previously created. The 2nd parameter is the operation `{:op :GetUser}`. We finally take the output of aws/invoke and print it! 