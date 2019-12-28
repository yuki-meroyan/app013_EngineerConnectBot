json.array! @users do |user|
  json.user_name user.name
  json.user_id user.id
  json.user_image user.image
  json.user_follower user.followers
  json.user_followed user.followeds
end
# json.my_user_id @myUserId

