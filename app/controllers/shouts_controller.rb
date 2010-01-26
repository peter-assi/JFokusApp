class ShoutsController < ApplicationController
  # GET /shouts
  # GET /shouts.xml
  def index
    @shouts = Shout.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shouts }
    end
  end

  # GET /shouts/1
  # GET /shouts/1.xml
  def show
    @shout = Shout.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shout }
    end
  end

  # GET /shouts/new
  # GET /shouts/new.xml
  def new
    @shout = Shout.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shout }
    end
  end

  # GET /shouts/1/edit
  def edit
    @shout = Shout.find(params[:id])
  end

  # POST /shouts
  # POST /shouts.xml
  def create
    @shout = Shout.new(params[:shout])

    respond_to do |format|
      if @shout.save
        flash[:notice] = 'Shout was successfully created.'
        format.html { redirect_to(@shout) }
        format.xml  { render :xml => @shout, :status => :created, :location => @shout }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shout.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shouts/1
  # PUT /shouts/1.xml
  def update
    @shout = Shout.find(params[:id])

    respond_to do |format|
      if @shout.update_attributes(params[:shout])
        flash[:notice] = 'Shout was successfully updated.'
        format.html { redirect_to(@shout) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shout.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shouts/1
  # DELETE /shouts/1.xml
  def destroy
    @shout = Shout.find(params[:id])
    @shout.destroy

    respond_to do |format|
      format.html { redirect_to(shouts_url) }
      format.xml  { head :ok }
    end
  end
end
