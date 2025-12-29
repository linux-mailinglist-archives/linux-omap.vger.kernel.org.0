Return-Path: <linux-omap+bounces-5283-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 331F9CE7289
	for <lists+linux-omap@lfdr.de>; Mon, 29 Dec 2025 16:04:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 903D23001628
	for <lists+linux-omap@lfdr.de>; Mon, 29 Dec 2025 15:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D19313E28;
	Mon, 29 Dec 2025 15:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="clbMGhw5"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDE021C17D;
	Mon, 29 Dec 2025 15:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767020677; cv=none; b=OFNI9BTomKBcu3Y+7D60zBipkbXEV76wlmpxdFprb4q4pl+aS/aofRCggXtGa41cfn5WWIjU6kmEZNMLKt0SUwvUyTn6xcgaqsPsvwOe56AbDcLfB/kLCrVgqsI6FfKI5GlcOSaNFPYX49G39jq4Ev14okckj/tOmNgAZ0M9EMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767020677; c=relaxed/simple;
	bh=ffAfctBEOtShV/CsUdFUBPZKjihHSjQv9zn7lotGbx4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OKerbSe30a43x0+IrFFVcC9dRxb8JI+fpsulXHR7gm1HyFh+65WIt+a6gv/Rvo9St4iK6NE7qIbkhFkYtJj/Dm2EK5r/kjfLG1DYVsFEbnX6FTDDjT6zPU+7Fle7DcBOp7Q8cPXMKxRc5N5zaDRkz4IX7B9aueJpyhsY56g6HM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=clbMGhw5; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Pj2YJ3RgVX/wiQ7XqBen+pAXaMfCpbAW1WIiAIbHunQ=; b=clbMGhw5nLhuSwtrL0eh9/E7I7
	XYlEUizW+wX0ZyRH8tDBH1/B2jJ9sN7Hl1ulCM1M1l0IByfHZ1i5YaXBAhFnnm3bqs9shq7knTG0/
	0ozioKGSEHbBI39MCwurmOSLADwkF8nndXrh3xfhuiBSCVlx5ud+fpne4pQdIqcblcnff1EbJFroz
	8IYxM7lXsF5oomb/KKXVdlS+yVTJPWB+MTOHp+WZK1LzJ4P6Hl47z9YjsyT2TrUOZ55K0gjYM9vin
	RVrEyaoM4vCot59hTvtALWDW3exhuGTRXtJkoXFOeHQqVIyLAvxVjVcQzs1iUjHFgC2fKy2fWJA99
	7NkHw2aQ==;
Date: Mon, 29 Dec 2025 16:04:32 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Johan Hovold <johan@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin
 Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony
 Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] mfd: omap-usb-host: fix OF populate on driver rebind
Message-ID: <20251229160432.3befa372@kemnade.info>
In-Reply-To: <20251219110714.23919-1-johan@kernel.org>
References: <20251219110714.23919-1-johan@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 19 Dec 2025 12:07:14 +0100
Johan Hovold <johan@kernel.org> wrote:

> Since commit c6e126de43e7 ("of: Keep track of populated platform
> devices") child devices will not be created by of_platform_populate()
> if the devices had previously been deregistered individually so that the
> OF_POPULATED flag is still set in the corresponding OF nodes.
> 
> Switch to using of_platform_depopulate() instead of open coding so that
> the child devices are created if the driver is rebound.
> 
> Fixes: c6e126de43e7 ("of: Keep track of populated platform devices")
> Cc: stable@vger.kernel.org	# 3.16
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

