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
    @annonce = Annonce.new(annonce_params)

    # tab = {
    #   'Prix min' => '0',
    #   'Prix max' => '0',
    #   '0' => '0',
    #   '250' => '1',
    #   '500' => '2',
    #   '750' => '3',
    #   '1000' => '4',
    #   '1500' => '5',
    #   '2000' => '6',
    #   '2500' => '7',
    #   '3000' => '8',
    #   '3500' => '9',
    #   '4000' => '10',
    #   '4500' => '11',
    #   '5000' => '12',
    #   '5500' => '13',
    #   '6000' => '14',
    #   '6500' => '15',
    #   '7000' => '16',
    #   '7500' => '17',
    #   '8000' => '18',
    #   '8500' => '19',
    #   '9000' => '20',
    #   '9500' => '21',
    #   '10000' => '22',
    #   '11000' => '23',
    #   '12000' => '24',
    #   '13000' => '25',
    #   '14000' => '26',
    #   '15000' => '27',
    #   '17500' => '28',
    #   '20000' => '29',
    #   '22500' => '30',
    #   '25000' => '31',
    #   '27500' => '32',
    #   '30000' => '33',
    #   '32500' => '34',
    #   '35000' => '35',
    #   '37500' => '36',
    #   '40000' => '37',
    #   '42500' => '38',
    #   '45000' => '39',
    #   '47500' => '40',
    #   '50000' => '41',
    #   'plus de 50000' => '42'
    # }

    respond_to do |format|
      if @annonce.save
        format.html { redirect_to @annonce, notice: 'Annonce was successfully created.' }
        format.json { render :show, status: :created, location: @annonce }
        # prixMini = tab[annonce_params["prixMini"]]
        # prixMaxi = tab[annonce_params["prixMaxi"]]
        puts "http://www.leboncoin.fr/#{@annonce.typeProduit.downcase}/offres/#{@annonce.region.downcase}/?f=a&th=1&location=#{@annonce.codePostal}"
      else
        format.html { render :new }
        format.json { render json: @annonce.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /annonces/1
  # PATCH/PUT /annonces/1.json
  def update

    # tab = {
    #   'Prix min' => '0',
    #   'Prix max' => '0',
    #   '0' => '0',
    #   '250' => '1',
    #   '500' => '2',
    #   '750' => '3',
    #   '1000' => '4',
    #   '1500' => '5',
    #   '2000' => '6',
    #   '2500' => '7',
    #   '3000' => '8',
    #   '3500' => '9',
    #   '4000' => '10',
    #   '4500' => '11',
    #   '5000' => '12',
    #   '5500' => '13',
    #   '6000' => '14',
    #   '6500' => '15',
    #   '7000' => '16',
    #   '7500' => '17',
    #   '8000' => '18',
    #   '8500' => '19',
    #   '9000' => '20',
    #   '9500' => '21',
    #   '10000' => '22',
    #   '11000' => '23',
    #   '12000' => '24',
    #   '13000' => '25',
    #   '14000' => '26',
    #   '15000' => '27',
    #   '17500' => '28',
    #   '20000' => '29',
    #   '22500' => '30',
    #   '25000' => '31',
    #   '27500' => '32',
    #   '30000' => '33',
    #   '32500' => '34',
    #   '35000' => '35',
    #   '37500' => '36',
    #   '40000' => '37',
    #   '42500' => '38',
    #   '45000' => '39',
    #   '47500' => '40',
    #   '50000' => '41',
    #   'plus de 50000' => '42'
    # }

    respond_to do |format|
      if @annonce.update(annonce_params)
        format.html { redirect_to @annonce, notice: 'Annonce was successfully updated.' }
        format.json { render :show, status: :ok, location: @annonce }
        # prixMini = tab[annonce_params["prixMini"]]
        # prixMaxi = tab[annonce_params["prixMaxi"]]
        puts "http://www.leboncoin.fr/#{@annonce.typeProduit.downcase}/offres/#{@annonce.region.downcase}/?f=a&th=1&location=#{@annonce.codePostal}"
      else
        format.html { render :edit }
        format.json { render json: @annonce.errors, status: :unprocessable_entity }
      end
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
      params.require(:annonce).permit(:titre, :typeProduit, :prixMini, :prixMaxi, :region, :codePostal)
    end
end
