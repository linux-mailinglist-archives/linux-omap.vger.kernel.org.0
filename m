Return-Path: <linux-omap+bounces-4806-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E024DC16A55
	for <lists+linux-omap@lfdr.de>; Tue, 28 Oct 2025 20:42:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 80DDF4E57EE
	for <lists+linux-omap@lfdr.de>; Tue, 28 Oct 2025 19:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7F235029B;
	Tue, 28 Oct 2025 19:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="jcsJ9MQR"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7CB25F96B;
	Tue, 28 Oct 2025 19:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761680528; cv=none; b=FK+ELJtgHSyycsa+0eRiVv0Hv48cRkRwlHP4vej0ceaZ3WE2AgSuMsX3RTSNmEAcdnwa7PNuN3DSKwCfLVNccGKbJ7VkW8GyzAOE/z8kV/PlnDuw39KlRa2QI5LHjcOv2grwuXmVgJWKfsBAXeObDPDs+aV1QUB+r2VJ2MRrCAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761680528; c=relaxed/simple;
	bh=OruuR1BSW+2DCU1NS3kcERy38fzdWVkeIH+j65bZtN4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DnM7ckSs/8S0do3Z37jtdk3399C1rfG+CLbqd5RsnBpCGxWjDHHp6/Jv7M980YcBj5YkdJDSln1pyKr+XrPx6794MCnBIspkPmYVIQ0BByk4R2abZzXHh0BwaxZWxT/YCGJ4sixWrbmWAeVrP7Q5qecz32BDgH9Ua+6ynxW3KAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=jcsJ9MQR; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=SluxDs7DTABDqtpsTaBR0SYYH2qHC1+d6v/WpkmGwRk=; b=jcsJ9MQRK5rn7fNJ3he0WSjW7D
	OQJ5h1f66vmrqh8jiLca23wHA3l00awBFP+MEOISAq+FsgKjAcjRlLRtBevDCABiiA9FQEK84W+ZL
	MkbMBknQhielih+j5nwQiyFCrhR5JBk+wKEuu6wP+nisnguuDpKx81z82urAiwCsM4NZkqVAl+zlk
	aYi5uxyyTUXOmwQVwYVWXKoL2jYD4bFt/nfjXpqcmrdsnt2JLYfz6IoBK4eJVJEyC16u7l2jICaGO
	6ASDlSkml31g+OibDZUY73Q9RI+CORxb37rnpPf5P2btezk17owAv3ZF+SPpS/8YDgLShSRqJwJqT
	vZKdoiag==;
Date: Tue, 28 Oct 2025 20:41:49 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Conor Dooley <conor@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, Tony Lindgren
 <tony@atomide.com>, hns@goldelico.com, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] dt-bindings: input: elan: Introduce Elan
 eKTP1059 Touchpad
Message-ID: <20251028204149.325506f6@kemnade.info>
In-Reply-To: <20250825-decal-purchase-8cfe0003a3f2@spud>
References: <20250825-ektp-submit-v1-0-1dd476c1277b@kemnade.info>
	<20250825-ektp-submit-v1-1-1dd476c1277b@kemnade.info>
	<20250825-decal-purchase-8cfe0003a3f2@spud>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 25 Aug 2025 17:40:56 +0100
Conor Dooley <conor@kernel.org> wrote:

> On Mon, Aug 25, 2025 at 12:07:28AM +0200, Andreas Kemnade wrote:
> > The Elan eKTP1059 Touchpad is seen in the Epson Moverio BT-200
> > attached via SPI. Add a binding for this chip. Little is known.
> > 
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> >  .../devicetree/bindings/input/elan,ektp1059.yaml   | 45 ++++++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/elan,ektp1059.yaml b/Documentation/devicetree/bindings/input/elan,ektp1059.yaml
> > new file mode 100644
> > index 000000000000..a10256a271e0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/elan,ektp1059.yaml
> > @@ -0,0 +1,45 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/input/elan,ektp1059.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Elantech SPI Touchpad
> > +
> > +maintainers:
> > +  - Andreas Kemnade <andreas@kemnade.info>
> > +
> > +allOf:
> > +  - $ref: touchscreen/touchscreen.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: elan,ektp1059
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +
> > +additionalProperties: false  
> 
> Shouldn't this be unevalutedProperties: false, since you want to make
> use of what's in touchscreen.yaml?
>
did not do too much thought about this yet. But am I allowed to use this
in a touchpad? BTW: who defines whether the chip is a touchpad? T*P* in
its part number might be a hint, the device where I am using it, uses it
as a touchpad. But who says it cannot be glued onto some screen?

Regards,
Andreas

