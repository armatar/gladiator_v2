require 'coveralls'            # These two lines must go first
Coveralls.wear!

#require 'simplecov'            # These two lines must go first
#SimpleCov.start

require 'minitest/autorun'

def with_stdin
  stdin = $stdin             # remember $stdin
  $stdin, write = IO.pipe    # create pipe assigning its "read end" to $stdin
  yield write                # pass pipe's "write end" to block
ensure
  write.close                # close pipe
  $stdin = stdin             # restore $stdin
end

def capture_stdout(&block)
  original_stdout = $stdout
  $stdout = fake = StringIO.new
  begin
    yield
  ensure
    $stdout = original_stdout
  end
  fake.string
end