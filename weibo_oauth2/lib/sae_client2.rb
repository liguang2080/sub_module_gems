class SaeClient2
  attr_reader :oauth

  def initialize(key, secret, access_token, refresh_token, weibo_uid = nil)
    @oauth = SaeOauth2.new(key, secret, access_token, refresh_token)
    @weibo_uid = weibo_uid
  end

  def update(status)
    self.oauth.post("https://api.weibo.com/2/statuses/update.json", {:status  => status})
  end

  def upload(status, pic_path, lat = nil, long = nil)
    self.oauth.post('https://api.weibo.com/2/statuses/upload.json', {:status => status, :pic => File.new(File.expand_path(pic_path))})
  end

  def followers(cursor = -1, count = 200)
    self.oauth.get("https://api.weibo.com/2/friendships/followers.json", {:cursor => cursor, :count => count, :uid => @weibo_uid})
  end

  def friends(cursor = -1, count = 200)
    self.oauth.get("https://api.weibo.com/2/friendships/friends.json", {:cursor => cursor, :count => count, :uid => @weibo_uid})
  end

  def create_friendship
    self.oauth.post("https://api.weibo.com/2/friendships/create.json", {:uid  => @weibo_uid})
  end

  def users_show
    self.oauth.get("https://api.weibo.com/2/users/show.json", {:uid => @weibo_uid})
  end
  
  def statuses_show(status_id)
    self.oauth.get("https://api.weibo.com/2/statuses/show.json", {:id => status_id})
  end

  def tags
    self.oauth.get("https://api.weibo.com/2/tags.json", {:uid => @weibo_uid})
  end
  
  def user_timeline
    self.oauth.get("https://api.weibo.com/2/statuses/user_timeline.json", {:uid => @weibo_uid})
  end
  
  def querymid(id, type = 1)
    self.oauth.get("https://api.weibo.com/2/statuses/querymid.json", {:id => id, :type => type})
  end
  
  def queryid(id, type = 1)
    self.oauth.get("https://api.weibo.com/2/statuses/queryid.json", {:mid => id, :type => type, :isBase62 => 1})
  end
  
  def app_send(uids, title, content)
    self.oauth.post("https://api.weibo.com/2/notice/app/send.json", {:uids  => uids.join(","), :title => title, :content => content })
  end
end
