Return-Path: <linux-omap+bounces-4181-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A241B2105A
	for <lists+linux-omap@lfdr.de>; Mon, 11 Aug 2025 17:56:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86371683FC7
	for <lists+linux-omap@lfdr.de>; Mon, 11 Aug 2025 15:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619F92E426C;
	Mon, 11 Aug 2025 15:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="eI3vf8ut"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7782DE1FE;
	Mon, 11 Aug 2025 15:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754926013; cv=none; b=cjTKSjYnUeGYVuBazulQMdcYcA8KQsBEMgCv/TuOHMTgfnhEMr/JcgBTwhOEAsHSUYAJtqo6f476aerodJHNvQeEelgFI16G0PZ1U0TZ15R3FGTqe7hXsauj0gtITLMkI29OMmAB05E55OSPzasSSaGCqb71p9epPwcfWAskg04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754926013; c=relaxed/simple;
	bh=oZjSLsnOXOCW/QNPAEkDEC9Z/y/pdmjgkqli94Ckk2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HOUn4NtLEEU5Sr9yROpLVYRp2/RN5IEsKf3ZuuxAVDwfut0j8a8bjQvOoyIbDoa57faEihUru9afDZi8+0kvACW5MkCKXn8Vamm51eQCX8x2h9WXYmVQE/j/qIGyy5nSqsfs1CRVPTrjNo9YSs00rxpHBXNVbrhkozZjJANxzxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=eI3vf8ut; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=OQusFukqhitT3LSxslVxlfEDgo7kN0aw4meYJgI5oek=; b=eI3vf8utFxTWIarm9k3CG7eO6v
	ogSovJhoIApfhVgExgULrnzaDoLUxtqammtz2lkSyG6FTTMeRpzymM2UMxfsZQzB5LOR+/8C4HFOy
	TjUc3IJWPZmlIEngNb9UtE6NEys02ii2OKpbaptSv/ESOKFggy+/OJ+JEw8o64Nd/U+x2BrNPRTu+
	nuKaUcDgaE09SW1plFh2wP5rtwtlnUn3r4IEU1EGGZfErcHFX9iFMu53YXtQ/lNocWjHVEzOm0/dq
	2ID1hmKcgk42aMllTNVy3MUU7D76Rl1Tr6sErhuozYOU2y6VHmgak4FvyTSg7IkcVvSP8mu2oSDog
	HSiBAKGw==;
Date: Mon, 11 Aug 2025 16:53:58 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] bus: ti-sysc: Fix potential double free in
 sysc_add_named_clock_from_child()
Message-ID: <20250811165358.79b3128c@akair>
In-Reply-To: <20250804120403.97959-1-linmq006@gmail.com>
References: <20250804120403.97959-1-linmq006@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

Am Mon,  4 Aug 2025 20:04:03 +0800
schrieb Miaoqian Lin <linmq006@gmail.com>:

> The devm_get_clk_from_child() function uses device-managed resources
> that are automatically cleaned up. The clk_put() call after
> devm_get_clk_from_child() is redundant and
> may lead to double-free issues.
> 
> Fixes: a54275f4ab20 ("bus: ti-sysc: Add quirk handling for external optional functional clock")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/bus/ti-sysc.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> index 9f624e5da991..5441b0739faa 100644
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -362,7 +362,6 @@ static int sysc_add_named_clock_from_child(struct sysc *ddata,
>  	cl->clk = clock;
>  	clkdev_add(cl);
>  
> -	clk_put(clock);
>  
>  	return 0;
>  }
I understand the double-free issue, but I have some questions to make
sure I understand it correctly what we are doing here. So lets ask the
possibly stupid questions and check assumptions:

- clk_hw hardware still lives after clk_put(), so we do not have
  problems normally here after that put when we do not remove the
  device?

- With your patch the put is delayed, so things live longer. So why
we do not use devm_clk_put() or avoid using devres at all here?

Regards,
Andreas

