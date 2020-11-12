if (document.querySelector(".ratings")){
var stars = document.querySelector(".ratings").children;
var ratingValue = document.getElementById("rating-value");
var ratingValueDisplay = document.getElementById("rating-value-display");

var index;

for(let i=0; i<stars.length; i++){
	console.log(stars.length)
	stars[i].addEventListener("mouseover",function(){
		for(let j=0; j<stars.length; j++){
			console.log(stars.length)
			stars[j].classList.remove("fa-star");
			stars[j].classList.add("fa-star-o");
		}

		for(let j=0; j<=i; j++){
			console.log(stars.length)
			stars[j].classList.remove("fa-star-o");
			stars[j].classList.add("fa-star");
		}
	})

	stars[i].addEventListener("click",function(){
		ratingValue.value = i+1;
		ratingValueDisplay.textContent = ratingValue.value;
		index = i;
	})

	stars[i].addEventListener("mouseout",function(){
		for(let j=0; j<stars.length; j++){
			stars[j].classList.remove("fa-star");
			stars[j].classList.add("fa-star-o");
		}

		for(let j=0; j<=index; j++){
			stars[j].classList.remove("fa-star-o");
			stars[j].classList.add("fa-star");
		}
	})
}
}