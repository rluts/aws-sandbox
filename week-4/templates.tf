data "template_file" "user_data_public" {
  template = file("templates/user-data.tpl")
  vars = {
    index_text = "This is WebServer from public subnet"
  }
}

data "template_file" "user_data_private" {
  template = file("templates/user-data.tpl")
  vars = {
    index_text = "This is WebServer from private subnet"
  }
}