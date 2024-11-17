Return-Path: <linux-omap+bounces-2703-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC569D0635
	for <lists+linux-omap@lfdr.de>; Sun, 17 Nov 2024 22:23:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 386281F217D7
	for <lists+linux-omap@lfdr.de>; Sun, 17 Nov 2024 21:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67FF11DDA3D;
	Sun, 17 Nov 2024 21:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="84smE8WR"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B32C1D90D4;
	Sun, 17 Nov 2024 21:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731878580; cv=none; b=hADFUKOlmALGi3DyxK881ukcXdP7LxROCTi5sSJVSAGugZ4WZNUbIRVraq30CDH0tR1zv41GKGMNYrpPKvFJcpCSCVj0ZRuW9J5FXejS3cEQSu+hjO62hSHjhMm3syvo20iChatZq+zEGFQMgyjGXsrUHS8TmGetkhYNFY5G/Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731878580; c=relaxed/simple;
	bh=YLggjynJPgVDmVhvTUsxJne55hppKvPWX8tNOkJTNuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Eaw/0CJjeuzIg9Nrhfd4aO5Ck2tWb46ftI/9aNG1HbDiAoPBEF4q4BaCYMD2avxQOyRsPdcb7b9J0mNjGARdg0Tk9xdgMuoodmnpR67i17pi84ZT588Eci6Ly7EKH42oiZrq/GFHkEGX2u9LwFeAasP6CteInQ1sWHkF1Fg1ZpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=84smE8WR; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Oka4/LOj+xRmPxvfYg/1XFFMYiAPQZp1ilukkmZN5zI=; b=84smE8WRj2Mw3d+ZxzRcfgWzPs
	o5uBVXjEs577uSjOkfPhTdRNIl6pf4t4TxaVuOfeDphMCgZyRjDpGs+rsw23Z3NgswUqD4aAa9AiN
	m0XH+511IPjDZD+ZAFuooeXZzA2CgldVYPjwgmFgVYyfQagjARWALv8Gg8S3n5tb17gBV5uDrKZIW
	iA4u41bSCOklpffLgX1cK0NrWEYMIKH+saSUCwIYxzKIcfndaCyJKcWKawgalqCE3VixgeDt6zZEF
	Zdq0FlfkjZb+idjXrwXZzbCsez+ubonC+2OXC15gl3GomPRWbRE0P/AK3i7NTs5dudqt/vH0L+Dt/
	UJEcZUmg==;
Date: Sun, 17 Nov 2024 22:22:37 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Tony Lindgren <tony@atomide.com>
Cc: Roger Quadros <rogerq@kernel.org>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, hns@goldelico.com, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 aaro.koskinen@iki.fi, khilman@baylibre.com, stable@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: ti/omap: gta04: fix pm issues caused by spi
 module
Message-ID: <20241117222237.01a9b0b5@akair>
In-Reply-To: <20241117111903.GB23206@atomide.com>
References: <20241107225100.1803943-1-andreas@kemnade.info>
	<b26c1fa8-b3b7-4aa9-bc78-793ddfa3bc6b@kernel.org>
	<20241108184118.5ee8114c@akair>
	<20241111150953.GA23206@atomide.com>
	<20241111193117.5a5f5ecb@akair>
	<20241111234604.66a9691b@akair>
	<20241116212734.30f5d35b@akair>
	<20241117111903.GB23206@atomide.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Tony,

Am Sun, 17 Nov 2024 13:19:03 +0200
schrieb Tony Lindgren <tony@atomide.com>:

> * Andreas Kemnade <andreas@kemnade.info> [241116 20:27]:
> > mcspi is per default in slave mode, setting it to master solves issues.
> > And that happens when the driver is probed because its default is
> > master.  
> 
> OK interesting. Maybe set up a quirk function for it in ti-sysc.c.
> That way the mcspi will get idled also when set to status disabled
> and no mcspi driver is loaded.
> 
First of all I think if status = "disabled" then no pins should be
muxed to mcspi. That prevents all mess.

So the only case left is spi enabled but no driver and CS input is
active. If we configure things as master via a quirk if the setup is
slave then switch something to output which should not be. We would have
some output againt output situation at least for a moment.

Maybe pinmuxing stuff in ti-sysc? Hmm, I am really unsure if it is
worth it.

Regarding the GTA04 case:

mcspi1,2 and 4 are not muxed, so that issue occurs only with mcspi3,
and therefore the most simple solution is to mux it to mode7 as sent
in the v2 which should also be suitable for -stable.

Regards,
Andreas

