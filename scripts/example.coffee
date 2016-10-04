module.exports = (robot) ->

  robot.respond /get me song (.*)/i, (res) ->
    songName = res.match[1]
    if songName is ""
      res.reply "Oops"
    else
      findSong songName, res

  findSong = (songName, x) ->
    parameters = encodeURIComponent songName
    url        = "https://api.spotify.com/v1/search?q=#{parameters}&type=track"

    robot.http(url)
    .get() (err, res, body) ->
      realJson = JSON.parse(body)
      x.reply
      x.reply realJson.tracks.items[0].external_urls.spotify



# https://www.googleapis.com/youtube/v3/search?q=still%20waiting


# https://itunes.apple.com/search?term=jack+johnson
