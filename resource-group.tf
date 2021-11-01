resource "aws_resourcegroups_group" "main" {
  name = local.service_name

  resource_query {
    query = jsonencode({
      ResourceTypeFilters : [
        "AWS::AllSupported"
      ],
      TagFilters : [
        {
          Key : "service_name",
          Values : [local.service_name]
        }
      ]
    })
  }

  tags = local.resource_group_tags

}
