function draw_table()
{
	$("#results").empty();
	$.getJSONuncached = function (url)
	{
		return $.ajax(
		{
			url: url,
			type: 'GET',
			cache: false,
			success: function (html)
			{
				$("#results").append(html);
				//select_row();
			}
		});
	};
	$.getJSONuncached("/get/html")
};

function select_row()
{
	$("#menuTable tbody tr[id]").click(function ()
	{
		$(".selected").removeClass("selected");
		$(this).addClass("selected");
		var section = $(this).prevAll("tr").children("td[colspan='3']").length - 1;
		var entree = $(this).attr("id") - 1;
		delete_row(section, entree);
	})
};

function deletebook(id)
{
	//$("#delete").click(function ()
	//{
		$.ajax(
		{
			url: "/post/delete",
			type: "POST",
			data:
			{
				id: id
			},
			cache: false,
			success: function (html)
			{
				draw_table();
			}
		})
	//})
};

$(document).ready(function ()
{
	draw_table();
});