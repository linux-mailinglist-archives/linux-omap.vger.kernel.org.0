Return-Path: <linux-omap+bounces-3977-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E43BAAE8EEA
	for <lists+linux-omap@lfdr.de>; Wed, 25 Jun 2025 21:45:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B7E54A4BB6
	for <lists+linux-omap@lfdr.de>; Wed, 25 Jun 2025 19:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90232DAFDE;
	Wed, 25 Jun 2025 19:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dhzsdkLc"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813333074BC;
	Wed, 25 Jun 2025 19:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750880694; cv=none; b=a/ljMjrdd6ylEZcSdqEFrY8C3IdVE+6uAcCZ3zqn4hAIcREQkJ/SwaEcYrky1bMN4pOD+jPifOlLbJwkxIFOLKhcs9LbCzBHVp0/3O7+998A+uCyTgMvuixIG6yxayimEEle8+EbWATxWFhrfABUBU2IXCzygHcDfVhP2iwKb2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750880694; c=relaxed/simple;
	bh=UaTI7XKP1pORbiVLuaFJ3J5Oj/8204WawFn35LhQVUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XRSHXbw33Mgud6KyWBbyWezNPqT53v+4Fr47XNoRZnPAPdHb5IZ9gFX+8oBDF0RjDjSrp0G5ZsF7c+xLS20Bs/hSGM0RL6/ma0O83OEUyA8IOmVZyK9NgWjRNACM6wcveShwcu4OrSetEOyTxz5oFa4hS7eXVCc1XjNPQQJmRXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dhzsdkLc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F43C4CEEE;
	Wed, 25 Jun 2025 19:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750880694;
	bh=UaTI7XKP1pORbiVLuaFJ3J5Oj/8204WawFn35LhQVUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dhzsdkLclaUjfYa0T65Fqy/kgwwK8KXUh/ZR6WFaKHRqnDji+475X+s0Sliv0VM+x
	 preRfA/yZHFWSg2RQbJRIoA3YEV2yaaQheaR2txdVUiuQni9dWSchTL3Qfle5+EU9U
	 EdGpUhFFOZFmhNLIYxdu4r/NXEc3gg2yOkudJtaQrBloX4t38E2v6lqk87bb9M6CBQ
	 pmCpI+3fufALozfZBdXVcL0+Y3ms+xcp5uovXVg0i/gZ+sBd0Mnm/fyGu5N6nT89HN
	 C1i0hQ4p+Hgd1F97qJbARCoyRamH8PQfZ5bndryLEOQIzHqEKdF2OkXitza6ZrpB0m
	 Ah6d0jKHgCv9w==
Date: Wed, 25 Jun 2025 14:44:53 -0500
From: Rob Herring <robh@kernel.org>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Andrew Davis <afd@ti.com>, Tony Lindgren <tony@atomide.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Bajjuri Praneeth <praneeth@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/5] binding: omap: Add lots of missing omap AM33
 compatibles
Message-ID: <20250625194453.GA2093083-robh@kernel.org>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
 <20250609-bbg-v2-2-5278026b7498@bootlin.com>
 <53b48816-37e6-49e8-a5cf-adcca04c57a7@ti.com>
 <20250610100544.4beb07e2@kmaincent-XPS-13-7390>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250610100544.4beb07e2@kmaincent-XPS-13-7390>

On Tue, Jun 10, 2025 at 10:05:44AM +0200, Kory Maincent wrote:
> Le Mon, 9 Jun 2025 18:34:10 -0500,
> Andrew Davis <afd@ti.com> a écrit :
> 
> > On 6/9/25 10:43 AM, Kory Maincent wrote:
> > > Add several compatible strings that were missing from the binding
> > > documentation. Add description for Bone, BoneBlack and BoneGreen
> > > variants.
> > > 
> > > Add several compatible that were missing from the binding.
> > > 
> > > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > > ---
> > > 
> > > Change in v2:
> > > - New patch
> > > ---
> > >   Documentation/devicetree/bindings/arm/ti/omap.yaml | 38
> > > ++++++++++++++++++++++ 1 file changed, 38 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > > b/Documentation/devicetree/bindings/arm/ti/omap.yaml index
> > > 3603edd7361d..c43fa4f4af81 100644 ---
> > > a/Documentation/devicetree/bindings/arm/ti/omap.yaml +++
> > > b/Documentation/devicetree/bindings/arm/ti/omap.yaml @@ -104,12 +104,50 @@
> > > properties:
> > >         - description: TI AM33 based platform
> > >           items:
> > >             - enum:
> > > +              - bosch,am335x-guardian
> > >                 - compulab,cm-t335
> > > +              - grinn,am335x-chilisom
> > > +              - gumstix,am335x-pepper
> > > +              - moxa,uc-2101
> > >                 - moxa,uc-8100-me-t
> > > +              - myir,myc-am335x
> > > +              - myir,myd-am335x
> > >                 - novatech,am335x-lxm
> > > +              - oct,osd3358-sm-refdesign
> > > +              - tcl,am335x-sl50
> > >                 - ti,am335x-bone
> > >                 - ti,am335x-evm
> > > +              - ti,am335x-evmsk
> > > +              - ti,am335x-pocketbeagle
> > > +              - ti,am335x-shc
> > >                 - ti,am3359-icev2
> > > +              - vscom,onrisc
> > > +          - const: ti,am33xx
> > > +
> > > +      - description: TI bone variants based on TI AM335  
> > 
> > Do we really need these "bone variants" split out from the above
> > list of TI AM33 based boards? We don't do that for any of the other
> > boards, you get a SoC and a Board compatible, every classification
> > in-between is just unneeded.
> 
> As omap maintainers prefer. I did that to have the least amount of change in
> the devicetree. We could have U-boot using these compatible but after a quick
> check it seems not.

I agree with both. The intermediate compatibles that TI in particular 
went crazy on have proven to be not useful. However, between having to 
fix existing .dts files and keeping them, I would just keep them.

Rob

