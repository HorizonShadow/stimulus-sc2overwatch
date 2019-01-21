class GamePlayersController < ApplicationController
  before_action :set_game_player, only: [:show, :edit, :update, :destroy]

  def recently_reported
    @game_players = GamePlayer.where(is_accused: true)
    render :index
  end

  # GET /game_players
  # GET /game_players.json
  def index
    @game_players = GamePlayer.all
  end

  # GET /game_players/1
  # GET /game_players/1.json
  def show
  end

  # GET /game_players/new
  def new
    @game_player = GamePlayer.new
  end

  # GET /game_players/1/edit
  def edit
  end

  # POST /game_players
  # POST /game_players.json
  def create
    @game_player = GamePlayer.new(game_player_params)

    respond_to do |format|
      if @game_player.save
        format.html { redirect_to @game_player, notice: 'Game player was successfully created.' }
        format.json { render :show, status: :created, location: @game_player }
      else
        format.html { render :new }
        format.json { render json: @game_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_players/1
  # PATCH/PUT /game_players/1.json
  def update
    respond_to do |format|
      if @game_player.update(game_player_params)
        format.html { redirect_to @game_player, notice: 'Game player was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_player }
      else
        format.html { render :edit }
        format.json { render json: @game_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_players/1
  # DELETE /game_players/1.json
  def destroy
    @game_player.destroy
    respond_to do |format|
      format.html { redirect_to game_players_url, notice: 'Game player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_player
      @game_player = GamePlayer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_player_params
      params.require(:game_player).permit(:is_accused, :winner, :evidence, :clan, :race, :mmr, :division, :server_rank, :global_rank, :apm, :team, :color, :guilty_count, :innocent_count, :game_id, :player_id)
    end
end
