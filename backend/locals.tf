locals {
  backend_env = {
    DB_HOST = data.terraform_remote_state.infra.outputs.db_endpoint
    DB_USER = data.terraform_remote_state.infra.outputs.db_username
    DB_PASS = data.terraform_remote_state.infra.outputs.db_password
    DB_NAME = data.terraform_remote_state.infra.outputs.db_name
  }
}