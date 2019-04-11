class Scraping
  def self.get_contents_wired
    agent = Mechanize.new
    page = agent.get('https://wired.jp/tag/space/')

    titles = page.search('.listed-article-norm h3')
    image_urls = page.search('.listed-article-norm img')
    times = page.search('.listed-article-norm time')
    page_links = page.search('.listed-article-norm a')
    source = page.at('header h2 a')

    length = titles.length - 1

    length.times do |num|
      content = Content.where(title: titles[num].inner_text).first_or_initialize
      content.image_url = image_urls[num][:src]
      content.up_time = times[num][:datetime].to_time
      content.page_link = page_links[num][:href]
      content.source = source.inner_text
      content.save
    end
  end

  def self.get_contents_livedoor
    agent = Mechanize.new
    page = agent.get('http://news.livedoor.com/%E5%AE%87%E5%AE%99/topics/keyword/32398/')

    titles = page.search('.hasImg h3')
    image_urls = page.search('.hasImg img')
    times = page.search('.hasImg time')
    page_links = page.search('.hasImg a')
    source = page.at('header headerLogo a')

    length = titles.length - 1

    length.times do |num|
      content = Content.where(title: titles[num].inner_text).first_or_initialize
      content.image_url = image_urls[num][:src]
      content.up_time = times[num][:datetime].to_time
      content.page_link = page_links[num][:href]
      content.source = "ライブドアニュース"
      content.save
    end
  end
end
