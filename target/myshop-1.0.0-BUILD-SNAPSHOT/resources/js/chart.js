$(function(){

	Chart.defaults.global.pointHitDetectionRadius = 1;
	Chart.defaults.global.customTooltips = function(tooltip) {};
	Chart.defaults.global.scaleFontFamily = 'Lato';
					
	var chartData = {
		'id' : 'stats_chart',
		'data' : {
			'labels' : ["09-24","09-25"],
			'datasets' : []
		}
	};

		chartData.data.datasets.push(
		{
			'label' : "페이지뷰",
			'fillColor' : "rgba(253, 175, 177,0.3)",
			'strokeColor' : "rgba(253, 175, 177,1)",
			'pointColor' : "rgba(253, 175, 177, 1)",
			'pointStrokeColor' : "#eee",
			'pointHighlightFill' : "#fff",
			'pointHighlightStroke' : "rgba(151,187,205,1)",
			'data' : ["0","0"]
		}
	);
		chartData.data.datasets.push(
		{
			'label' : "방문자",
			'fillColor' : "rgba(253, 175, 177,0.3)",
			'strokeColor' : "rgba(253, 175, 177,1)",
			'pointColor' : "rgba(252, 95, 100,1)",
			'pointStrokeColor' : "#eee",
			'pointHighlightFill' : "#fff",
			'pointHighlightStroke' : "rgba(151,187,205,1)",
			'data' : ["0","0"]
		}
	);
	
	var ctx2 =  $('#stats_chart').get(0).getContext("2d");
	var myLine = new Chart(ctx2).Line(chartData.data, {
		'responsive' : true,
		'customTooltips' : function(tooltip){
			var tooltipEl = $("._chartjs_tooltip");

			if(!tooltip){
				tooltipEl.css({
					opacity : 0
				});
				return;
			}
			tooltipEl.removeClass('above below');
			tooltipEl.addClass(tooltip.yAlign);

			var innerHtml = '';
			if(typeof tooltip.labels != 'undefined'){
				for(var i = tooltip.labels.length - 1; i >= 0; i--){
					innerHtml += [
						'<div class="chartjs-tooltip-section">',
						'<span class="chartjs-tooltip-key" style="background-color:' + tooltip.legendColors[i].fill + '"></span>',
						'<span class="chartjs-tooltip-value">' + tooltip.labels[i] + '</span>',
						'</div>'
					].join('');
				}
			}else{
				innerHtml += [
					'<div class="chartjs-tooltip-section">',
					'<span class="chartjs-tooltip-value">' + tooltip.text + '</span>',
					'</div>'
				].join('');
			}

			tooltipEl.html(innerHtml);
			tooltipEl.css({
				'opacity' : 1,
				'left' : tooltip.x + 'px',
				'top' : tooltip.y + 'px',
				'fontFamily' : 'Lato',
				'fontSize' : tooltip.fontSize,
				'fontStyle' : tooltip.fontStyle,
				'position' : 'absolute',
				'background' : '#fff'
			});
		}
	});
})
