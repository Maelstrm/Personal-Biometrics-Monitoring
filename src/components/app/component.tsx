import React from 'react';
import { DataChart } from '../DataChart';
import {mockDataChartData} from '../DataChart/mockDataChartData';


export const App = () => {
  return (
   <div>
       <DataChart data={mockDataChartData}/>
   </div>
  );
}

