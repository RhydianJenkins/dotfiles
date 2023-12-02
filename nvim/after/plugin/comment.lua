local present, comment = pcall(require, "Comment")

if not present then
    print("Comment plugin not found")
    return
end

comment.setup()
