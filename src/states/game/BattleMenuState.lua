--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

BattleMenuState = Class{__includes = BaseState}

function BattleMenuState:init(battleState)
    self.battleState = battleState
    
    self.battleMenu = Menu {
        x = VIRTUAL_WIDTH - 64,
        y = VIRTUAL_HEIGHT - 64,
        width = 64,
        height = 64,
        displayOnly = false,
        items = {
            {
                text = 'Fight',
                onSelect = function()
                    gStateStack:pop()
                    gStateStack:push(TakeTurnState(self.battleState))
                end
            },
            {
                text = 'Run',
                onSelect = function()
                    gSounds['run']:play()
                    
                    -- pop battle menu
                    gStateStack:pop()

                    -- show a message saying they successfully ran, then fade in
                    -- and out back to the field automatically
                    gStateStack:push(BattleMessageState('You fled successfully!',
                        function()

                        -- fade in black
                        gStateStack:push(FadeInState({
                            r = 0, g = 0, b = 0
                        }, 1,
                        function()

                            -- resume field music
                            gSounds['battle-music']:stop()
                            gSounds['field-music']:play()
                            
                            -- pop off the battle state and back into the field
                            gStateStack:pop()
                            gStateStack:push(FadeOutState({
                                r = 0, g = 0, b = 0
                            }, 1, function() 
                            end))
                        end))
                    end))
                            end
            }
        }
    }
end

function BattleMenuState:update(dt)
    self.battleMenu:update(dt)
end

function BattleMenuState:render()
    self.battleMenu:render()
end