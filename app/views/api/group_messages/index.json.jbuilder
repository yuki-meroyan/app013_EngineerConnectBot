json.array! @group_messages do |group_message|
  json.text group_message.text
  json.image group_message.image.url
  json.created_at group_message.created_at.strftime("%Y/%m/%d %H:%M")
  json.user_id group_message.user.id
  json.user_name group_message.user.name
  json.user_image group_message.user.image.url
  json.id group_message.id
end