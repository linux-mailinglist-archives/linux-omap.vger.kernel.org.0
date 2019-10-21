Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5EDDEF96
	for <lists+linux-omap@lfdr.de>; Mon, 21 Oct 2019 16:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbfJUObO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Oct 2019 10:31:14 -0400
Received: from muru.com ([72.249.23.125]:38392 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726977AbfJUObO (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Oct 2019 10:31:14 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 2A172810A;
        Mon, 21 Oct 2019 14:31:48 +0000 (UTC)
Date:   Mon, 21 Oct 2019 07:31:10 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Stephen Kitt <steve@sk2.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] clk/ti/adpll: allocate room for terminating null
Message-ID: <20191021143110.GT5610@atomide.com>
References: <20191019155441.2b1b349f@heffalump.sk2.org>
 <20191019140634.15596-1-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191019140634.15596-1-steve@sk2.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Stephen Kitt <steve@sk2.org> [191019 14:07]:
> The buffer allocated in ti_adpll_clk_get_name doesn't account for the
> terminating null. This patch switches to devm_kasprintf to avoid
> overflowing.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> ---
> Changes since v2:
>   - Move "adpll" into the format string and drop base_name entirely.
> 
> Changes since v1:
>   - Use devm_kasprintf instead of manually allocating the target
>     buffer.

Acked-by: Tony Lindgren <tony@atomide.com>

> ---
>  drivers/clk/ti/adpll.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/clk/ti/adpll.c b/drivers/clk/ti/adpll.c
> index fdfb90058504..bb2f2836dab2 100644
> --- a/drivers/clk/ti/adpll.c
> +++ b/drivers/clk/ti/adpll.c
> @@ -194,15 +194,8 @@ static const char *ti_adpll_clk_get_name(struct ti_adpll_data *d,
>  		if (err)
>  			return NULL;
>  	} else {
> -		const char *base_name = "adpll";
> -		char *buf;
> -
> -		buf = devm_kzalloc(d->dev, 8 + 1 + strlen(base_name) + 1 +
> -				    strlen(postfix), GFP_KERNEL);
> -		if (!buf)
> -			return NULL;
> -		sprintf(buf, "%08lx.%s.%s", d->pa, base_name, postfix);
> -		name = buf;
> +		name = devm_kasprintf(d->dev, GFP_KERNEL, "%08lx.adpll.%s",
> +				      d->pa, postfix);
>  	}
>  
>  	return name;
> -- 
> 2.20.1
> 
