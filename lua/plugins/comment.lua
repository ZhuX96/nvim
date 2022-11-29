local comment_status, comment = pcall(require, 'Comment')
if not comment_status then
  print('Failed to require Comment')
  return
end

comment.setup()
