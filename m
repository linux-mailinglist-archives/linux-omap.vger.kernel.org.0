Return-Path: <linux-omap+bounces-5282-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DCDCE727A
	for <lists+linux-omap@lfdr.de>; Mon, 29 Dec 2025 16:02:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B61A73006A4A
	for <lists+linux-omap@lfdr.de>; Mon, 29 Dec 2025 15:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FCDD257825;
	Mon, 29 Dec 2025 15:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="HL+Rx8ST"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E7C24A044;
	Mon, 29 Dec 2025 15:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767020509; cv=none; b=sDiHS9M+cllbiS6FJBK3BgrsUWhJS2Eegwbfd/RY+TxSZkF/hFxQC7ROzO5/f7wBbIljcoBmvQWZk9x0nOwd2zX29uRdrjSVpol6XiASbYJlYMKx8yoAdHg3NGFZAPOKJ/6tBX1aH7vvys4/Wx7JsA8mVw3aItdBZr0J18A+OQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767020509; c=relaxed/simple;
	bh=C5iBr5GWeiXZFkINEbKmDmfr5VJZa0HoaYsTvQpUF0c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cdr3OheSwsiGZPskT3N2Nu6pqvG4Ht9RDC9QcjpmKUEkFw1ajfeWTdUyHzIcOmhuzpEV2iUT8vwwSBfpDHuXM0ilP6VXc8iHtIuBW6YsQ9MNHsWGaG5izMGMWnf8NZWGEblPYKQLrP0B1qwpMJvzLgeIJ5jGM7HsZhPNpTefAjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=HL+Rx8ST; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=r7P4BnxtygMHZt++lRZjkLMgx4KWisDFtgxDz9Xl3S4=; b=HL+Rx8STX8OUG0jcLcLQvb+cDz
	gueI4TrgeLTsPFvUpIe1h3S42aEbwGOc4hQZiGSdczcoA8tPIb/A1F34xDdQvv+5fc2qOmpeTx8AY
	Ll4XbYhW3UW5CBVixzcrYAARc/LAlZsbWGmrbiw7N9IbIqWeV+IBQFQGnLZXPcgLXRrSaxjgEjZaj
	oDpDjYg9kpb/Hqaei3qQTfWzkNtxOCj6fUiFCMo3rwmNalf+nJsdwYiCIvHsTMHlG8IOjQ4MCEztI
	eBR3Y9XRzTqQAyyS9o9n8MtOkehzgq6QoMEn54Bq7BMPbeqGBUC3bqx/xrVMlPeNsMsd155pZnTPK
	2Bens/rA==;
Date: Mon, 29 Dec 2025 16:01:43 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Johan Hovold <johan@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] bus: omap-ocp2scp: fix OF populate on driver rebind
Message-ID: <20251229160143.7a637715@kemnade.info>
In-Reply-To: <20251219110119.23507-1-johan@kernel.org>
References: <20251219110119.23507-1-johan@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 19 Dec 2025 12:01:19 +0100
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
> Cc: stable@vger.kernel.org      # 3.16
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by Andreas Kemnade <andreas@kemnade.info>

