module ApplicationHelper

	def flash_messages
		if flash[:error]
			fl = content_tag :div, flash[:error], :id => "flash_message", :class => "fragile do_destroy", :style => "display:none;"
			flash[:error] = nil
		elsif flash[:notice]
			fl = content_tag :div, flash[:notice], :id => "flash_message", :class => "fragile do_destroy"#, :style => "display:none;"
			flash[:notice] = nil
		end

		fl
	end

	def logged_in?
		!@current_user.blank?
	end

	def ymd(_datetime)
		return if _datetime.blank?
		_datetime.localtime.strftime("%Y-%m-%d %H:%M:%S")
	end

	def nl2br(_string)
		return '' if _string.blank?
		_string.gsub(/[\r]/, '<br>')
	end

  def coderay(_string)
		return '' if _string.blank?
    _string.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do
      _string = CodeRay.scan($3, $2).div(:css => :class)
    end
  end

end
