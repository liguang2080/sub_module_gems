module Weibo
  class Client
    attr_reader :oauth

    def initialize(access_token, weibo_uid = nil)
      @oauth = Oauth.new(access_token)
      @weibo_uid = weibo_uid
    end

    def update(status)
      self.oauth.post("statuses/update", :status  => status)
    end

    def upload(status, pic_path, lat = nil, long = nil)
      self.oauth.post('statuses/upload', :status => status, :pic => File.new(File.expand_path(pic_path)))
    end

    def followers(cursor = -1, count = 200)
      self.oauth.get("friendships/followers", :cursor => cursor, :count => count, :uid => @weibo_uid)
    end

    def friends(cursor = -1, count = 200)
      self.oauth.get("friendships/friends", :cursor => cursor, :count => count, :uid => @weibo_uid)
    end

    def create_friendship
      self.oauth.post("friendships/create", :uid  => @weibo_uid)
    end

    def users_show
      self.oauth.get("users/show", :uid => @weibo_uid)
    end

    def statuses_show(status_id)
      self.oauth.get("statuses/show", :id => status_id)
    end

    def tags
      self.oauth.get("tags", :uid => @weibo_uid)
    end

    def user_timeline
      self.oauth.get("statuses/user_timeline", :uid => @weibo_uid)
    end

    def querymid(id, type = 1)
      self.oauth.get("statuses/querymid", :id => id, :type => type)
    end

    def queryid(id, type = 1)
      self.oauth.get("statuses/queryid", :mid => id, :type => type, :isBase62 => 1)
    end

    def app_send(uids, title, content)
      self.oauth.post("notice/app/send", :uids  => uids.join(","), :title => title, :content => content)
    end
  end
end
