require 'rails_helper'

describe ArticlesController do
  describe '#index' do
    subject {get :index}
    it 'should return success response' do
        subject
      expect(response).to have_http_status(:ok)
    end

    it 'should return proper json format' do
        subject
      Article.recent.each_with_index do |article, index|
        expect(json_data[index]['attributes']).to eq({
                                                       'title' => article.title,
                                                       'content' => article.content,
                                                       'slug' => article.slug
                                                     })
      end
    end

    it 'should return articcles in the proper order' do
        old_article = create :article
        newer_article = create :article
        subject
        expect(json_data.first['id']).to eq(newer_article.id.to_s)
        expect(json_data.last['id']).to eq(old_article.id.to_s)
    end
  end
end
