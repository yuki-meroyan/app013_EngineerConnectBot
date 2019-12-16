json.array! @group_messages do |group_message|
  json.text group_message.content
  json.image group_message.image.url
  json.created_at group_message.created_at.strftime("%Y/%m/%d %H:%M")
  json.user_name group_message.user.name
  json.id group_message.id
end