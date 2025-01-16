Return-Path: <linux-omap+bounces-3129-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DA8A13AA5
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jan 2025 14:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 716DC188BDE2
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jan 2025 13:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B98241F37C6;
	Thu, 16 Jan 2025 13:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=valla.it header.i=@valla.it header.b="ISBMi7gl"
X-Original-To: linux-omap@vger.kernel.org
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B9F1DE3C2
	for <linux-omap@vger.kernel.org>; Thu, 16 Jan 2025 13:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737033302; cv=pass; b=Z6EYvVmYCin7XybwxC5nLgNi5qKycbCK0JI8CTaXru/nURRr4csxnHYAyO3nWc7XFWflcNCbSdaaj90yAg7PhemkQkjbKK7V15SkWH+prOSpw6yf8/2r417cbp/Q6d5VZ4aQ5NXs031a0a2rm7RBhi/KnQr2zwxLJYhwHIye+tg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737033302; c=relaxed/simple;
	bh=y+b3MbpKg998YOh+8hcaheF9u7y8tE6HmG7mjeRFtBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RTvMPhs6GaqnziEYVyYYOC3WFZwZPLRtt+7h1VsAT2TKGPgUpzuH8bh952oiyamZELgaYRukH/MEpxVFrxP+PTJ0QC/1mhXCu32XpyIcNBUq1DoQn3VyFiYYmPSHiH2BdQNjk1BWe5nR2waQtIe+edUY0Lbn4TpRqGOX2XV/198=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=ISBMi7gl; arc=pass smtp.client-ip=185.56.87.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-8rgx.prod.antispam.mailspamprotection.com; s=arckey; t=1737033300;
	 b=gX70lLuCxwmWas1i6QiRMcIap07zdE17h+w0RQ2wBKB7l8fYgZzLLIeVpg46xtMTS7AHKSYMVm
	  JJZPWQYGo6Y+XSdWlnttUusiZi/0n2k2ltm/TYWvZtXaOZxGRX1OSz37Y8uunPEyxNwhK9YBWn
	  sHIAoVoOLjTzD4U2m4W5o4iYPV1r4M09CIb3sh/c1Y4fosOWL0lNexIQ11OeAgUp3zkwCb1ndR
	  sdqc+7U0c0lqgAFWkCIQaSWlm3aIeHYwNv71kvSK/0lfokrYDcofC+gxh+G4ZmaYONJPwiesoO
	  8e63T8t1SgRV3qD9QtcON//R6peQ919RlZ0+fLveSU1LrQ==;
ARC-Authentication-Results: i=1; instance-europe-west4-8rgx.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-8rgx.prod.antispam.mailspamprotection.com; s=arckey; t=1737033300;
	bh=y+b3MbpKg998YOh+8hcaheF9u7y8tE6HmG7mjeRFtBY=;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	  Message-ID:Date:Subject:Cc:To:From:DKIM-Signature;
	b=fy/XTuTqv7H+7KoX2MLKOE/bTP5qflxSmqmu5MivwtMU6hTB8Oi2U2oEe0F9EffXjO4dM9iTih
	  qrrPB0cFzUqM8wYe2HA1J1DQqIEoefPeYiX4+OQE9V0VY4ErbX5+3Ie/Ms7hXkWm7fIsbfWyL/
	  irs8WSEdPVkkuwMa4c8ZX1Qr1eBgA4lsBA/0luxbNGalabEeUdTtZ47dsusp8t/J3p+fPjiGnH
	  q/5mwpBlkR/1OQtPiVLKnuf+qUC9+1hC+HKaIzqnLhrM+NhgUt+GwvZAPFEu52Ses869B42zYB
	  Uln9BmuHMR0B8enVcz1x29zAuCzxP3ZaBUSsFIA9QESdCQ==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-8rgx.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tYPhy-000000054of-1oKM
	for linux-omap@vger.kernel.org;
	Thu, 16 Jan 2025 13:14:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=wnZJOy5bzgvezrncP1A73JI9x0GgO7ui8qp7tf7OJkU=; b=ISBMi7glIZ6eFqNatQjoacEMZX
	tM0pxX8pVT0Ke9SkPUKx9TGCnxrQQf7jAkvXDKXczHJLHAxHOLdR9dl6RVE9fIvx+/XBrwcJTGopb
	wt7VUfrM+YQCekEmHcnB0IRybiMiN9VN+e92SHKJURYgN1Plv+CSW0SBA0ExacCpfvh0=;
Received: from [62.18.83.152] (port=39313 helo=fedora.localnet)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tYPhl-00000000Ee2-2BHZ;
	Thu, 16 Jan 2025 13:14:37 +0000
From: Francesco Valla <francesco@valla.it>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, Roger Quadros <rogerq@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>,
 Kevin Hilman <khilman@baylibre.com>, linux-omap@vger.kernel.org
Subject: Re: [PATCH] bus: ti-sysc: mark AM62 wkup_uart0 as non deferrable
Date: Thu, 16 Jan 2025 14:14:37 +0100
Message-ID: <2726767.vuYhMxLoTh@fedora>
In-Reply-To: <25491f79-323b-421f-8053-36d5655e5323@kernel.org>
References:
 <20250109175211.113945-2-francesco@valla.it>
 <25491f79-323b-421f-8053-36d5655e5323@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 0a56b5fde483a09f4e8b0fd62d064c5b
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-8rgx.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hello Roger,

On Monday, 13 January 2025 at 19:08:43 Roger Quadros <rogerq@kernel.org> wrote:
> 
> On 09/01/2025 19:52, Francesco Valla wrote:
> > The ti-sysc driver implements a probe deferral logic to be sure to probe
> > the parent interconnects before their children, postponing the probe of
> > interconnects not marked as "early" instances until one of these is
> > found.
> > 
> > Since the driver is alse used for the wkup_uart0 block found on the AM62
> 
> alse/also
> 

Noted.

> > SoC, but not for other devices on the same platform, this logic forces
> > the probe for it to be artificially deferred 10 times and can lead to
> > the device not being probed at all. The missed probe was seen on a
> > BeaglePlay with the kernel configuration stripped to bare minimum and
> > no module support.
> > 
> > Add the ranges for wkup_uart0 to the list of "early" interconnect
> > instances, forcing the driver to skip the defer logic entirely for this
> > device.
> > 
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
> >  drivers/bus/ti-sysc.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> > index f67b927ae4ca..917b7168fbd0 100644
> > --- a/drivers/bus/ti-sysc.c
> > +++ b/drivers/bus/ti-sysc.c
> > @@ -687,6 +687,8 @@ static struct resource early_bus_ranges[] = {
> >  	{ .start = 0x4a300000, .end = 0x4a300000 + 0x30000,  },
> >  	/* omap5 and dra7 l4_wkup without dra7 dcan segment */
> >  	{ .start = 0x4ae00000, .end = 0x4ae00000 + 0x30000,  },
> > +	/* am62 wkup_uart0 */
> > +	{ .start = 0x2b300000, .end = 0x2b300000 + 0x100000, },
> >  };
> >  
> >  static atomic_t sysc_defer = ATOMIC_INIT(10);
> 
> While this is probably OK for now, we need to ensure that sysc_defer_non_critical()
> is not called for such devices that don't have an interconnect managed by
> the sysc driver (i.e. non OMAP based systems).
> 
> Maybe this calls for a new compatible for AM62 sysc?
> 

A new compatible would be better in my opinion, but I didn't want to introduce
too much change at once. However, if you also see it more appropriate, I'll send
a different patch set with the new compatible plus the required devicetree
modifications. 

> Reviewed-by: Roger Quadros <rogerq@kernel.org>
> 

Thank you

Kind regards,
Francesco





