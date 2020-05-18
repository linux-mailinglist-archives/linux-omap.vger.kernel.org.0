Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD42C1D6F76
	for <lists+linux-omap@lfdr.de>; Mon, 18 May 2020 05:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbgERDzd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 17 May 2020 23:55:33 -0400
Received: from smtprelay0007.hostedemail.com ([216.40.44.7]:47420 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726680AbgERDzd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Sun, 17 May 2020 23:55:33 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id 73227180A733A;
        Mon, 18 May 2020 03:55:32 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:2899:3138:3139:3140:3141:3142:3150:3352:3622:3865:3866:3868:3873:4250:4321:4605:5007:10004:10400:10848:11026:11232:11658:11914:12048:12297:12438:12555:12740:12760:12895:12986:13069:13311:13357:13439:14096:14097:14181:14659:14721:21080:21627:21990:30029:30054:30070:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:2,LUA_SUMMARY:none
X-HE-Tag: elbow17_131843f5ffd49
X-Filterd-Recvd-Size: 1675
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf06.hostedemail.com (Postfix) with ESMTPA;
        Mon, 18 May 2020 03:55:31 +0000 (UTC)
Message-ID: <b8a08623cc0f858e0f961240a0cf610d32c6816d.camel@perches.com>
Subject: Re: [PATCH] clk/ti/adpll: Add a NULL check for devm_kasprintf()
From:   Joe Perches <joe@perches.com>
To:     Xu Wang <vulab@iscas.ac.cn>, t-kristo@ti.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-omap@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Date:   Sun, 17 May 2020 20:55:30 -0700
In-Reply-To: <1589773618-3658-1-git-send-email-vulab@iscas.ac.cn>
References: <1589773618-3658-1-git-send-email-vulab@iscas.ac.cn>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 2020-05-18 at 03:46 +0000, Xu Wang wrote:
> devm_kasprintf() may fail, so we should better add a NULL check
> and propagate an error on failure.

You didn't compile this.

All the return values of this function are already checked.

> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
> ---
>  drivers/clk/ti/adpll.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/ti/adpll.c b/drivers/clk/ti/adpll.c
> index bb2f283..f18a672 100644
> --- a/drivers/clk/ti/adpll.c
> +++ b/drivers/clk/ti/adpll.c
> @@ -196,6 +196,8 @@ static const char *ti_adpll_clk_get_name(struct ti_adpll_data *d,
>  	} else {
>  		name = devm_kasprintf(d->dev, GFP_KERNEL, "%08lx.adpll.%s",
>  				      d->pa, postfix);
> +		if (!name)
> +			return -ENOMEM;
>  	}
>  
>  	return name;

