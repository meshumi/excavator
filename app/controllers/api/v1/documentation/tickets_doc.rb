# frozen_string_literal: true

module Api::V1::Documentation::TicketsDoc
  def create_doc
    api :POST, "/v1/tickets", I18n.t(:post_tickets_desc)
    error code: 422, desc: I18n.t(:unprocessable_entity, scope: :errors)
    param 'request_number', String, required: true
    param 'sequence_number', String, required: true
    param 'request_type', String, required: true
    param 'date_times', Hash do
      param 'response_due_date_time', String, required: true
    end
    param 'service_area', Hash do
      param 'primary_service_area_code', Hash do
        param'sa_code', String, required: true
      end
      param 'additional_service_area_codes', Hash do
        param 'sa_code', Array, required: false
      end
    end
    param 'excavation_info', Hash do
      param 'digsite_info', Hash do
        param 'well_known_text', String, required: true
      end
    end
    param 'excavator', Hash do
      param'company_name', String, required: true
      param 'address', String, required: true
      param 'city', String, required: true
      param 'state', String, required: true
      param 'zip', String, required: true
      param 'crew_onsite', String, required: true
    end

    example <<-EOS
      POST /api/v1/usetickets
      *Headers*
      Accept: application/json

      *Response*
      {
        "data": {
          "id": "17",
          "type": "tickets",
          "attributes": {
            "request_number": "09252012-00001",
            "sequence_number": "2421",
            "request_type": "Normal",
            "response_due_date_time": "2011-07-13T23:59:59.000Z",
            "primary_area_sa_code": "ZZGL103",
            "additional_area_sa_codes": [
              "ZZL01",
              "ZZL02",
              "ZZL03"
            ],
            "well_known_text": "POLYGON((-81.13390268058475 32.07206917625161,-81.14660562247929 32.04064386441295,-81.08858407706913 32.02259853170128,-81.05322183341679 32.02434500961698,-81.05047525138554 32.042681017283066,-81.0319358226746 32.06537765335268,-81.01202310294804 32.078469305179404,-81.02850259513554 32.07963291684719,-81.07759774894413 32.07090546831167,-81.12154306144413 32.08806865844325,-81.13390268058475 32.07206917625161))"
        },
        "relationships": {
          "excavator": {
            "data": {
              "id": "17",
              "type": "excavators"
            }
          }
        }
      },
      "included": [
        {
          "id": "17",
          "type": "excavators",
          "attributes": {
            "company_name": "John Doe CONSTRUCTION",
            "address": "555 Some RD",
            "city": "SOME PARK",
            "state": "ZZ",
            "zip": "55555",
            "crew_on_site": true
          },
          "relationships": {
            "ticket": {
              "data": {
                "id": "17",
                "type": "tickets"
              }
            }
          }
        }
      ]
    }
    EOS
  end
end
