module ApplicationHelper
  def title(_title)
    content_for :title do
      _title
    end
  end

  def metadesc(_metadesc)
    content_for :metadesc do
      _metadesc.gsub(/\r\n/,' ').gsub(/['"]/," ")
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
  end

  def validate_form(form_id)
    content_for :javascript do
      javascript_include_tag "jquery.validate"
    end
    raw "<script type=\"text/javascript\">$(document).ready(function(){$('##{form_id}').validate();});</script>"
  end
end
