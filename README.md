# README.md

This terraform project is used for testing the tools `terraform-compliance`
and `Infracost`.

```
terraform plan -out=plan.out

terraform-compliance -f compliance/ -p plan.out
# Make sure the terraform-compliance executable is in your $PATH.
# e.g. for Ubuntu Linux run:
PATH=$HOME/.local/bin:$PATH

infracost breakdown --path .
```
## Installation
https://www.infracost.io/docs/

https://terraform-compliance.com/pages/installation/

## terraform-compliance

The tool `terraform-compliance` needs a directory, where it searches for `.feature` files. These files are written in a specific `radish` syntax, this is a Behavior Driven Development tool. In these files we can specify security rules, which we want to be fulfilled and checked for when running the program.

In this test case we want to make sure, that every security group, which has ingress rules defined, also allows port 22.

Our `.feature` file looks like this:

```
Feature: check security groups

Scenario: every security group should allow port 22 ingress
    Given I have AWS Security Group defined
    When it has ingress
    Then it must have ingress
    Then it must have tcp protocol and port 22 for 0.0.0.0/0
```

## Infracost

Infracost calculates cloud costs based on Terraform. Cost estimates can be shown on the terminal or put in pull requests using CI/CD integrations.

We can show a full breakdown of costs of our current project with:

```
infracost breakdown --path .
```

