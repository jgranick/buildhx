YUI.add("yuidoc-meta", function(Y) {
   Y.YUIDoc = { meta: {
    "classes": [
        "CSSPlugin",
        "Ease",
        "Timeline",
        "Tween"
    ],
    "modules": [
        "TweenJS"
    ],
    "allModules": [
        {
            "displayName": "TweenJS",
            "name": "TweenJS",
            "description": "The TweenJS Javascript library provides a simple but powerful tweening interface. It allows you to chain tweens and\nactions together to create complex sequences. For example:<br/>\nTween.get(target).wait(500).to({alpha:0,visible:false},1000).call(onComplete);<br/>\nThis tween will wait 0.5s, tween the target's alpha property to 0 over 1s, set it's visible to false, then call the onComplete function."
        }
    ]
} };
});