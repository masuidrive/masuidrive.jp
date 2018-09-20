#!/usr/bin/env ruby
require 'redcarpet'
require 'erb'
require 'yaml'
require 'hashie'

def render_file(filename, params={})
  @partial = ""
  erb = ERB.new(open(File.join(File.dirname(__FILE__), filename)).read, nil, nil, "@partial")
  erb.result_with_hash(params)
  @partial
end

def render_markdown(filename, params={})
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, {autolink: true})
  markdown.render(open(filename).read)
end

def capture(*args, &block)
  # execute the block
  begin
    buffer = eval("_erbout", block.binding)
  rescue
    buffer = nil
  end
  
  if buffer.nil?
    block.call(*args)
  else
    pos = buffer.length
    block.call(*args)
  
    # extract the block 
    data = buffer[pos..-1]
  
    # replace it in the original with empty string
    buffer[pos..-1] = ''
  
    data
  end
end
@output = ""
erb = ERB.new(open(ARGV[0]).read, nil, nil, "@output")
puts erb.result_with_hash({site: Hashie::Mash.new(YAML.load_file('./config/site.yml'))})
