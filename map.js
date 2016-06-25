var rainbow_red = new Rainbow(); 
rainbow_red.setNumberRange(0, 10);
rainbow_red.setSpectrum('e0e0e0', 'red');

var rainbow_blue = new Rainbow(); 
rainbow_blue.setNumberRange(0, 10);
rainbow_blue.setSpectrum('e0e0e0', 'blue');


function color_map(date){
	for(state in state_dict){
		color_state(state, date, 0);
	}
}


document.getElementById("submit").addEventListener("click", function(){
	color_map(
		new Date(2016, Number(document.getElementById("month").value)-1, Number(document.getElementById("day").value)));
});


document.getElementById("animation").addEventListener("click", function(){
	var date = new Date(2016, 0, 1);
	today = (new Date()).getTime();
	
	step = function(){
		color_map(date);
		console.log(date);
		if(date<=today){
			setTimeout(step, 100);
			date.setDate(date.getDate()+1);		
		}
	}
	
	step();
	
})





function color_state(state, date, count){
	state_id = state_dict[state];
	var sum_diff = 0;
	var number = 0;
	thirtydays = 86400*1000*30;
	for(i=0; i<data.length; i++){
		var day = data[i]["start"].split('-');
		var polldate = new Date(Number(day[0]),Number(day[1]) -1 ,Number(day[2]))
		if((data[i]["state"]==state) && (date-polldate<thirtydays) && (date>polldate)){
			sum_diff = sum_diff+data[i]["clinton"]-data[i]["trump"];
			number=number+1;
		}
	}
	if(number != 0){
		average = Math.round(sum_diff/number);
		alpha = Math.exp(-count/6);
		take_color = Math.round(alpha*average + (1-alpha)*default_color[state_id]);
		if(take_color>=0){
			document.getElementById(state_id).setAttribute("fill", "#"+rainbow_blue.colourAt(take_color));
		}else if(take_color<0){
			document.getElementById(state_id).setAttribute("fill", "#"+rainbow_red.colourAt(-take_color));
		}
	}
	
	if((number==0) &&(date>new Date("2016/01/01"))){
		count=count+1;
		color_state(state, date-thirtydays, count);
	}
	
	if((number == 0) && (date<=new Date("2016/01/01"))){
		old = default_color[state_id];
		if(old>=0){
			document.getElementById(state_id).setAttribute("fill", "#"+rainbow_blue.colourAt(old));
		}else if(old<0){
			document.getElementById(state_id).setAttribute("fill", "#"+rainbow_red.colourAt(-old));
		}
	}
}











