module Espago::MasterpassHelper
  def espago_masterpass_button(data)
    render :partial => 'espago_masterpass/masterpass_button', :locals => { :data => Espago::Masterpass.prepare_form(data)}
  end

  def espago_masterpass_pairing_button(data)
    render :partial => 'espago_masterpass/masterpass_pairing_button', :locals => { :data => Espago::Masterpass.prepare_pairing_form(data)}
  end

    def espago_masterpass_precheckout_button(data)
    render :partial => 'espago_masterpass/masterpass_precheckout_button', :locals => { :data => Espago::Masterpass.prepare_precheckout_form(data)}
  end
end
