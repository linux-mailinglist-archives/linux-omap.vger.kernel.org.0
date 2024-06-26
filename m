Return-Path: <linux-omap+bounces-1598-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E77009185B0
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 17:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25C6D1C213B6
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 15:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C3118A952;
	Wed, 26 Jun 2024 15:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YSy1PqCS"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FDE18A940;
	Wed, 26 Jun 2024 15:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719415568; cv=none; b=aJKysowdoz/4em6wOTUjnH/COd9CWPvHOxGVAhimEd+5bYI6z19OctlHWePpaPbmWAz/kt1VsJAzbDux6igIfhGZnD07aJtnmVHNX0jCHdsmYUMOyKd8qc5CLTRjAbt43LPGd0jimdJIM79mA7mBnTjprJovK5B9ahvLXOD6phI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719415568; c=relaxed/simple;
	bh=8nFlI8AphXS8YrVc5+REYOlXOx5w86SZ9M50TjG7eeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWFXGi55N9+Lr42Ho3iwJfk/bjzm0meRhw5XE7HSbfEkDrxeK55B332XRjh3r3ObngVBi/8WPnm2I7vFO/LeprglEP1VfzDdTPAVtAkR8BRgCLI0tx5tktX7MXhtd4B74u5+fHCdOjCoU3tx3k9YNt586EUpYpYERV/0Z+ly/rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YSy1PqCS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73564C116B1;
	Wed, 26 Jun 2024 15:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719415568;
	bh=8nFlI8AphXS8YrVc5+REYOlXOx5w86SZ9M50TjG7eeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YSy1PqCSXZ5Cvo24HD5gpigEvgUMbde0ZDW8qTeQR0dNNq6oJZRpn7W4IMezyqeqF
	 7k9Fuu25KSvrO6kFrF2dJ5P4Ix2NWfwXR8WrbHDXEzl48TyHQUOQ7c/gg1Nd7l/LZ8
	 ESB2eSMLjKdm9kmziW3BeIacUCDSo2AWqW2KJaAL6p9B9HXWYCWcc0tvtIlFn0tge9
	 5iGQCuY77IT6k1yD/nOWCqFhTftMDptaqJCtnSv0n+Dbdzqb5v8SdXwosT31Ddnuil
	 P8YzRHB5UudQldBYpmjyK7GLQrKUj0QnszR+5IMUkUNoQnN8AleO0OuUvy3RyrYjJ2
	 jGTNqEl1OrcWA==
Date: Wed, 26 Jun 2024 16:26:03 +0100
From: Lee Jones <lee@kernel.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 2/2] mfd: omap-usb-tll: use struct_size to allocate tll
Message-ID: <20240626152603.GB2504017@google.com>
References: <20240620-omap-usb-tll-counted_by-v1-0-77797834bb9a@gmail.com>
 <20240620-omap-usb-tll-counted_by-v1-2-77797834bb9a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240620-omap-usb-tll-counted_by-v1-2-77797834bb9a@gmail.com>

On Thu, 20 Jun 2024, Javier Carrasco wrote:

> Use the struct_size macro to calculate the size of the tll, which
> includes a trailing flexible array.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> 
> ---
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

You don't need this H/W to test this our for yourself.

Mock-up the structs in a user-space C-program and print out the sizes.

Please report them all to justify the patch.

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
Lee Jones [李琼斯]

