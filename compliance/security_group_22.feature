Feature: check security groups

Scenario: every security group should allow port 22 ingress
    Given I have AWS Security Group defined
    When it has ingress
    Then it must have ingress
    Then it must have tcp protocol and port 22 for 0.0.0.0/0