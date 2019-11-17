
$(function(){
  $('#entry_period').datepicker({
    changeYear: true,
    changeMonth: true,
    duration: 300,
    showAnim: 'slideDown',
    dateFormat: 'yy/mm/dd',
    showOn: 'button',
    monthNames: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"]
  });

  $('#work_period').datepicker({
    changeYear: true,
    changeMonth: true,
    duration: 300,
    showAnim: 'slideDown',
    dateFormat: 'yy/mm/dd',
    showOn: 'button',
    monthNames: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"]
  });
})