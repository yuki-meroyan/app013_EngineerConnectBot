json.(@group_message, :text, :image)
json.user_name @group_message.user.name 
json.user_image @group_message.user.image
json.created_at @group_message.created_at.strftime("%Y/%m/%d %H:%M")
json.id @group_message.id