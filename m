Return-Path: <linux-omap+bounces-3890-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E31ADC465
	for <lists+linux-omap@lfdr.de>; Tue, 17 Jun 2025 10:18:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 051BA18832F3
	for <lists+linux-omap@lfdr.de>; Tue, 17 Jun 2025 08:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6671FF60A;
	Tue, 17 Jun 2025 08:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ntI+Umjb"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53519D2FB;
	Tue, 17 Jun 2025 08:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148286; cv=none; b=kln93EObi4DTU2XvR0NAd4YN581VJUALbR/SgHpI0s1Wy+Wl/4xbp/32XWjm084lnq+rzfvCr+OecLC2y88SIlGmJVS4k1Yz+W8vOwYyZ4ymcPdLxwJAD4MZl0uXnlNYX/dWaTtdyx9gF8o453WZZyPVe5oDKWOx49B+0J2aD0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148286; c=relaxed/simple;
	bh=MZSo/B8Ueewbot0Zq1gP0vpAO0AFWWY0WjE6mYewrUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fyWkB+7kK/ucG5opkXClUKW0zjZGBKlVoS7fQQOyEMsYCrThAPqD7o49rt6Md4IkNIsX9TZZBDOg0RTXpm1iXZj+FkpQtbk+YrjASQs79DLsMA9xovNroCsFQ7E8zi3QH5/dv4fWBPR+4dNUBlEArjoTH3nWK98lvcreO7HzQxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ntI+Umjb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52636C4CEE3;
	Tue, 17 Jun 2025 08:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750148285;
	bh=MZSo/B8Ueewbot0Zq1gP0vpAO0AFWWY0WjE6mYewrUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ntI+UmjbdXl+CUqRVIrx5ytxcPaeqqksAqWWehytGvsOdDFnNV4QeCLk/h6aqMztQ
	 uq3h+7hl7OQxKR1c2ePzoA3so2p3lggM+/l96ZAapytKZ+PaZcORVibq1WKH0e8ip5
	 kUefxhTQf8a+4kvckopwj1vUyU1ZQgt0edTbiBkx2hvjzdyuaR8MztDBCkYP1I3oTJ
	 nBo0ksWTh4vUzTEWdV/tNjunHO8iaNSBHCLTqgMfCn12avLzfVwRNJ3L5KE0gB4giu
	 yxcB4lydVduiSywwJl0ztpPa3PaH+sVCqLqHBSfudEDFML/g9prmblmJleUSjGdlhu
	 iw94oQeG9st7Q==
Date: Tue, 17 Jun 2025 10:18:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Conor Dooley <conor@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-omap@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/5] arm: dts: omap: Add support for BeagleBone Green
 Eco board
Message-ID: <20250617-manipulative-discerning-fennec-bbd829@kuoka>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
 <20250609-bbg-v2-4-5278026b7498@bootlin.com>
 <20250609-helpful-immodest-0f195cdbcbf2@spud>
 <20250609224502.1fce742c@kmaincent-XPS-13-7390>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250609224502.1fce742c@kmaincent-XPS-13-7390>

On Mon, Jun 09, 2025 at 10:45:02PM GMT, Kory Maincent wrote:
> > > diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > > b/Documentation/devicetree/bindings/arm/ti/omap.yaml index
> > > c43fa4f4af81..774c13157caa 100644 ---
> > > a/Documentation/devicetree/bindings/arm/ti/omap.yaml +++
> > > b/Documentation/devicetree/bindings/arm/ti/omap.yaml @@ -145,6 +145,7 @@
> > > properties:
> > >        - description: TI bone green variants based on TI AM335
> > >          items:
> > >            - enum:
> > > +              - ti,am335x-bone-green-eco
> > >                - ti,am335x-bone-green-wireless
> > >            - const: ti,am335x-bone-green
> > >            - const: ti,am335x-bone  
> > 
> > Why is this hunk here?
> 
> Do you mean that the binding change should be in another patch?

Yes, as requested by checkpatch and documented in DT submitting patches.
Your question above, suggests you did not run checkpatch, so please
confirm you run it before posting new versions.

Best regards,
Krzysztof


