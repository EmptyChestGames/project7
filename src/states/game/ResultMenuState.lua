--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

ResultMenuState = Class{__includes = BaseState}

function ResultMenuState:init(takeTurnState, health, atk, def, spd)

    self.takeTurnState = takeTurnState
    
    self.resultMenu = Menu {
        x = VIRTUAL_WIDTH - 128,
        y = VIRTUAL_HEIGHT - 64,
        width = 128,
        height = 64,
        displayOnly = true,
        items = {
            {
                text = 'HP: ' .. tostring(self.takeTurnState.playerPokemon.HP - health) .. '+' .. health .. '=' .. tostring(self.takeTurnState.playerPokemon.HP)
            },
            {
                text = 'ATK: ' .. tostring(self.takeTurnState.playerPokemon.attack - atk) .. '+' .. atk .. '=' .. tostring(self.takeTurnState.playerPokemon.attack)
            },
            {
                text = 'DEF: ' .. tostring(self.takeTurnState.playerPokemon.defense - def) .. '+' .. def .. '=' .. tostring(self.takeTurnState.playerPokemon.defense)
            },
            {
                text = 'SPD: ' .. tostring(self.takeTurnState.playerPokemon.speed - spd) .. '+' .. spd .. '=' .. tostring(self.takeTurnState.playerPokemon.speed)
            }
        }
    }
end

function ResultMenuState:update(dt)
    self.resultMenu:update(dt)
end

function ResultMenuState:render()
    self.resultMenu:render()
end