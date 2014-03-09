BuzzStudy::App.controllers :study do

  get '/' do
    @studies = Study.order_by(:value.desc).limit(10)
    render 'index'
  end
end
