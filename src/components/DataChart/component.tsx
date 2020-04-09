import React from 'react';
import {curveCatmullRom} from 'd3-shape';
import {XYPlot, LineSeries, VerticalGridLines, HorizontalGridLines, XAxis, YAxis} from 'react-vis';

export interface DataChartProps {
  data: {
    x: number,
    y: number
  }[][],
}


export const DataChart: React.FC<DataChartProps> = (props: DataChartProps) => {

  const {data} = props

  return (
    <div>
     <XYPlot width={1000} height={600}>
      <HorizontalGridLines style={{stroke: '#B7E9ED'}} />
      <VerticalGridLines style={{stroke: '#B7E9ED'}} />
      <XAxis
        title="X Axis"
        style={{
          line: {stroke: '#ADDDE1'},
          ticks: {stroke: '#ADDDE1'},
          text: {stroke: 'none', fill: '#6b6b76', fontWeight: 600}
        }}
      />
      <YAxis title="Y Axis" />

      {console.log('specific data:', data[0])}
      <LineSeries
        className="first-series"
        data={data}
        style={{
          strokeLinejoin: 'round',
          strokeWidth: 4
        }}
      />
      <LineSeries
        className="third-series"
        curve={'curveMonotoneX'}
        data={data[1]}
        strokeDasharray="7, 3"
      />
      <LineSeries
        className="fourth-series"
        curve={curveCatmullRom.alpha(0.5)}
        data={data[2]}
      />
    </XYPlot>
    </div>
  );
}

