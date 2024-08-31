Config = {}

Config.RestroomProps = {
    ['prop_toilet_01'] = {  -- Prop hash or model name
        action = 'useRestroom',
        stressRelief = 10,
        hygieneIncrease = 15,
        coolDown = 60,  -- Cooldown in seconds
        animation = 'WORLD_HUMAN_PEE',  -- Animation for the action
    },
    ['prop_sink_02'] = {
        action = 'washHands',
        hygieneIncrease = 10,
        coolDown = 30,
        animation = 'WORLD_HUMAN_WASH_HANDS',
    },
    -- Add more props and their corresponding actions and effects
}
