class CommentMailer < ApplicationMailer
 def comment_created(current_user,article_user,body)
      @current_user=current_user
      @article_user=article_user
      @body=body
     mail(to: article_user.email,
      from: "services@ayan.blog.app",
      subject: "Commented on your post",
     
     )
    end
end
