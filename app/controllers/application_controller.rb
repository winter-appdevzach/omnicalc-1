class ApplicationController < ActionController::Base

  def blank_square_form

    render ({:template => "calculation_templates/square_form.html.erb"})
  end

  def calculate_square 
    @num = params.fetch("elephant").to_f
    @square_of_num = @num * @num
    render ({:template => "calculation_templates/square_results.html.erb"})
  end

  def blank_random_form 

    render ({:template => "calculation_templates/random_form.html.erb"})

  end

  def calculate_random
    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result = rand(@lower..@upper)

    render ({:template => "calculation_templates/rand_results.html.erb"})
  end


  def blank_square_root_form
    render ({:template => "calculation_templates/square_root_form.html.erb"})
  end



  def calculate_square_root
    @number = params.fetch("user_number").to_f
    @square_root_of_number = @number ** 0.5
    render ({:template => "calculation_templates/square_root_results.html.erb"})
  end

  def blank_payment_form
    render ({:template =>"calculation_templates/payment_form.html.erb"})
  end

  def calculate_payment
    @apr = params.fetch("user_apr").to_f
    @apr = @apr / 100 / 12
    @percentageapr = @apr.to_s(:percentage, {:precision => 4})
    @years = params.fetch("user_years").to_f
    @years = @years * 12
    @principal = params.fetch("user_pv").to_f
    # @currencyprincipal = @principal.to_s(:currency)

    @numerator = @apr * @principal
    @denumerator = (1 - (1+@apr) ** ((-1)*@years))
    @payment = @numerator / @denumerator
    @currencypayment = @payment.to_s(:currency)

    render ({:template =>"calculation_templates/payment_results.html.erb"})
  end

end
