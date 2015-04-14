class ArticleMailer < ApplicationMailer
def article_created(user)
  
     mail(to: user.email,
      from: "services@ayan.blog.app",
      subject: "Post created",
      body:"Posted"
     )
  end
end
