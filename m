Return-Path: <linux-omap+bounces-1605-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A360918EBE
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 20:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DC7C1F246AC
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 18:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21A51922CB;
	Wed, 26 Jun 2024 18:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jsPIeUiL"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3F9190698;
	Wed, 26 Jun 2024 18:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719427411; cv=none; b=lN8ehGKFkVxlEW6pL+tv6LoDt1EjSMw0Vyu2u67nD81keRuS6zd0YKLwYYUHZu0XS/WnlQFT6N9BjznDcK7Ou++xxtoMpIRRVySs26QFwun4HkXoErLvmYaPKkQGiwfSD8T1EMrOsVKyxjBPc6uRJ2k6M76TvRqK9MdUUaY7LW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719427411; c=relaxed/simple;
	bh=bTysRdZ18j1pz0kLr1idoPNYovOG2Qz2zyGh37sg4Sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mj83ExGFkVw8T0qjTIJV5PBZIXelJUZi4jqisJtrcW76MzpPCRoN4bwaRxk5ObKNO2KmDW3FAnOCQX33maLy0aDuSR6AxukNlWdUdL/nAwxtrzpG4/vTPGFmdX2ms17kW5kSy9oXF/L3QXNPh+r0I57+sjXFQ7vaOxSpId7nnCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jsPIeUiL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361D0C116B1;
	Wed, 26 Jun 2024 18:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719427411;
	bh=bTysRdZ18j1pz0kLr1idoPNYovOG2Qz2zyGh37sg4Sk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jsPIeUiLko5aSNrZd1UqGBIK0KkKu9RhKo9Ayc+GePzmdyIb1wCshV32jmu0g0vOA
	 7/wcnXcXEWdoAIR/kmcXO4vRx7aDcKT42kmhAmqJ7uKaUmjvK2vxoTksae/OYQ8+yW
	 Nbj8NaJP1Ia3QLMY0YqDmA0mwkz8VD2F/RRqX7lzsM16ShBeC7nAOufK2FbbPfT6O7
	 16ZMbyimROFn7PVqKi5oBFSOAXOnVsBc56KIe1wolY54kSROby4koemDzPDdVeOcbz
	 aJFF+j8k+sYqoZwoASk0VCqbKo6cJO2/osIOtnsGWNMrSVV32+bSueiUR+H+EOL7B0
	 plXPOl15JMXsw==
Date: Wed, 26 Jun 2024 11:43:30 -0700
From: Kees Cook <kees@kernel.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 2/2] mfd: omap-usb-tll: use struct_size to allocate tll
Message-ID: <202406261121.2FFD65647@keescook>
References: <20240620-omap-usb-tll-counted_by-v1-0-77797834bb9a@gmail.com>
 <20240620-omap-usb-tll-counted_by-v1-2-77797834bb9a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620-omap-usb-tll-counted_by-v1-2-77797834bb9a@gmail.com>

On Thu, Jun 20, 2024 at 11:22:34PM +0200, Javier Carrasco wrote:
> Use the struct_size macro to calculate the size of the tll, which
> includes a trailing flexible array.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> 
> ---

I would actually include this entire bit below in the main commit log.
It's the core of the "why" for this patch.

> The memory allocation used to be carried out in two steps:
> 
> tll = devm_kzalloc(dev, sizeof(struct usbtll_omap), GFP_KERNEL);
> tll->ch_clk = devm_kzalloc(dev, sizeof(struct clk *) * tll->nch,
>                            GFP_KERNEL);
> 
> Until commit 16c2004d9e4d ("mfd: omap-usb-tll: Allocate driver data at once")
> turned that into the current allocation:
> 
> tll = devm_kzalloc(dev, sizeof(*tll) + sizeof(tll->ch_clk[nch]),
>                    GFP_KERNEL);
> 
> That has surprised me at first glance because I would have expected
> sizeof(tll->ch_clk[nch]) to return the size of a single pointer, not
> being equivalent to 'sizeof(struct clk *) * nch'.
> 
> I might be missing/misunderstanding something here because the commit
> is not new, and the error should be noticeable. Moreover, I don't have
> real hardware to test it. Hence why I didn't mark this patch as a fix.
> 
> I would be pleased to get feedback about this (why it is right as it is,
> or if that is actually a bug).

Yeah, I would include:

Fixes: commit 16c2004d9e4d ("mfd: omap-usb-tll: Allocate driver data at once")

Because that was a clear mistake. I suspect they were intending to do
this, which I've seen as a code pattern from time to time:

	devm_kzalloc(dev, offsetof(typeof(*tll), ch_clk[nch]));

But as Jann points out, "nch" is so small:

drivers/mfd/omap-usb-tll.c:81:#define OMAP_REV2_TLL_CHANNEL_COUNT	2
drivers/mfd/omap-usb-tll.c:82:#define OMAP_TLL_CHANNEL_COUNT		3
drivers/mfd/omap-usb-tll.c:220:         nch = OMAP_TLL_CHANNEL_COUNT;
drivers/mfd/omap-usb-tll.c:224:         nch = OMAP_REV2_TLL_CHANNEL_COUNT;

struct usbtll_omap {
        void __iomem    *base;
        int             nch;            /* num. of channels */
        struct clk      *ch_clk[];      /* must be the last member */
};

That this allocation was asking for 4 + 4 + 4 * 1 (12) instead of:
	4 + 4 + 4 * OMAP_TLL_CHANNEL_COUNT (20)
or
	4 + 4 + 4 * OMAP_REV2_TLL_CHANNEL_COUNT (16)

the latter would have ended up in the same kmalloc bucket (12 would be
rounded up to 16), but with the ARM alignment issue, the minimum bucket
size would effectively be tied to CONFIG_ARM_L1_CACHE_SHIFT, which could
be as low as 5: 32 bytes minimum, so no bug to be had in the real
world.

Reviewed-by: Kees Cook <kees@kernel.org>

-Kees

> ---
>  drivers/mfd/omap-usb-tll.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
> index a091e5b0f21d..5f25ac514ff2 100644
> --- a/drivers/mfd/omap-usb-tll.c
> +++ b/drivers/mfd/omap-usb-tll.c
> @@ -230,8 +230,7 @@ static int usbtll_omap_probe(struct platform_device *pdev)
>  		break;
>  	}
>  
> -	tll = devm_kzalloc(dev, sizeof(*tll) + sizeof(tll->ch_clk[nch]),
> -			   GFP_KERNEL);
> +	tll = devm_kzalloc(dev, struct_size(tll, ch_clk, nch), GFP_KERNEL);
>  	if (!tll) {
>  		pm_runtime_put_sync(dev);
>  		pm_runtime_disable(dev);
> 
> -- 
> 2.40.1
> 

-- 
Kees Cook

