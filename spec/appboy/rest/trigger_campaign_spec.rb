require 'spec_helper'

describe Appboy::REST::TriggerCampaign do
  let(:http) { double(:http) }

  let :payload do
    {
      app_group_id: :app_group_id,
      campaign_id: :campaign_id,
      recipients: [
        {
          external_user_id: :external_user_id,
          trigger_properties: :trigger_properties,
        },
      ]
    }
  end

  let(:app_group_id) { :app_group_id }

  subject do
    described_class.new
  end

  before { subject.http = http }

  it 'makes an HTTP call to the trigger campaign endpoint' do
    expect(http).to receive(:post).with('/campaigns/trigger/send', payload)

    subject.perform(
      app_group_id,
      campaign_id: :campaign_id,
      external_user_id: :external_user_id,
      trigger_properties: :trigger_properties,
    )
  end
end
