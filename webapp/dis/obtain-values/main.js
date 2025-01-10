/*
 * Taken from https://github.com/Tpaefawzen/dis.web/blob/main/js/dis.js
 *
 * js/dis.js
 *
 * Copyright (C) 2022 Tpaefawzen
 *
 * This file is part of dis.web.
 * 
 * dis.web is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
 * 
 * dis.web is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details.
 * 
 * You should have received a copy of the GNU Affero General Public License along with dis.web. If not, see <https://www.gnu.org/licenses/>.
 */
const DisMath={
  get BASE(){return 3;},
  get DIGITS(){return 10;},
  get MIN_VALUE(){return 0;},
  get MAX_VALUE(){return DisMath.BASE**DisMath.DIGITS-1;},
  
  get isTenTrits(){return (x)=>
    Number.isInteger(x)&&DisMath.MIN_VALUE<=x&&x<=DisMath.MAX_VALUE;
  },
  
  get increment(){
    const {isTenTrits,MAX_VALUE,MIN_VALUE}=DisMath;
    return (x)=>isTenTrits(x)?(x+1)%(MAX_VALUE+1-MIN_VALUE):undefined;
  },
  get rotateRight(){
    const {isTenTrits,BASE,DIGITS}=DisMath;
    return function(x){
      if(!isTenTrits(x)) return undefined;
      return Math.floor(x/BASE)+x%BASE*(BASE**(DIGITS-1));
    }
  },
  get subtract(){
    const {isTenTrits,BASE,DIGITS}=DisMath;
    return function(x,y){
      if(!isTenTrits(x)||!isTenTrits(y)) return undefined;
      return Array(DIGITS).fill([x,y]).map(([x,y],i)=>[
        Math.floor(x/(BASE**i)%BASE),
        Math.floor(y/(BASE**i)%BASE)
      ]).map(([x,y],i)=>(BASE+x-y)%BASE*(BASE**i)
      ).reduce((d1,d2)=>d1+d2);
    }
  },
}; // const DisMath

/**
 * == Main ==
 */
const eApp = document.getElementById("app");

let values = new Set([0, 33, 42, 62, 94, 95, 123, 124, 125]);

for ( let i = 0; i < 3; i++ ) {
  // header.
  const eHeader = document.createElement("h2");
  eHeader.textContent = `Calculation ${i+1}`; // 0-indexed to 1-indexed
  eApp.appendChild(eHeader);

  // Actual calculation then body paragraphs.
  let newValues = new Set(values);
  values.forEach(x => {
    values.forEach(y => {
      const calcValue = DisMath.subtract(x, y);

      // Already available on memory.
      if ( newValues.has(calcValue) ) return;

      // paragraph please.
      const appendThis = document.createElement("p");
      const text = `${x} - ${y} = ${calcValue}`;
      appendThis.textContent = text;
      eApp.appendChild(appendThis);

      // Finally
      newValues.add(calcValue);
    })
  });

  values = newValues;
  // if ( values.size
}
