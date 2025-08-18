class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
  end

  def ot
  end

  def appointment
  end
  
  def Confirmed
  end
   
  def collection
  end 

  def requests
  end 

  def settings
  end 

  def day
  end 

  def week
  end 

  def ehrsetting
  end 

  def intake
  end

  def practicefusiondefaultform
  end

  def reviewquestion
  end

  def task
  end

  def mytask
  end

  def tool
  end
  
  def unassignedtask
  end

  def rxchange
  end 

  def labresults
  end

  def refillrequests
  end

  def imagingresults
  end

  def chart
  end
  
  def scheduled
  end

  def recentpatients
  end

  def patientrecoad
  end

  def timeline
  end

  def profile
  end

  def recoaddate
  end

  def displaysetting
  end

  def report
  end

  def patientlistreport
  end

  def savepatient
  end

  def homepage
  end

  def sendintakeform
  end

  def message
  end

  def messagesent
  end

  def messagearchive
  end

  def appointment_modal
    render partial: 'pages/appointment' # This will use app/views/pages/_appointment.html.erb
  end

end
