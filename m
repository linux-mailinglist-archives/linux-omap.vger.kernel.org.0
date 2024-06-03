Return-Path: <linux-omap+bounces-1449-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 161198D8802
	for <lists+linux-omap@lfdr.de>; Mon,  3 Jun 2024 19:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46E831C21910
	for <lists+linux-omap@lfdr.de>; Mon,  3 Jun 2024 17:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7116A13776F;
	Mon,  3 Jun 2024 17:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="MtUH63WK"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D82E1366;
	Mon,  3 Jun 2024 17:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717436052; cv=none; b=m5MwcP++9wcfXwoXFAx9UNdfN4clujgrs85IzEkPqhqsxvCWmyNVcXrQcLGkrjbSmPmsMBsM1TlQssM5dTOI/SM/aBqEn2HNCz57ZtRMWxBJeiD3kZsH1onn9/mHa4QqQDYU7CnlkSWtfBwsgJNCVqRXvwZj+5jJq29bBfRAj0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717436052; c=relaxed/simple;
	bh=Vmbt9KzFewlZSGp5aUezBOG+S/S5YfblqG1/uOXLIRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r1RM1EIVyW4fRNuv7awyYm8M+7WAHpQoMw7+0HmowurYvNo9tRRRsAQSqpkPPgWIPVdv2yR//12g2yWnRbPxpLJKMTdDoQBLtyKKGG2JZDoI3ZQ40eH1Tta2ZTQ2bdLigxv0A+gM3SZn/ixMS98UVPEcP5Cog6XE9MGfm/14O0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=MtUH63WK; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=JJKLC6j+7nSFX2BbGj4LPWho00h8gTNfACK7iQXjk/E=; b=MtUH63WKHlwqWjhx
	VqzzI8I2gZ9AEecWFZhNvyrgxIEBJLQ9uUTG9J6jYr7Jh7h+24P6QBhk+oyuetQCYO7qGq2HcKT1h
	Kale0Xcuzs86KWNJhb3uTTz1MMPLwkpR0opNdow9ZuMaLG9tKLFTnn41A9l/Jk1IZT5Uslx8ydBYn
	/EkFU6ymRPu42cecF6+zQYpnvT31iEFuqmGNgiqWrVXDWKhy2w3DmOUT5OhU/ML4zKnfQWHZli2Fj
	5fP01jD0Ht0pYn9TXu4dNu22E1KqX6QDi83mcAguOl6H65t/bGhqwd2PBJ1JTM5mwzq85/yW7LsGz
	gJNjeIGSWmlzjDsQ2g==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1sEBZM-003zxe-1B;
	Mon, 03 Jun 2024 17:34:04 +0000
Date: Mon, 3 Jun 2024 17:34:04 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: aaro.koskinen@iki.fi, jmkrzyszt@gmail.com
Cc: tony@atomide.com, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: omap1: Remove unused struct 'dma_link_info'
Message-ID: <Zl3-jIT38s5_I15q@gallifrey>
References: <20240505202214.623612-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20240505202214.623612-1-linux@treblig.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 17:33:13 up 26 days,  4:47,  1 user,  load average: 0.01, 0.02, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* linux@treblig.org (linux@treblig.org) wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> I think the last use of this was removed somewhere
> around the two:
> Commit 755cbfd8cf89 ("ARM: OMAP2+: Drop sdma interrupt handling for
> mach-omap2")
> and
> Commit 16630718ee46 ("ARM: omap1: move plat/dma.c to mach/omap-dma.c")
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Ping

> ---
>  arch/arm/mach-omap1/omap-dma.c | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/arch/arm/mach-omap1/omap-dma.c b/arch/arm/mach-omap1/omap-dma.c
> index 9ee472f8ead12..f091f78631d09 100644
> --- a/arch/arm/mach-omap1/omap-dma.c
> +++ b/arch/arm/mach-omap1/omap-dma.c
> @@ -59,19 +59,6 @@ static struct omap_dma_dev_attr *d;
>  static int enable_1510_mode;
>  static u32 errata;
>  
> -struct dma_link_info {
> -	int *linked_dmach_q;
> -	int no_of_lchs_linked;
> -
> -	int q_count;
> -	int q_tail;
> -	int q_head;
> -
> -	int chain_state;
> -	int chain_mode;
> -
> -};
> -
>  static int dma_lch_count;
>  static int dma_chan_count;
>  static int omap_dma_reserve_channels;
> -- 
> 2.45.0
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

