Return-Path: <linux-omap+bounces-4738-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F320BFB000
	for <lists+linux-omap@lfdr.de>; Wed, 22 Oct 2025 10:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 398D558578B
	for <lists+linux-omap@lfdr.de>; Wed, 22 Oct 2025 08:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15F2830E838;
	Wed, 22 Oct 2025 08:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="1KaWRcOO"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19787309EF4;
	Wed, 22 Oct 2025 08:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761123323; cv=none; b=DE2jc0Y23A9eMJjvIUWhJiGKNQh2O+gKwqGgrDXnSpj0CaPnhOsTY9NC4/kAPJvB0sM0wIT5CKoVXg5eUpEqEg3v2yosS88edzRlP//2QBrFqfQqpQx32se1LDtLcA5hywYRo5+RXioDixK9y/boTXK4jIqZxSi2Dz1lqFRhHAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761123323; c=relaxed/simple;
	bh=LxySeUIScT7NWfE61hz2tNtsBcPsmPf5b4Rc3nNLoQI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EH5JX/n7V5EJEV3B1f1zwtro4A1FSMQlhUQfnIpwZ5u+wqvkCj1IpX9Chdh856NWZ58KdN3G1UNbkvrFk+dIjc0du2ikFMw321Wly4g4Kc5THegz5vf8/CKU5St1eSvmHx4sMNcgRv08Twg2ZT8S1f9bugGoPMopdsyAIODPMZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=1KaWRcOO; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=oHvZB4NwUXXPrGHOyAB04zW2NhfaHBxub/V9ezZt/vs=; b=1KaWRcOOBm9ve1gG5wAFhu0uPP
	eXKaMPZ9KidhNXk+56C1MtoDgyLaPTyyf1EqOnaJPyvE/R7MDzBQdQTd1i0Wj/7tZhCbZK2ougha4
	VSomg2cEoGiS/Rn684+DUoup0rsT9jFcano4bsvDdjGAcJDYu8k+Zr0SEcwIpDShsuHoPB4YZUvtp
	Fw+7vgvNso+J8ZrKhU6w2/4hiU4RARWR5R0KwzHviggxcEgRla82xLaY1DVGfAuecMDdi2/tkWZ10
	13ShfYCZRx6qoanodjflVQh+Fp8ANTBlpSD3Rg4chji6KZPANDomZnIDKUbVwhqq2M0LDslLBDqHU
	XmohzhDw==;
Date: Wed, 22 Oct 2025 10:55:16 +0200
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
Message-ID: <20251022105516.2ffea183@kemnade.info>
In-Reply-To: <7702e4f6-4913-4d9e-bbc4-1fb849507e4c@kernel.org>
References: <20251020-twl6030-button-v1-0-93e4644ac974@kernel.org>
	<20251020-twl6030-button-v1-1-93e4644ac974@kernel.org>
	<5fd43d2c-3a08-4a51-abb6-38883ee86bf2@kernel.org>
	<20251021104515.5e25bec1@kemnade.info>
	<beabb9f7-fcf4-4c1d-a259-6c48e82fbcf5@kernel.org>
	<20251021183624.6fde0a15@kemnade.info>
	<7702e4f6-4913-4d9e-bbc4-1fb849507e4c@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 21 Oct 2025 19:18:25 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 21/10/2025 18:36, Andreas Kemnade wrote:
> > On Tue, 21 Oct 2025 11:58:49 +0200
> > Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >   
> >> On 21/10/2025 10:45, Andreas Kemnade wrote:  
> >>> On Tue, 21 Oct 2025 09:10:28 +0200
> >>> Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>>     
> >>>> On 20/10/2025 14:31, akemnade@kernel.org wrote:    
> >>>>> From: Andreas Kemnade <andreas@kemnade.info>
> >>>>>
> >>>>> TWL603x has also a power button, so add the corresponding subnode.      
> >>>>
> >>>> No, we don't add subnodes just because there is a power button. This
> >>>> needs broader explanation, see also my further comment.
> >>>>    
> >>> Hmm, what is the general pattern to follow if a mfd device has some
> >>> functionality which depends on some optional external components?    
> >>
> >> Please describe it better - how these nodes depend on external
> >> component? The power button logic/IC is in this device always. It is not
> >> optional.
> >>  
> > The power button logic is always there, yes, but it depends on an optional
> > actual mechanical button connected to a pad of this device, which is
> > not always there. The logic will not work if I just put my finger on the PMIC,
> > but it will work if there is a mechanical button which I can press connected to
> > the PMIC.  
> 
> 
> Hm... how do you represent this logic now? By adding status=disabled to
> the pwrbutton node?
> 
Yes, or by simply not adding tho pwrbutton node at all. Well, if we break
the legacy pattern here, we can probably add a property for this.


Regards,
Andreas

