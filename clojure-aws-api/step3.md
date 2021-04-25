In this part of the tutorial, we will set up the system to access AWS services. 

We will use the IAM (Identity and Access Management) service of AWS. A user has been created for this tutorial, with an access key ID, a secret access key and an associated region.

We can now set those credentials as environment variables. Let's use the aws-cli command to set up our system. 
`aws configure`{{execute}}
`AWS_ACCESS_KEY_ID = AKIATDGHMRLCBX4MNVEG`
`AWS_SECRET_ACCESS_KEY = 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`
`AWS_DEFAULT_REGION = eu-north-1`
`DEFAULT_FORMAT = json`

You should now be able to connect as a tester to AWS using aws-cli.
`aws iam get-user`{{execute}}

The aim of this tutorial is to propose a powerful alternative to this aws-cli. 

You can now launch the REPL `lein repl`{{execute}} and create a client: 
`(require '[cognitect.aws.client.api :as aws])`{{execute}}


`(def iam (aws/client {:api :iam}))`{{execute}}


`(aws/invoke iam {:op :GetUser})`{{execute}}
