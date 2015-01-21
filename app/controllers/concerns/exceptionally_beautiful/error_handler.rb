module ExceptionallyBeautiful
  module ErrorHandler
    def error_handler(status_code)
      @error = ExceptionallyBeautiful::Error.new(status_code)

      respond_to do |format|
        format.html do
          render :template => "#{ExceptionallyBeautiful.controller}/#{ExceptionallyBeautiful.action}",
                 :status => @error.status_code,
                 :layout => ExceptionallyBeautiful.layout
        end
        format.json { render :json => { :status => @error.status_code, :error => @error.message } }
      end
    end
  end
end
