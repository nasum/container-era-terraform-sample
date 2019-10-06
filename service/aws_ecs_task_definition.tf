resource "aws_ecs_task_definition" "sample-task" {
  family                = "webapp-service"
  container_definitions = file("./container_definitions/service.json.tpl")

  execution_role_arn = data.terraform_remote_state.aws_iam.outputs.ecs_task_role_arn
  network_mode       = "bridge"
}

resource "aws_ecs_task_definition" "sample-migration-task" {
  family                = "webapp-migration"
  container_definitions = file("./container_definitions/migration.json.tpl")

  execution_role_arn = data.terraform_remote_state.aws_iam.outputs.ecs_task_role_arn
  network_mode       = "bridge"
}
