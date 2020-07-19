json.id            @talk.id
json.user_nickname @talk.user.nickname
json.date          @talk.created_at.strftime("%m/%d %H:%M")
json.talk          @talk.talk
json.image         @talk.image_url
