BuzzStudy::App.controllers :study do
  
  get '/' do
    @studies = Study.collection.aggregate({"$group" => {"_id" => "$uri", "count" => {"$sum" => 1}}}, {"$sort" => {"count" => -1} })
    render 'index'
  end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  

end
