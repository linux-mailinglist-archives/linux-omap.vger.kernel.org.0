Return-Path: <linux-omap+bounces-3885-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64705ADACF6
	for <lists+linux-omap@lfdr.de>; Mon, 16 Jun 2025 12:05:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 726177A87BA
	for <lists+linux-omap@lfdr.de>; Mon, 16 Jun 2025 10:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7692C159F;
	Mon, 16 Jun 2025 10:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="Y6qj1fNl"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD0F230BEF;
	Mon, 16 Jun 2025 10:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750068269; cv=none; b=TN4iQ+Zp30M99J2XQr4Mj0IBzh2uLcC+3Q5kluj1MwUOArHV//tOWEiJf7aS+3uOlHf1w6NbnO0o/qIW3pp3AxNsB5FBkYtJrp2QX4GxQuvIsxPKFZdD5aw31pLnSG125nNcfSMX3qntXGEgN5swj+jHQ8/o8qVjpnlJ4Ee/uS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750068269; c=relaxed/simple;
	bh=IqHdIMP8oq682ly7gmcYGkhV+ItjF28rc0DFQ8K6BDA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kTYwxjCYyPHg4C30zuRhV1vI9UvaZHdxjGSKAtUmJk9S+5/GiS5H4xbCiArnKHcXrGbzEhCs2rW7li05DLwDN21nCZJ+SfRpWyiTbJY56SZ8T0b66u3GsEBwzauY9sTXHvDGklHqw3YuTGjc0ow105fpU6A0oHvCh7C4MzP6fCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=Y6qj1fNl; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Gebr3x5cFjIyCpTF84QP5T9DzSmcTlWVArnM0v5gIds=; b=Y6qj1fNlPUCcGLc2S2OKITAYfD
	t8Vq9th3zdfOzL0wLypb1BZLPdnCf98+I0dEfsr0Gg321OLl15OxRBjiAHKl08oDh6wupQwlUXmBb
	jtAuTtuci6wK/o3NrcxNunay6KfgKF61x0YUa9ddxGzMFHqoxbdKbtsP60wc+jmvF/SpFQjophpmB
	lPf9nHz3TxunhONX8dsrSjl4jsVJiweY9gunoo2Yva7vFNVdjhwtXfEv7B+CUK1821LD8YopzFFTr
	mk7oCd1CLBqjiollkRyrd/FM7Jm8NDI+Xcf5TzfmXVCWn1yioMccMvQxgfdWauq6Q6j1inSzj0WjG
	nA4OYb0g==;
Date: Mon, 16 Jun 2025 12:03:51 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Andrew Davis <afd@ti.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>, Tony Lindgren
 <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros
 <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, Bajjuri Praneeth
 <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/5] binding: omap: Add lots of missing omap AM33
 compatibles
Message-ID: <20250616120351.3479442f@akair>
In-Reply-To: <53b48816-37e6-49e8-a5cf-adcca04c57a7@ti.com>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
	<20250609-bbg-v2-2-5278026b7498@bootlin.com>
	<53b48816-37e6-49e8-a5cf-adcca04c57a7@ti.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Mon, 9 Jun 2025 18:34:10 -0500
schrieb Andrew Davis <afd@ti.com>:

> On 6/9/25 10:43 AM, Kory Maincent wrote:
> > Add several compatible strings that were missing from the binding
> > documentation. Add description for Bone, BoneBlack and BoneGreen
> > variants.
> > 
> > Add several compatible that were missing from the binding.
> > 
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > ---
> > 
> > Change in v2:
> > - New patch
> > ---
> >   Documentation/devicetree/bindings/arm/ti/omap.yaml | 38 ++++++++++++++++++++++
> >   1 file changed, 38 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > index 3603edd7361d..c43fa4f4af81 100644
> > --- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > +++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > @@ -104,12 +104,50 @@ properties:
> >         - description: TI AM33 based platform
> >           items:
> >             - enum:
> > +              - bosch,am335x-guardian
> >                 - compulab,cm-t335
> > +              - grinn,am335x-chilisom
> > +              - gumstix,am335x-pepper
> > +              - moxa,uc-2101
> >                 - moxa,uc-8100-me-t
> > +              - myir,myc-am335x
> > +              - myir,myd-am335x
> >                 - novatech,am335x-lxm
> > +              - oct,osd3358-sm-refdesign
> > +              - tcl,am335x-sl50
> >                 - ti,am335x-bone
> >                 - ti,am335x-evm
> > +              - ti,am335x-evmsk
> > +              - ti,am335x-pocketbeagle
> > +              - ti,am335x-shc
> >                 - ti,am3359-icev2
> > +              - vscom,onrisc
> > +          - const: ti,am33xx
> > +
> > +      - description: TI bone variants based on TI AM335  
> 
> Do we really need these "bone variants" split out from the above
> list of TI AM33 based boards? We don't do that for any of the other
> boards, you get a SoC and a Board compatible, every classification
> in-between is just unneeded.
> 

We have something like this for the Pandaboards models. But
e.g. the i.MX Udoo Neo stuff which just differs in what is populated
does not have this. So I do not see a clear pattern. It could be useful
for userspace to store some board-specific configurations which might be
the same for a family of boards. So if people shout out loud that these
are needs, lets kep them.

Regards,
Andreas



