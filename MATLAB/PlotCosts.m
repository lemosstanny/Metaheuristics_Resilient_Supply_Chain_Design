function PlotCosts(pop)

    Costs=[pop.Cost];
    
    plot(Costs(1,:),Costs(2,:),'r*','MarkerSize',8);
    xlabel('Costs ($)');
    ylabel('Lead Time (Days)');
    grid on;

end