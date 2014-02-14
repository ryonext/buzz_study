BuzzStudy::App.controllers :study do

  get '/' do
    @studies = Study.order_by(:count.desc).limit(20)
    render 'index'
  end
end
