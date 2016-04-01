template = imread('testset/k.jpg');

[bw, maskedTemplate] = segmentImage(template);

i = imread('testset/e.jpg');
[bw, maskedImage] = segmentImage(i);


optimizer = registration.optimizer.OnePlusOneEvolutionary();
optimizer.MaximumIterations = 500;


metric = registration.metric.MattesMutualInformation();
%metric.UseAllPixels = 1;
metric.NumberOfSpatialSamples = 1000;

movingRegisteredDefault = imregister(maskedTemplate, maskedImage, 'similarity', optimizer, metric,'DisplayOptimization', true);

figure, imshowpair(movingRegisteredDefault, maskedImage)
title('A: Default registration')