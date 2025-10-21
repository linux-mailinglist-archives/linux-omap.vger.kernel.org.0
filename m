Return-Path: <linux-omap+bounces-4729-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC3BBF556E
	for <lists+linux-omap@lfdr.de>; Tue, 21 Oct 2025 10:45:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ABF134F8C41
	for <lists+linux-omap@lfdr.de>; Tue, 21 Oct 2025 08:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19DF43203BE;
	Tue, 21 Oct 2025 08:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="jXDLM8tP"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF32C3164AF;
	Tue, 21 Oct 2025 08:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761036324; cv=none; b=ZoJn5dEYWOI0FLJ9JgOcSK59F9dMUfad8MNNuyQ0pPqdP24tXuu5bqnhrH/dcHzYxMjq8JkUE3OSMZXH3/siubHtdCoxc1FqNtHC18eDfvMwMhKxBzuB6aP0t5WEFADNHp5IlqaJ52vjpsXkKU4OrxPO1VyG6pJhJGG+oKipEQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761036324; c=relaxed/simple;
	bh=c1Pf9GruNwXKMGqETaSYoB3W1R9Hq+dr0v7HNiY4wkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tHeU9uRU6shW0qKSsuwMr0bvmYdUe/967f6rbiTtCaSBCNLw0FTWNwmXSVYFE5bezZ+SN3gTab8i8a5SgckQX2rgylLmP8KirplAOZACkkWJSWOTcv4e7e6Je2aHN8okU3BUgoz2D9GBckQNSt2+iznLAOnHA+N9FgmrcLgeyZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=jXDLM8tP; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ncJdjWKY1DOjrDLZL5j4p76Qlhm7Y8QtHlewiwg9TMI=; b=jXDLM8tPmsMY+0/Xt4Uvwy0OSC
	0MgC+CcWZ/FrBxFPFeZCLd5C0c4J3VSJ6XF3vrx81SW4HC8qDcNvDup8Ysu+Tx3bb0jLeWc8Lb0n/
	QMUd4plbIDJWFaybbgLVqYthTQaDgLxYyV7ibwJ+1YTQETmE+Nwsz2Vaw3P8P4Kqj5pT7mREjBhSP
	C+9/uV5tUYwxjrs7eywjdtYOQpaPJQFoiVjDHxuloj66XUfXWoYdlqcZqNOiHTUSbm0NGQjSbFFbN
	Vx+AcQr7mN9jTSYK+/cemdG6tR3NVssgmozf1lT1eYh4FFSZvrD63T8X6uDA+rhYKEqvYLtcvgKwt
	tbt1VTtw==;
Date: Tue, 21 Oct 2025 10:45:15 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: akemnade@kernel.org, Lee Jones <lee@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tony
 Lindgren <tony@atomide.com>, Kevin Hilman <khilman@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: mfd: twl: enable power button also for
 twl603x
Message-ID: <20251021104515.5e25bec1@kemnade.info>
In-Reply-To: <5fd43d2c-3a08-4a51-abb6-38883ee86bf2@kernel.org>
References: <20251020-twl6030-button-v1-0-93e4644ac974@kernel.org>
	<20251020-twl6030-button-v1-1-93e4644ac974@kernel.org>
	<5fd43d2c-3a08-4a51-abb6-38883ee86bf2@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 21 Oct 2025 09:10:28 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 20/10/2025 14:31, akemnade@kernel.org wrote:
> > From: Andreas Kemnade <andreas@kemnade.info>
> > 
> > TWL603x has also a power button, so add the corresponding subnode.  
> 
> No, we don't add subnodes just because there is a power button. This
> needs broader explanation, see also my further comment.
> 
Hmm, what is the general pattern to follow if a mfd device has some
functionality which depends on some optional external components?
The might be a power button connected to it or not. I find it ugly
to have non-existent stuff in the system.
In general, yes I understand the argument against the subnode.

> > 
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> >  Documentation/devicetree/bindings/mfd/ti,twl.yaml | 40 ++++++++++++++++++-----
> >  1 file changed, 32 insertions(+), 8 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/ti,twl.yaml b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
> > index 776b04e182cb2..3527fee32cb07 100644
> > --- a/Documentation/devicetree/bindings/mfd/ti,twl.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
> > @@ -55,6 +55,15 @@ allOf:
> >  
> >          gpadc: false
> >  
> > +        pwrbutton:
> > +          properties:
> > +            compatible:
> > +              const: ti,twl4030-pwrbutton
> > +            interrupts:
> > +              items:
> > +                - items:
> > +                    const: 8  
> 
> What is the point of defining const interrupts? If they are const, then
> it is implied by compatible and defined in the driver.
> 
> Anyway, double items does not look right here. This is an odd syntax.
> 
Quoting Rob:
As 'interrupts' is a matrix, this needs to be:

interrupts:
  items:
    - items:
        - const: 8

https://lore.kernel.org/linux-omap/20240318150750.GA4000895-robh@kernel.org/

Regards,
Andreas

