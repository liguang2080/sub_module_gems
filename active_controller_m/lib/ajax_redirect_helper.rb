module AjaxRedirectHelper
  def ajax_redirect_to(path)
    render :js => "$.utils.redirect_to('#{path}')"
  end

  def ajax_error(ar)
    render :js => ar_error_show(ar, :format => "js")
  end


  def ajax_error_show_or_redirect(ar)
    if ar.errors.present?
      render :js => ar_error_show(ar, :format => "js")
    else
      ajax_redirect_to(yield)
    end
  end

  # active_error 的两种展示格式
  def ar_error_show(ar, options)
    opt = {:format => "html", :field_error => true}.merge(options)
    return "" if ar.errors.empty?
    if opt.format == "js"
      "$('#error_response').html(\"#{ar.errors.to_human_errors.wrap_by_exp('div')}\");$('#error_response').scrollTo()"
    else
      ar.errors.to_human_errors.wrap_by_exp('div')
    end
  end

end
