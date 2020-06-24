# frozen_string_literal: true

require 'spec_helper'

feature 'Tickets' do
  let!(:ticket) { create(:ticket) }
  let!(:excavator) { create(:excavator, ticket: ticket) }

  before { visit root_path }

  scenario 'open tickets path' do
    expect(page.has_text?(ticket.request_number)).to be_truthy
    expect(page.has_text?(ticket.sequence_number)).to be_truthy
    expect(page.has_text?(ticket.request_type)).to be_truthy
    expect(page.has_text?(ticket.response_due_date_time)).to be_truthy
    expect(page.has_text?(ticket.well_known_text)).to be_falsey
  end

  scenario 'visit to ticket' do
    click_link(I18n.t(:go_to_ticket, ticket_id: ticket.id))

    expect(page).to have_link(I18n.t(:go_back), href: root_path )
    expect(page).to have_css('#map')
    expect(page.has_text?(excavator.company_name)).to be_truthy
    expect(page.has_text?(excavator.full_address)).to be_truthy
    expect(page.has_text?(excavator.crew_on_site)).to be_truthy
  end
end
