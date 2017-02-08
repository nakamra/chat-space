json.body @message.body
json.name @message.user.name
json.time @message.created_at.strftime('%m/%d %H:%M:%S')
