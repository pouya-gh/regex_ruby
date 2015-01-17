CODE = %q{
#### this is a sample method!
def method_name(args)
  # code goes here!
end
#### this is a sample module
module ModuleName
  # code goes here!
end
}
COMMENT_FILE = File.open('./comments.txt', 'w')
COMMENT_CATCHER = /\#{4}.*\n/

def save_comment_to_file(comment)
  COMMENT_FILE.write(comment)
end

comment = COMMENT_CATCHER.match(CODE)

while comment
  save_comment_to_file(comment.to_s)
  CODE.gsub!(comment.to_s, "")
  comment = COMMENT_CATCHER.match(CODE)
end

puts "done!"
