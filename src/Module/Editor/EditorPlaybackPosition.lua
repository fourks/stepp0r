

--- ======================================================================================================
---
---                                                 [ Editor Playback Position Sub Module ]


--- ------------------------------------------------------------------------------------------------------
---
---                                                 [ Sub-Module Interface ]


function Chooser:__init_playback_position()
end
function Chooser:__activate_playback_position()
    self:__register_playback_position_observer()
end
function Chooser:__deactivate_playback_position()
    self:__unregister_playback_position_observer()
end

--- ------------------------------------------------------------------------------------------------------
---
---                                                 [ Lib ]

function Editor:__register_playback_position_observer()
    self.playback_position_observer:register('stepper', function (line)
        if self.is_not_active then return end
        self:callback_playback_position(line)
    end)
end

function Editor:__unregister_playback_position_observer()
    self.playback_position_observer:unregister('stepper' )
end

--- updates the point that should blink on the launchpad
--
-- will be hooked in by the playback_position observable
--
function Editor:callback_playback_position(pos)
    if self.pattern_idx ~= pos.sequence then return end
    self:__clean_up_old_playback_position()
    local line = pos.line
    if (line <= self.page_start) then return end
    if (line >= self.page_end)   then return end
    local xy = self:line_to_point(line)
    if not xy then return end
    self:__set_playback_position(xy[1],xy[2])
end

function Editor:__set_playback_position(x,y)
    self.pad:set_matrix(x,y,self.color.stepper)
    self.playback_position_last_x = x
    self.playback_position_last_y = y
    self.removed_old_playback_position = true
end

function Editor:__clean_up_old_playback_position()
    if (self.removed_old_playback_position) then
        self:__render_matrix_position(
            self.playback_position_last_x,
            self.playback_position_last_y
        )
        self.removed_old_playback_position = nil
    end
end
