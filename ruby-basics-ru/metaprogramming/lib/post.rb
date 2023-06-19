# frozen_string_literal: true

require_relative './model'
require 'date'

class Post
  include Virtus.model

  attribute :id, type: :integer
  attribute :title, type: :string
  attribute :body, type: :string
  attribute :created_at, type: :datetime
  attribute :published, type: :boolean
end

post = Post.new title: 'Hello, World!', body: 'First Post'
puts post.title # => 'Hello, World!'
post.title  = 'Goodbye, World!'
puts post.title  # => 'Goodbye, World!'
post.created_at = 'November 18th, 1983'
puts post.created_at # => #<DateTime: 1983-11-18T00:00:00+00:00 (4891313/2,0/1,2299161)>
puts post.attributes # => {:title=>"Goodbye, World!", :body=>"First Post", :created_at=>#<DateTime: 1983-11-18T00:00:00+00:00 ((2445657j,0s,0n),+0s,2299161j)>, :published=>nil}
