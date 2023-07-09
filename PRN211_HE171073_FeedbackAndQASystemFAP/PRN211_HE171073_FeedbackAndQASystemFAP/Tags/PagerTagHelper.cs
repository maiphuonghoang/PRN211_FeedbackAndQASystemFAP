using Microsoft.AspNetCore.Razor.TagHelpers;
namespace PRN211_HE171073_FeedbackAndQASystemFAP.Tags
{
    [HtmlTargetElement("pager")]
    public class PagerTagHelper : TagHelper
    {
        //thuộc tính
        public int TotalPage { get; set; }
        public int CurrentPage { get; set; }
        public string Url { get; set; }
        public string ActiveClass { get; set; }
        public override void Process(TagHelperContext context, TagHelperOutput output)
        {
            if (TotalPage > 1)
            {
                output.TagName = "div";
                output.TagMode = TagMode.StartTagAndEndTag;//cả đóng cả mở
                for (int i = 1; i <= TotalPage; i++)
                {
                    if (i == CurrentPage)
                        output.Content.AppendHtml($"<a href = {Url}/{i} class={ActiveClass}>{i}</a>");
                    else
                        output.Content.AppendHtml($"<a href = {Url}/{i}>{i}</a>");
                }
            }

        }
    }
}

