module PlayersHelper

    def name_and_number(player)
        player.number.to_s + ". " + player.name
    end

end