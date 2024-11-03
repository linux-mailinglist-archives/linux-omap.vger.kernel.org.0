Return-Path: <linux-omap+bounces-2562-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7D59BA740
	for <lists+linux-omap@lfdr.de>; Sun,  3 Nov 2024 18:36:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0EFB1F214EB
	for <lists+linux-omap@lfdr.de>; Sun,  3 Nov 2024 17:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD2518991E;
	Sun,  3 Nov 2024 17:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="s19XAgN7"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF8F13049E;
	Sun,  3 Nov 2024 17:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730655406; cv=none; b=O4izUBSg1yZJjhy3Ixb0Oxrs9vgqoYDGHlvs/F1mkAdc8P4LaxzD84404p4RLYzT9+xzKThRvSIdQMgT6D+/QS3hdCdmYxm8s0KBL5eD7dDH4tH/E2V1IbTfW0KpapWhC6fc9xDjPMFVILwcWKOznpBN9BCIXxZVdkYkmSuu8iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730655406; c=relaxed/simple;
	bh=vG1dN2jvK4GPiTUTN7lh6GhShEszT/+pyjWmhMpifgw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MDTxVWA1VV4jM/HvBTH5xJMd3Ug7lb8hCuxUVGxFsymeB79F/onOuoz8YY09G5sTK/02C8bhoB8rR/vtJ3SeMp6S9KnG9DYideuuFcNX7BXQXSb27MpOUeFnrkhm6IA9pMKfUdVVVm80x3NYj+6JV2QhTKizGArtQppwzXP70OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=s19XAgN7; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=nyvL5hW9tmY/2ZluyWSap3lYfFpEuf8kt49tqGDLvnA=; b=s19XAgN7WqbV0BHsi5WaM4bDOm
	JGBBm+7BlljD6UfjZsdpYjdy5WwyEQbkIjXNcGHLz5Klu6H/I8waWhTJkVUJ/53YvZIVHmgkz4Ok1
	W4K9ScDj9s+4tGfDfG7J/gB+nIILhvFJ9BinAC7mxjNXtO8bY/tEHyyFzxB0eqORsri/ICRgDYbvO
	+K6nh8T9YYZBsmq+ZOg3L9EydEudOJRIMFXuPgpvh7Xb+Ct0GT4LpBmWKkUhFjcQlTQGzgkHRldY3
	bkhVJPS/8Gu+QrafZzsKCVOyFiliF5PU/UyB3/LL/7bVYXAHB0bFZ4HV69JQbRWFDZNmDy7vr5ON6
	qB2mSxYw==;
Date: Sun, 3 Nov 2024 18:36:36 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Mithil Bavishi <bavishimithil@gmail.com>
Cc: aaro.koskinen@iki.fi, conor+dt@kernel.org, devicetree@vger.kernel.org,
 khilman@baylibre.com, krzk+dt@kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, robh@kernel.org,
 rogerq@kernel.org, tony@atomide.com
Subject: Re: [PATCH v2 2/6] arm/dts: Add common device tree for Samsung
 Galaxy Tab 2 series
Message-ID: <20241103183636.40cc37fc@akair>
In-Reply-To: <20241031104146.4538-1-bavishimithil@gmail.com>
References: <20241031083248.043d25d0@akair>
	<20241031104146.4538-1-bavishimithil@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Thu, 31 Oct 2024 10:41:45 +0000
schrieb Mithil Bavishi <bavishimithil@gmail.com>:

> > well, that takes time, I wanted to start that on the right thing.  
> 
> Yes indeed, I'll be more careful the next time, again sorry for the 
> trouble, I am not used to the process of mailing lists and may have
> done some mistakes there as well.
> 
probably you did not notice an error in make dtbs and the old
devicetree on the device was still there and was used.

> > 1. make dtbs shows warnings  
> 
> > 2. make CHECK_DTBS=y ti/omap/omap4-samsung-espresso7.dtb is too
> > noisy (probably same for espresso10).  
> 
> > a lot comes from the dtsi files, so you need to ignore a lot,
> > probably either strip down the new dts to almost nothing besides
> > dtsi includes to determine the background noise or take a similar
> > device, redirect output and errors, diff that output with the full
> > devicetree. I am trying to clean that dtsi warning mess up,
> > linux-next shows a lot less warnings but that takes time.  
> 
> Oh, I was not aware of such tool, ran it and yeah there are a ton of
> warnings, where can I ask for assitance if I need it while fixing
> them.
> 
I hope you understood that warnings like this:
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb:
/ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/pad_clks_ck@108:
failed to match any schema with compatible: ['ti,gate-clock']

are not the ones you need to fix, so just the diff between old and new.

> > One of the warnings that should be fixed:
> > dts/ti/omap/omap4-samsung-espresso7.dtb: lvds-encoder: compatible:
> > 'oneOf' conditional failed, one must be fixed: ['lvds-encoder'] is
> > too short 'lvds-encoder' is not one of ['ti,ds90c185',
> > 'ti,ds90c187', 'ti,sn75lvds83'] 'lvds-encoder' is not one of
> > ['ti,ds90cf364a', 'ti,ds90cf384a', 'ti,sn65lvds94'] 'lvds-encoder'
> > is not one of ['thine,thc63lvdm83d'] from schema $id:
> > 	http://devicetree.org/schemas/display/bridge/lvds-codec.yaml
> >  
> 
> Ah right, I have to add the encoder (doestek, dtc34lm85am) in
> bindings and in vendor, this patchset may grow too big I assume.
>
You can do the binding stuff separately, lvds-encoder/panel should be
trivial, so one patch for vendor prefix if needed and one for the
binding.

Regards,
Andreas

