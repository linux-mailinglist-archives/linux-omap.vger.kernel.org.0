Return-Path: <linux-omap+bounces-4732-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E559BF7BC6
	for <lists+linux-omap@lfdr.de>; Tue, 21 Oct 2025 18:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8BE8548130
	for <lists+linux-omap@lfdr.de>; Tue, 21 Oct 2025 16:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4CB9347BD1;
	Tue, 21 Oct 2025 16:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="TBNxILAZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF9A347BBC;
	Tue, 21 Oct 2025 16:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761064601; cv=none; b=tR909rv6n6Wq672lGq4MB+NlGLMeX2W1H7tl7CPmKeil280RKC0S0SNOS0jjeJZZ661xI+6k1vhoyIQOE3B+vTkX91C7iRMlxOgdHpfqg9nz+l7+Q88lgwYozYmwHsTc7yPfgXNLhbxlFN0K/+8yrkVcGEWOdMbdEnnm2PYQZT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761064601; c=relaxed/simple;
	bh=DVrwumkkr5SZ61R+aJi6TAQQwRK3yb6x0kw2lkyk8uI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cz1DXXanPyxjH3LDaexMlpGckJskQ+TVn6VrGfRLAhOXl13EtyZnJrw1lxmVJzglxQax/yAfiarSiQd9u9q2NN5R1RyLoYATiFrdKrxgmeOc0I2hqEhq0ibgVH6vfrpIc5p7cueBq2CShVYXZ/w521Wvtgq7N+rGwGG5PgYK458=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=TBNxILAZ; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=f+3XfcfI7PAxJh75DtOxQWWY3IPGdxhd0iLpj5h8rgU=; b=TBNxILAZZ5NJT3FqILwfu+4JPp
	AcvLYpdWMkyrVp0gesCWxqqDlkyyuD8sABnCaANaOg9eNK048kU08D44e5XXbBM7x3vncvUE0Ie8P
	XU+SmuaMganm0TCf50E7EkYmSt1Zs7XeK2Iyuo71hW5U68IEG8AQNBc24EIOsw1RjruRferk3QhFJ
	ZoV+XjJzvhsSf9Hor/oduxKBQIwaR0fmq3/L9F4TVBvNCUNXQuxgo9YZHL2t2D6m6iJIuXjrLYbPw
	N0TmE63JAOQV+ajgRDHyG3GXNUkZnMQhOrIqIeipg+bGaNDu9TzhmSpHXY+4kdvPvUzoj0PqBf4LS
	Uo+32VyQ==;
Date: Tue, 21 Oct 2025 18:36:24 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Kevin Hilman <khilman@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: mfd: twl: enable power button also for
 twl603x
Message-ID: <20251021183624.6fde0a15@kemnade.info>
In-Reply-To: <beabb9f7-fcf4-4c1d-a259-6c48e82fbcf5@kernel.org>
References: <20251020-twl6030-button-v1-0-93e4644ac974@kernel.org>
	<20251020-twl6030-button-v1-1-93e4644ac974@kernel.org>
	<5fd43d2c-3a08-4a51-abb6-38883ee86bf2@kernel.org>
	<20251021104515.5e25bec1@kemnade.info>
	<beabb9f7-fcf4-4c1d-a259-6c48e82fbcf5@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 21 Oct 2025 11:58:49 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 21/10/2025 10:45, Andreas Kemnade wrote:
> > On Tue, 21 Oct 2025 09:10:28 +0200
> > Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >   
> >> On 20/10/2025 14:31, akemnade@kernel.org wrote:  
> >>> From: Andreas Kemnade <andreas@kemnade.info>
> >>>
> >>> TWL603x has also a power button, so add the corresponding subnode.    
> >>
> >> No, we don't add subnodes just because there is a power button. This
> >> needs broader explanation, see also my further comment.
> >>  
> > Hmm, what is the general pattern to follow if a mfd device has some
> > functionality which depends on some optional external components?  
> 
> Please describe it better - how these nodes depend on external
> component? The power button logic/IC is in this device always. It is not
> optional.
>
The power button logic is always there, yes, but it depends on an optional
actual mechanical button connected to a pad of this device, which is
not always there. The logic will not work if I just put my finger on the PMIC,
but it will work if there is a mechanical button which I can press connected to
the PMIC.

> > The might be a power button connected to it or not. I find it ugly
> > to have non-existent stuff in the system.
> > In general, yes I understand the argument against the subnode.
> >   
> >>>
> >>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> >>> ---
> >>>  Documentation/devicetree/bindings/mfd/ti,twl.yaml | 40 ++++++++++++++++++-----
> >>>  1 file changed, 32 insertions(+), 8 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/mfd/ti,twl.yaml b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
> >>> index 776b04e182cb2..3527fee32cb07 100644
> >>> --- a/Documentation/devicetree/bindings/mfd/ti,twl.yaml
> >>> +++ b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
> >>> @@ -55,6 +55,15 @@ allOf:
> >>>  
> >>>          gpadc: false
> >>>  
> >>> +        pwrbutton:
> >>> +          properties:
> >>> +            compatible:
> >>> +              const: ti,twl4030-pwrbutton
> >>> +            interrupts:
> >>> +              items:
> >>> +                - items:
> >>> +                    const: 8    
> >>
> >> What is the point of defining const interrupts? If they are const, then
> >> it is implied by compatible and defined in the driver.
> >>
> >> Anyway, double items does not look right here. This is an odd syntax.
> >>  
> > Quoting Rob:
> > As 'interrupts' is a matrix, this needs to be:
> > 
> > interrupts:
> >   items:
> >     - items:
> >         - const: 8
> > 
> > https://lore.kernel.org/linux-omap/20240318150750.GA4000895-robh@kernel.org/  
> 
> 
> OK, this answers second part but I don't understand why even having this
> in DT. If this is fixed, should be implied by the compatible?
> 
correct, they do not need to come from DT. The same is true for all
subnodes of the twl[46]03X. I just followed the usual
pattern there, which is of course not recommended for new designs.

Regards,
Andreas

