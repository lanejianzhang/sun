module ApplicationHelper
  
  def error_msg(mo)
    if mo.errors.any?
      full_msg = ""
      mo.errors.full_messages.each do |msg|
        full_msg = full_msg + "<li>" + msg + "</li>"
      end
      raw "<div id=\"error_explanation\"><h2>#{pluralize(mo.errors.count, 'error')}</h2><ul>#{full_msg}</ul></div>"
    end
  end
  
  def title(_title)
    content_for :title do
      raw "<title>#{_title}</title>"
    end
  end

  def metadesc(_metadesc)
    content_for :metadesc do
      raw "<meta name=\"description\" content=\"#{_metadesc.gsub(/\r\n/,' ').gsub(/['"]/, ' ')}\" />"
    end
  end

  def summary(_summary)
    content_for :summary do
      _summary.gsub(/\r\n/,' ').gsub(/['"]/," ")
    end
  end
  
  def notice
    msg = ''
    msg = content_tag(:div, flash[:error], :id => 'error') if flash[:error]    
    msg += content_tag(:div, flash[:notice], :id => 'notice') if flash[:notice]
    raw msg
  end

  def validate_form(form_id)
    content_for :javascript do
      javascript_include_tag "jquery.validate"
    end
    raw "<script type=\"text/javascript\">$(document).ready(function(){$('##{form_id}').validate();});</script>"
  end
end
