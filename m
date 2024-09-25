Return-Path: <linux-omap+bounces-2246-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECFA9855F1
	for <lists+linux-omap@lfdr.de>; Wed, 25 Sep 2024 10:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E83331F261E9
	for <lists+linux-omap@lfdr.de>; Wed, 25 Sep 2024 08:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A79C41598E9;
	Wed, 25 Sep 2024 08:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="eLc97JeQ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4185139579;
	Wed, 25 Sep 2024 08:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727254649; cv=none; b=ldRd3BHuIri4R5GxMBwpLKnenM6os8H5IxiaRsLJZi7Taz9/MmY461+vlw0SXfpN9XLdSeZpWIzpfcky3kll7QnuX7FoQqbdAGbwud9yfiVWdqAXM+JtJlMlRPo1VAUHUaka+4kd5voFxCfAPzFD+6IOpbbNuioXeHP+OSLwgFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727254649; c=relaxed/simple;
	bh=eo2S88LGbOk65bCaErC1aJ2fAv7jCTnyq2xyYtx6pTs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jLDlTYY5TayUtrE2xbULAepMAA26KYh1MMjT1iE1qT9o4+UlEXPA2aZcEd8So0j1bmf+UJ/WCsfVFjLeEHWcQLA7uxJ3tdj13NSWXijh8tFNSSXlmD8RaGoPGGW3nqO0+cXYL1v59PPm9K3OIAEsKW7M5E76WQQi0VGCl+EU480=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=eLc97JeQ; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=UPVAbGUWQRK3gMTBkFDlAu38DoluSQAsHZS2y6KLxhE=; b=eLc97JeQNRfIY1Stp1hZzHTrKD
	ZS6ZDfdsO2ZIpVTO9Go5aWPsWtqz7OqSPHoZh1t8M1kRs7sq+Y0K255A3KCMakd5EI8sPCcgRvwYw
	QFPRZIak9EhAO8DlE8kkmgfzxfq7d1Htsb1PHfiZibOmH76gk0LDD7AbFacnE5ONtOHS6KJD2GiMu
	Y4U+YhSm3xkNY1+q4fGRuhxwpcvEkXbjV/EUUmV0G0Hixua/O3X3H3mzMfAcEMNOK0Gj9iEeIKxlE
	zq31du59ytUZ64Ml/kY6TniKGTsCrl/skohmSaFJPQjNpDzHrywGB7qlXx065ukZ2LVDxrXdIKqjm
	rNu150NQ==;
Date: Wed, 25 Sep 2024 10:57:22 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-omap@vger.kernel.org,
 linux-clk@vger.kernel.org, Paul Walmsley <paul@pwsan.com>, Tony Lindgren
 <tony@atomide.com>
Subject: Re: clk mess on omap4460 with mpu clock
Message-ID: <20240925105722.7921af47@akair>
In-Reply-To: <ZvLuMJxv8a0h9gpq@shell.armlinux.org.uk>
References: <20240603234139.280629b2@aktux>
	<CAMuHMdWU74DsWEZtZQJctQQog=9UCG_1LZu5yWvyxx0Zw4LQow@mail.gmail.com>
	<20240903143357.2532258b@akair>
	<CAMuHMdWF4G5Uon1=6TMzBogN2CX8EuiVBMuCPtAAMPNa-DtiOw@mail.gmail.com>
	<20240903192203.1dddbf0d@akair>
	<ZtdQ+Ay9DKAooahN@shell.armlinux.org.uk>
	<20240923140447.60c5efff@akair>
	<ZvLuMJxv8a0h9gpq@shell.armlinux.org.uk>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Tue, 24 Sep 2024 17:52:00 +0100
schrieb "Russell King (Oracle)" <linux@armlinux.org.uk>:

> On Mon, Sep 23, 2024 at 02:04:47PM +0200, Andreas Kemnade wrote:
> > The main question what bothers me is whether we have
> > some real problems behind it. The warning message is just an
> > indicator of something odd which was already odd before the message
> > was introduced.  
> 
> Indeed.
> 
> > I have seen something working with some u-boot and some other not,
> > so things might not get properly initialized... 
> > 
> > So the way forward is to check whether that registration is really
> > needed at:
> > https://elixir.bootlin.com/linux/v6.11/source/drivers/bus/ti-sysc.c#L2380
> > If yes, then
> > a) increade the size of the name in the clk subsystem or
> > b) workaround like
> > https://elixir.bootlin.com/linux/v6.11/source/drivers/bus/ti-sysc.c#L353
> >  
> 
> Or we make the arrays larger - at the moment, the struct is a nice
> round 64 bytes in 32-bit systems - 6 pointers (24 bytes) plus 24 plus
> 16 = 64. For 64-bit systems, this is 88 bytes.
> 
of course that is a nice size, but since the devid string is not
directly visible, so chances are high, that an innocent looking
commit might mess it up.

> An alternative approach may be this (untested, not even compile
> tested):
> 
so this looks like my favourite approach.

> diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
> index 2f83fb97c6fb..222f0ccf9fc0 100644
> --- a/drivers/clk/clkdev.c
> +++ b/drivers/clk/clkdev.c
> @@ -149,8 +149,7 @@ void clkdev_add_table(struct clk_lookup *cl,
> size_t num) 
>  struct clk_lookup_alloc {
>  	struct clk_lookup cl;
> -	char	dev_id[MAX_DEV_ID];
> -	char	con_id[MAX_CON_ID];
> +	char	strings[0];
>  };
>  
>  static struct clk_lookup * __ref
> @@ -158,60 +157,36 @@ vclkdev_alloc(struct clk_hw *hw, const char
> *con_id, const char *dev_fmt, va_list ap)
>  {
>  	struct clk_lookup_alloc *cla;
> -	struct va_format vaf;
> -	const char *failure;
>  	va_list ap_copy;
> -	size_t max_size;
> -	ssize_t res;
> +	size_t size;
> +	char *strp;
>  
> -	cla = kzalloc(sizeof(*cla), GFP_KERNEL);
> +	size = sizeof(*cla);
> +	if (con_id)
> +		size += 1 + strlen(con_id);
> +	if (dev_fmt) {
> +		va_copy(ap_copy, ap);
> +		size += 1 + vsprintf(NULL, dev_fmt, ap_copy);
                
size += 1 + vsnprintf(NULL, 0, dev_fmt, ap_copy);

works for me.
> +		va_end(ap_copy);
> +	}
> +
or setting size to some big enough value here...

without that, even earlycon is silent.

Regards,
Andreas

