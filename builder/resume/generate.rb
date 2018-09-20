#!/usr/bin/env ruby
require 'redcarpet'
require 'erb'
require 'yaml'
require 'hashie'

class MyRenderer < Redcarpet::Render::HTML
  def initialize(*args)
    @in_section = false
    super
  end

  def hrule
    @in_section = true
    ""
  end

  def header(text, level)
    h_tag = "<h#{level + 1}>#{text}</h#{level + 1}>"
    if @in_section && level < 4
      @in_section = false
      "<header>#{h_tag}</header>"
    else
      h_tag
    end
  end
end

def render_file(filename, params={})
  author = Hashie::Mash.new(YAML.load_file('author.yaml'))
  erb = ERB.new(open(File.join(File.dirname(__FILE__), filename)).read)
  erb.result_with_hash(params.merge(author: author))
end

markdown = Redcarpet::Markdown.new(MyRenderer, {autolink: true})
content = markdown.render(open(ARGV[0]).read)

puts render_file('resume.erb', {content: content, site: Hashie::Mash.new(YAML.load_file('./config/site.yml'))})
