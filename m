Return-Path: <linux-omap+bounces-2545-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C871F9B7565
	for <lists+linux-omap@lfdr.de>; Thu, 31 Oct 2024 08:33:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05EEF1C24A96
	for <lists+linux-omap@lfdr.de>; Thu, 31 Oct 2024 07:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6B1149C7B;
	Thu, 31 Oct 2024 07:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="QB1HPFBL"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E2A12CDBF;
	Thu, 31 Oct 2024 07:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730359977; cv=none; b=JhHJfTXAown/9XvUfoBbTaaszKXpWGhMkudY5xsXdtoA987had4dtsjWWnwvEmJl1Q7pf9wBUV8Q8fxQ3DuJbhrG9uSDNAb/n73zB0Rhf/w7wbCvhYI/Kg2k04o47linPRHnKUJGSFeNR9HLAJrpzq2Ak/5pRr/V7JKcLX/nXVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730359977; c=relaxed/simple;
	bh=ZCZgVRk+zO7UMA6+ytUIaXNf7YEOn7KOWBHyoaTQF/U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o1kEjcNlhwN9Gk8s+YVE98gUc0tIxhWL59eb6gXRM4BNUZpaBEpGzjU7VuxGI5V+FG4Z4lyrxmNESCL5JTF3Qk3Np49+SWzkyGT5/0OuWSQ8gZ9LobNRAbsOPuXkiX449Mx+FHQ+HBIa4xBbVfC9jahlgd6HnYiMVYPacOpqrH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=QB1HPFBL; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=VcSkoPVnn13uM0IHmlXrzCxiaYdSJeBZvUKAKpZqyQc=; b=QB1HPFBLAaHKD7cfINabzvDIPX
	SjYJNr/GerRzuRqyA6cGsujAemzS+l5z1zsPCrmd2ynP2Ceau9FeXagO71rlGvRJnFoouFV+E98xB
	WXMKGq9BLNBaPTgoIGlU3rQBGenE4CTGiddBg0iDhhPGQS/SSu6fHCvPaLbvhiqAvpjKkcL0efLLT
	posLKiGJo8v/iKd/upZFQY2p6SZWYk197NeTbSVJoic8NWIkZRMFmO5BTLgZ7Q3KWbnxjmthoBZXv
	J/1U6S0dG7hRKe5Mpo11yz3qujPiSv/GvPPSodopt4MYw9Vppit1/2WQEVsozLJKiGdDqkSuu5h8x
	WXRZXVZw==;
Date: Thu, 31 Oct 2024 08:32:48 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Mithil Bavishi <bavishimithil@gmail.com>
Cc: aaro.koskinen@iki.fi, conor+dt@kernel.org, devicetree@vger.kernel.org,
 khilman@baylibre.com, krzk+dt@kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, robh@kernel.org,
 rogerq@kernel.org, tony@atomide.com
Subject: Re: [PATCH v2 2/6] arm/dts: Add common device tree for Samsung
 Galaxy Tab 2 series
Message-ID: <20241031083248.043d25d0@akair>
In-Reply-To: <20241031065524.546-1-bavishimithil@gmail.com>
References: <20241030234219.2d918b34@akair>
	<20241031065524.546-1-bavishimithil@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

Am Thu, 31 Oct 2024 06:55:24 +0000
schrieb Mithil Bavishi <bavishimithil@gmail.com>:

> > this has to be system-power-controller;  
> 
> I am so sorry for the mess up, I was on the wrong branch which is
> almost the same as pmOS but a bit older, hence the entire mess up.
> I'll run a quick diff from pmOS and this patch and fix them
> accordingly.
> 
> > There is still a lot other stuff to fix here but I want to make
> > sure we are looking at the right thing.  
> 
> Could you please go ahead and mention them as well.
> 
well, that takes time, I wanted to start that on the right thing.

1. make dtbs shows warnings

2. make CHECK_DTBS=y ti/omap/omap4-samsung-espresso7.dtb is too noisy
(probably same for espresso10).

a lot comes from the dtsi files, so you need to ignore a lot, probably
either strip down the new dts to almost nothing besides dtsi includes
to determine the background noise or take a similar device, redirect
output and errors, diff that output with the full devicetree.
I am trying to clean that dtsi warning mess up, linux-next shows a lot
less warnings but that takes time.

One of the warnings that should be fixed:
dts/ti/omap/omap4-samsung-espresso7.dtb: lvds-encoder: compatible:
'oneOf' conditional failed, one must be fixed: ['lvds-encoder'] is too
short 'lvds-encoder' is not one of ['ti,ds90c185', 'ti,ds90c187',
'ti,sn75lvds83'] 'lvds-encoder' is not one of ['ti,ds90cf364a',
'ti,ds90cf384a', 'ti,sn65lvds94'] 'lvds-encoder' is not one of
['thine,thc63lvdm83d'] from schema $id:
	http://devicetree.org/schemas/display/bridge/lvds-codec.yaml

Regards,
Andreas


