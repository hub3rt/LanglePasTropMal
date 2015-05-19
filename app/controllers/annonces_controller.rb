class AnnoncesController < ApplicationController
  before_action :set_annonce, only: [:show, :edit, :update, :destroy]

  # GET /annonces
  # GET /annonces.json
  def index
    @annonces = Annonce.all
  end

  # GET /annonces/1
  # GET /annonces/1.json
  def show
  end

  # GET /annonces/new
  def new
    @annonce = Annonce.new
  end

  # GET /annonces/1/edit
  def edit
  end

  # POST /annonces
  # POST /annonces.json
  def create
    @terme = params["terme"]
    @typeProduit = params["typeProduit"]
    @region = params["region"]
    @codePostal = params["codePostal"]
    @url = "http://www.leboncoin.fr/#{@typeProduit.downcase}/offres/#{@region.downcase}/?f=a&th=1&q=#{@terme.downcase}&location=#{@codePostal}"
    @newAnnonce = {
      :titre => params["annonce"]["titre"],
      :urlRecherche => @url
    }
    @annonce = Annonce.new(@newAnnonce)
    if (Annonce.validate_zip_code(@codePostal))
      respond_to do |format|
        if @annonce.save
          format.html { redirect_to @annonce, notice: 'Annonce was successfully created.' }
          format.json { render :show, status: :created, location: @annonce }
          # puts "http://www.leboncoin.fr/#{@typeProduit.downcase}/offres/#{@region.downcase}/?f=a&th=1&location=#{@codePostal}"
          # HardWorker.perform_async("http://www.leboncoin.fr/#{@annonce.typeProduit.downcase}/offres/#{@annonce.region.downcase}/?f=a&th=1&location=#{@annonce.codePostal}")
        else
          format.html { render :new }
          format.json { render json: @annonce.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:error] = "Le champ code postal doit être vide ou comporter exactement 5 chiffres"
      render :new
    end
  end

  # PATCH/PUT /annonces/1
  # PATCH/PUT /annonces/1.json
  def update
    @terme = params["terme"]
    @typeProduit = params["typeProduit"]
    @region = params["region"]
    @codePostal = params["codePostal"]
    @url = "http://www.leboncoin.fr/#{@typeProduit.downcase}/offres/#{@region.downcase}/?f=a&th=1&q=#{@terme.downcase}&location=#{@codePostal}"
    @updatedAnnonce = {
      :titre => params["annonce"]["titre"],
      :urlRecherche => @url
    }
    if (Annonce.validate_zip_code(@codePostal))
      respond_to do |format|
        if @annonce.update(@updatedAnnonce)
          format.html { redirect_to @annonce, notice: 'Annonce was successfully updated.' }
          format.json { render :show, status: :ok, location: @annonce }
          # puts "http://www.leboncoin.fr/#{@annonce.typeProduit.downcase}/offres/#{@annonce.region.downcase}/?f=a&th=1&location=#{@annonce.codePostal}"
          # HardWorker.perform_async("http://www.leboncoin.fr/#{@annonce.typeProduit.downcase}/offres/#{@annonce.region.downcase}/?f=a&th=1&location=#{@annonce.codePostal}")
        else
          format.html { render :edit }
          format.json { render json: @annonce.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:error] = "Le champ code postal doit être vide ou comporter exactement 5 chiffres"
      render :new
    end
  end

  # DELETE /annonces/1
  # DELETE /annonces/1.json
  def destroy
    @annonce.destroy
    respond_to do |format|
      format.html { redirect_to annonces_url, notice: 'Annonce was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_annonce
      @annonce = Annonce.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def annonce_params
      params.require(:annonce).permit(:titre, :urlRecherche)
    end
end
