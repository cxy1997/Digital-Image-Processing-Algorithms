function [ L, distribution ] = myImhist( fig )
%MYIMHIST creates the histogram of a given image.
%   The function returns the number of pixels for each gray level, 
%   and draws a figure automatically.
    L = 8;
    if L <= max(max(fig))
        L = 256;
    end
    distribution = zeros(L, 1);
    for i = 1:size(fig, 1)
        for j = 1:size(fig, 2)
            distribution(fig(i, j) + 1, 1) = distribution(fig(i, j) + 1, 1) + 1;
        end
    end
    % distribution = table(:, 2);
    distribution = distribution ./ size(fig, 1) ./ size(fig, 2)
    s = size(distribution);
    b = bar(distribution,'FaceColor', 'blue', 'EdgeColor', 'blue','LineWidth',0.6);
    set(gca,'XLim',[0 L]);
    set(gca,'XTick',[0:L/4:L]);
    set(gca,'XTickLabel',[0:L/4:L]);
    ylabel('Occurance');
    colormap(gray);
    c = colorbar('Location', 'southoutside', 'FontSize',10, 'Ticks', 0:64:256, 'TickLabels', {'0', '64', '128', '192', '256'});
    c.Label.String = 'Intensity';
    

end

