class MembersController < ApplicationController
skip_before_filter :authorize, :only => [:new, :create]

  # GET /members
  # GET /members.json
  def index
    @members = Member.order(:last_name)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @members }
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @member = Member.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @member }
    end
  end

# GET /members/1
  # GET /members/1.json
  def whoami
    @member = Member.find(session[:member_id])
    @invitations = CliqInvitation.where(:recipient_email => @member.email, :is_approved => false)

    respond_to do |format|
      format.html { render action: "edit" }
      format.json { render :json => {:member => @member, :invitations => @invitations} }
    end
  end

  # GET /members/new
  # GET /members/new.json
  def new
    @member = Member.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/1/edit
  def edit
    if (session[:member_id] == params[:id])
      @member = Member.find(params[:id])
    else
      redirect_to :action => "show", :id => params[:id] #TODO: fix ugly URL and find a way to hide id from URL
    end
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(params[:member])

    respond_to do |format|
      if @member.save
        format.html { redirect_to members_url, notice: "Member #{@member.email} was successfully created." }
        format.json { render json: @member, status: :created, location: @member }
      else
        format.html { render action: "new" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.json
  def update
    @member = Member.find(params[:id])

    respond_to do |format|
      if @member.update_attributes(params[:member])
        format.html { redirect_to whoami_url, notice: "Member #{@member.first_name} was successfully updated." }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :ok }
    end
  end
end
