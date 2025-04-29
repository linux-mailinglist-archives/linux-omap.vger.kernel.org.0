Return-Path: <linux-omap+bounces-3625-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBE9AA1286
	for <lists+linux-omap@lfdr.de>; Tue, 29 Apr 2025 18:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13854163052
	for <lists+linux-omap@lfdr.de>; Tue, 29 Apr 2025 16:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7890624E4C4;
	Tue, 29 Apr 2025 16:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="CbMj1bGv"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8007624C08D;
	Tue, 29 Apr 2025 16:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745945591; cv=none; b=V0xE8LNupGpjSrkn8T8fiUnRt1b2mJYwHwUmge3OTc+UQMXeB9S9Z8t5lIa2j4jjrcdD1yXsDGZBm+B/m6a4MHM/B6DSd4M65Qsv3vm6tabzYRrteIZt5HFDtCr4glGlU3KZZ1kpUFLI7NxzmuOsP7R0fwIsP3CedgdCaMAWg9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745945591; c=relaxed/simple;
	bh=+hdnXxC4NDXKRuT9lf143RB20lIGAAYL/7bIxsAcRxk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ek+4Zq+s0X9SORTNaL6wUk4cMAxnmsVPgvVo4DM31+peTzD8oYv3F4FMw+qOvwstT2/773YiKFrTSQRGpzfo00jVXhzmK/iMDS3ih5uLskkFrGFZNUxqSUDiGgIo7oRN3SEvr4VxFcW4yCC6x6xXox/StD6QFj1RXIJMFGkiDL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=CbMj1bGv; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=BRcdsk3TvN9DaRVrtf6cpw/TXDjhWY1fpqAdozY9Je8=; b=CbMj1bGv+IDiuOe7R1UP+3WL+L
	Ydm6RfJ6+DMJ8mQuvD3ph9vGzJqtzdNisv9ILwwp0UPRwqY5Iow3eeD256Jt8SIrTHzGfTTOJ355x
	B65qbfTWCcMCK7XdV7tm6xkxgYJH19FqETb9tk8uyJGeGNhwbwg7LFTCbsmGH846xIROGXrQeYUSr
	XNiDFqKxjj2ZQmYEFaaEctxRGJMEJ7Hg7SomZUyc/0/23P/pEegMfVpF0pCJKpRC6z3W9VcuKkz4X
	SVnl3pPRFQS1wPd9W8H5FpdAvbU3KVYaHMJsVrNPKND8CoKBGI4rJ3H78bv5UTtNwOvjWdj+conKe
	onqFKxrg==;
Date: Tue, 29 Apr 2025 18:52:40 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Jerome Neanne <jneanne@baylibre.com>, Shree Ramamoorthy
 <s-ramamoorthy@ti.com>, Mark Brown <broonie@kernel.org>, Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo
 <kristo@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: tps65219/am62p kernel oops
Message-ID: <20250429185240.6a7644bf@akair>
In-Reply-To: <aBDSTxALaOc-PD7X@gaggiata.pivistrello.it>
References: <aBDSTxALaOc-PD7X@gaggiata.pivistrello.it>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Tue, 29 Apr 2025 15:21:19 +0200
schrieb Francesco Dolcini <francesco@dolcini.it>:

> Hello all,
> while working on adding support in mainline for a new board based on TI
> AM62P SoC I noticed the following Kernel Oops.
> 
> This oops was reproduced running current Linux
> master, 6.15.0-rc4+, ca91b9500108d4cf083a635c2e11c884d5dd20ea, but I was able
> to reproduce the same with 6.14.4.
> 

[...]
> [  +0.000022] Call trace:
> [  +0.000011]  regulator_notifier_call_chain+0x20/0xa4 (P)
> [  +0.000018]  tps65219_regulator_irq_handler+0x34/0x80

wild guessing: maybe because irqdata->rdev is not initalized in
_probe()? At least I do not see where it would be initialized.

Regards,
Andreas


