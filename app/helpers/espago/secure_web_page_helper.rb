module Espago::SecureWebPageHelper
  def espago_secure_web_page_form(data)
    render :partial => 'espago_secure_web_page/form', :locals => { :data => Espago::SecureWebPage.prepare_form(data)}
  end
end
