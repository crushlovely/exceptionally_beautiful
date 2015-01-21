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
    [403, 404, 422, 500, 502].each do |error_code|
      it "responds with translation content for #{error_code}" do
        visit "/errors/#{error_code}"
        expect(page).to have_content(ExceptionallyBeautiful::Error.new(error_code).message)
      end
    end
  end
end
