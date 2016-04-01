moving = imread('testset/k.jpg');
fixed = imread('testset/e.jpg');


optimizer = registration.optimizer.OnePlusOneEvolutionary;

optimizer.MaximumIterations = 1000;


metric = registration.metric.MattesMutualInformation();
metric.UseAllPixels = 0;
metric.NumberOfSpatialSamples = 10000;

movingRegisteredDefault = imregister(moving, fixed, 'similarity', optimizer, metric,'DisplayOptimization', true);

figure, imshowpair(movingRegisteredDefault, fixed)
title('A: Default registration')