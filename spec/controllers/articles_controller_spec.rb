require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
 describe 'login as user' do
   login_user
     it 'creates an user' do
       expect do
       user = FactoryGirl.create(:user)
         end.to change(User, :count).by(1)
        end
      it "should have a current_user" do
           expect(subject.current_user).not_to be_nil
      end
   end

   describe 'Create article ' do
    login_user
     #context 'create article with valid attributes' do
      #   it 'creates an article' do
       #     post:create ,article: attributes_for(:article)
        #     expect(Article.count).to eq(1)
         #  end
      #end
         context 'Show flash error message on invalid attributes' do
          it 'article with no text' do
              
              post:create, article: attributes_for(:article,title:nil)
              expect{Article.count}.to_not change{Article.count}
             end
         end
    end

     describe 'Listing of articles' do
      login_user
         it 'all articles are listed' do
           article = Article.create(attributes_for(:article))
            get:index
            expect(assigns(:articles)).to eq([article])
          end
      end
   describe 'Update article  after creation' do
   login_user
   context 'Update article with valid attributes' do
    it 'Update article'do 
        article = Article.create(attributes_for(:article))
        put :update, id: article.to_param ,:article => attributes_for(:article, text: "Text Changed")
        article.reload
       # expect(Article.first.title).to eq("Title Changed")
        expect(article.text).to eq("Text Changed")
     end
     end
   end
   describe 'Delete article 'do
       
      login_user
       it 'delete article ' do
           article=Article.create!(attributes_for(:article))
           expect do
          delete :destroy,{:id => article.to_param}       
          end.to change(Article,:count).by(-1)
         end
       
       it "redirects to the posts list" do
      article = Article.create!(attributes_for(:article))
      delete :destroy, {:id => article.to_param}
      expect(response).to redirect_to(articles_url)
    end
   end
end
