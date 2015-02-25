require 'spec_helper'

feature 'something' do
  scenario 'non existent path' do
    visit '/bad_route'
    expect(page.status_code).to eq(404)
  end

  scenario 'server error' do
    visit '/tests' # TestsController#index is fixed to raise an error
    expect(page.status_code).to eq(500)
  end

  describe 'default errors' do
    ExceptionallyBeautiful.errors.each do |error_code|
      describe "#{error_code} error messaging" do
        let(:error) { ExceptionallyBeautiful::Error.new(error_code) }
        before { visit "/errors/#{error_code}" }

        it 'responds with the correct status code' do
          expect(page.status_code).to eq(error_code)
        end

        it 'includes the error title' do
          expect(page).to have_content(error.title)
        end

        it 'includes the error message rendered in Markdown' do
          expect(page.html).to include(ExceptionallyBeautiful::MarkdownRenderer.new(error.message).render)
        end
      end
    end
  end
end
