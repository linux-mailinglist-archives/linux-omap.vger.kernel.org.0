Return-Path: <linux-omap+bounces-3183-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E23FCA19ACD
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 23:20:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE4BB7A2214
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 22:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA92C1C5F32;
	Wed, 22 Jan 2025 22:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="KOQEIMfa"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45841C5D58;
	Wed, 22 Jan 2025 22:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737584421; cv=none; b=ta2vPT/qnFel5MXD09J92mOiNZgLxYfITrOYarMrxtCZW7gc4mkXwUO4cG93OMCHML/k6kWG9Tq7joq2ouY20IhxXwnC1dnFfFSefg1IvFWrj5SYCFM5C7YEm2ByJtOmgEYW8oePtsJHxuv2kHY8QlRlLje5FLDczRmdUgAltRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737584421; c=relaxed/simple;
	bh=nvrrx8/PtkLuZZfdtUoyq5DSXbUigWwuz3bTnqFVjV0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p33Bc199n+nXjhpY3VVmvGx9/rN64lsLKHBjET8SA97zoQE376mU+IXHjnTVCs61jSuvnwOyjKPNVS2JZSLO/m0pa+CUKJN007yDyDW4cUcCH7/+wB2YVXuTeNDQANtqMVZj2GEldVtHtEU/mnlvQn/o/IaYo4LwBIZD2rohDJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=KOQEIMfa; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=+Lrd7gBEeXZfZSsPu6hPDLZMANOAYM06iYiKU5AwnPg=; b=KOQEIMfaFXAPya7pLSmRCD/Elq
	fxjyTi3TP4+ZwZXm5Y4u9A7gY8+PuaPgZsaLnTHfuBhnStwPgkp5nJNzmwVDXQl5qgWUV0LbUrnFv
	FeMPUUINwazdT0BEn8dnK8hdoHOP7zzecPkf4chMbJ56unO30+fq8bcK53lkfC3jW6E570HshDDk0
	fjft+4DpsQmiVjp0C3jPxjdmePMd3eOBNO3Q53HjSGan/YpPE/vaNlei8JkGmmBqeAVKx4xAGlGrS
	cuP1pmXzuCGD6u5o2BF5KSdhGRcUQ5kUKNHVxkL/lNuT9WBhQo88diS56qhgqXET3qhjrUdCnvEP+
	ja5x+DWw==;
Date: Wed, 22 Jan 2025 23:20:10 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Tom Rini <trini@konsulko.com>
Cc: linux-kernel@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: omap: Add TI Pandaboard A4 variant
Message-ID: <20250122232010.1a5a0525@akair>
In-Reply-To: <20250122142058.GM3476@bill-the-cat>
References: <20250122001240.4166460-1-trini@konsulko.com>
	<20250122093236.6152c56c@akair>
	<20250122142058.GM3476@bill-the-cat>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Wed, 22 Jan 2025 08:20:58 -0600
schrieb Tom Rini <trini@konsulko.com>:

> On Wed, Jan 22, 2025 at 09:32:36AM +0100, Andreas Kemnade wrote:
> > Am Tue, 21 Jan 2025 18:12:40 -0600
> > schrieb Tom Rini <trini@konsulko.com>:
> >   
> > > Document the ti,omap4-panda-a4 compatible string in the appropriate
> > > place within the omap family binding file.
> > > 
> > > Signed-off-by: Tom Rini <trini@konsulko.com>
> > > ---
> > > Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> > > Cc: Andreas Kemnade <andreas@kemnade.info>
> > > Cc: Kevin Hilman <khilman@baylibre.com>
> > > Cc: Roger Quadros <rogerq@kernel.org>
> > > Cc: Tony Lindgren <tony@atomide.com>
> > > Cc: Rob Herring <robh@kernel.org>
> > > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > > Cc: Conor Dooley <conor+dt@kernel.org>
> > > Cc: linux-omap@vger.kernel.org
> > > Cc: devicetree@vger.kernel.org
> > > Cc: linux-kernel@vger.kernel.org
> > > ---
> > >  Documentation/devicetree/bindings/arm/ti/omap.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > > index 93e04a109a12..28e23ca766b4 100644
> > > --- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > > @@ -137,6 +137,7 @@ properties:
> > >                - motorola,xyboard-mz609
> > >                - motorola,xyboard-mz617
> > >                - ti,omap4-panda
> > > +              - ti,omap4-panda-a4
> > >                - ti,omap4-sdp
> > >            - const: ti,omap4430
> > >            - const: ti,omap4  
> > 
> > This allows compatible = "ti,omap4-panda-a4", "ti,omap4430", "ti,omap4"
> > 
> > According to your other patch, you want
> > compatible = "ti,omap4-panda-a4", "ti,omap4-panda", "ti,omap4430",
> > "ti,omap4"
> > 
> > so you need a construction similar to the "ti,omap3-beagle-ab4"  
> 
> Do you mean the order should change, or it should be an enum? I'm not
> sure where this is documented (the $id and $schema values in the file
> are just 404s so I guess not something to read directly?).
> 
you would need a block like this:

      - description: Early Pandaboard revision A4
        items:
          - const: ti,omap4-panda-a4
          - const: ti,omap4-panda
          - const: ti,omap4430
          - const: ti,omap4


Regards,
Andreas

