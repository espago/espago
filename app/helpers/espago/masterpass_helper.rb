module Espago::MasterpassHelper
  def espago_masterpass_button(data)
    render :partial => 'espago_masterpass/masterpass_button', :locals => { :data => Espago::Masterpass.prepare_form(data)}
  end
end
