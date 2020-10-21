require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '#validations' do
  it 'should test that the factory is valid' do
    expect(FactoryBot.create :article).to be_valid
  end

  it 'should validate the presence of the title' do
    article = build(:article, title: '')
    expect(article).not_to be_valid
    expect(article.errors.messages[:title]).to include("can't be blank")
  end

  it 'should validate the presence of the content' do
    article = build(:article, content: '')
    expect(article).not_to be_valid
    expect(article.errors.messages[:content]).to include("can't be blank")
  end

  it 'should validate the presence of the slug' do
    article = build(:article, slug: '')
    expect(article).not_to be_valid
    expect(article.errors.messages[:slug]).to include("can't be blank")
  end

  it 'should validate that the slug is unique' do
    article = create(:article)
    inva_Article = build(:article, slug: article.slug)
    expect(inva_Article).not_to be_valid
  end
end

  describe '.recent' do
    it 'should list articles base on recent method' do
      old_article = create :article
      newer_arclie = create :article

      expect(described_class.recent).to eq(
        [newer_arclie, old_article ]
      )
      old_article.update_column :created_at, Time.now
      expect(described_class.recent).to eq(
        [old_article, newer_arclie ]
      )
    end
  end
end