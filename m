Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65E6FC087A
	for <lists+linux-omap@lfdr.de>; Fri, 27 Sep 2019 17:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbfI0PXT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 Sep 2019 11:23:19 -0400
Received: from muru.com ([72.249.23.125]:34640 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727140AbfI0PXT (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 27 Sep 2019 11:23:19 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C37D88022;
        Fri, 27 Sep 2019 15:23:50 +0000 (UTC)
Date:   Fri, 27 Sep 2019 08:23:15 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Stephen Kitt <steve@sk2.org>
Cc:     Tero Kristo <t-kristo@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-omap@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk/ti/adpll: allocate room for terminating null
Message-ID: <20190927152315.GE5610@atomide.com>
References: <20190927145737.7832-1-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190927145737.7832-1-steve@sk2.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Stephen Kitt <steve@sk2.org> [190927 15:13]:
> The buffer allocated in ti_adpll_clk_get_name doesn't account for the
> terminating null. This patch adds the extra byte, and switches to
> snprintf to avoid overflowing.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> ---
>  drivers/clk/ti/adpll.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/ti/adpll.c b/drivers/clk/ti/adpll.c
> index fdfb90058504..27933c4e8a27 100644
> --- a/drivers/clk/ti/adpll.c
> +++ b/drivers/clk/ti/adpll.c
> @@ -196,12 +196,13 @@ static const char *ti_adpll_clk_get_name(struct ti_adpll_data *d,
>  	} else {
>  		const char *base_name = "adpll";
>  		char *buf;
> +		size_t size = 8 + 1 + strlen(base_name) + 1 +
> +			      strlen(postfix) + 1;
>  
> -		buf = devm_kzalloc(d->dev, 8 + 1 + strlen(base_name) + 1 +
> -				    strlen(postfix), GFP_KERNEL);
> +		buf = devm_kzalloc(d->dev, size, GFP_KERNEL);
>  		if (!buf)
>  			return NULL;
> -		sprintf(buf, "%08lx.%s.%s", d->pa, base_name, postfix);
> +		snprintf(buf, size, "%08lx.%s.%s", d->pa, base_name, postfix);
>  		name = buf;
>  	}
>  

Thanks for catching this. Maybe just use devm_kasprintf() here?

Regards,

Tony
