# frozen_string_literal: true

require 'spec_helper'

describe TicketForm, type: :model do
  let(:form) { described_class.new(params) }
  let(:params) { valid_params }
  let(:valid_params) do
    {
      "request_number": "09252012-00001",
      "sequence_number": "2421",
      "request_type": "Normal",
      "date_times": {
        "response_due_date_time": "2011/07/13 23:59:59"
      },
      "service_area": {
        "primary_service_area_code": {
          "sa_code": "ZZGL103"
        },
        "additional_service_area_codes": {
          "sa_code": ["ZZL01", "ZZL02", "ZZL03"]
        }
      },
      "excavator": {
        "company_name":     "John Doe CONSTRUCTION",
        "address": "555 Some RD",
        "city": "SOME PARK",
        "state": "ZZ",
        "zip": "55555",
        "crew_onsite": "true"
      },
      "excavation_info": {
        "digsite_info": {
          "well_known_text":   "POLYGON((-81.13390268058475 32.07206917625161,-81.14660562247929 32.04064386441295,-81.08858407706913 32.02259853170128,-81.05322183341679 32.02434500961698,-81.05047525138554 32.042681017283066,-81.0319358226746 32.06537765335268,-81.01202310294804 32.078469305179404,-81.02850259513554 32.07963291684719,-81.07759774894413 32.07090546831167,-81.12154306144413 32.08806865844325,-81.13390268058475 32.07206917625161))"
        }
      }
    }
  end

  context 'for valid form' do
    it 'create ticket' do
      expect { form.save }.to change { Ticket.count }.from(0).to(1)
    end

    it 'create ticket' do
      expect { form.save }.to change { Excavator.count }.from(0).to(1)
    end
  end

  context 'for invalid form' do
    context 'when excavation info missing' do
      it 'didnt save form' do
        valid_params.delete(:excavation_info)
        expect(form.save).to be_falsey
      end
    end

    context 'when excavator info missing' do
      it 'didnt save form' do
        valid_params.delete(:excavator)
        expect(form.save).to be_falsey
      end
    end

    context 'when service_area info missing' do
      it 'didnt save form' do
        valid_params.delete(:service_area)
        expect(form.save).to be_falsey
      end
    end

    context 'when request_number info missing' do
      it 'didnt save form' do
        valid_params.delete(:request_number)
        expect(form.save).to be_falsey
      end
    end

    context 'when sequence_number info missing' do
      it 'didnt save form' do
        valid_params.delete(:sequence_number)
        expect(form.save).to be_falsey
      end
    end

    context 'when request_type info missing' do
      it 'didnt save form' do
        valid_params.delete(:request_type)
        expect(form.save).to be_falsey
      end
    end

    context 'when date_times info missing' do
      it 'didnt save form' do
        valid_params.delete(:date_times)
        expect(form.save).to be_falsey
      end
    end
  end
end
