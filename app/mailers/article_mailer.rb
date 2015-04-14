class ArticleMailer < ApplicationMailer
def article_created(current_user,text)
   @current_user=current_user
   @text=text
     mail(to: current_user.email,
      from: "services@ayan.blog.app",
      subject: "Post created",
     
     )
  end
end
