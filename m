Return-Path: <linux-omap+bounces-2296-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8FD98D43D
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2024 15:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD0371C21455
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2024 13:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE2B1D040E;
	Wed,  2 Oct 2024 13:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="TqhAjSHl"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9492D1D0405;
	Wed,  2 Oct 2024 13:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727874828; cv=none; b=cxrrSSgyG76RcavT4n+M59DeYqdKAgktIm5hSZkLK7iXdMfkhD08MGUYiCdb8t3OF2QFqUJqrFZzd2GaXthDrLFeAJlSK+/cMRalS9i0zeiIGzE/8ivsV6pri2pmsL+Dj3YbzKAq+NL3ES6lFFidfVd9NRufGyFqT449qF2GKgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727874828; c=relaxed/simple;
	bh=2pTaB3YQj/cIj6lUaDgW46LNPjiuya0wNVrjB2GmlKI=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KGgi7MvMgqGLjeGTB2Ccphe4+CekOJG4fDxBdZ5AHn1PDnydxsYOpxobwS6AP2V+YEezbfr0CmeNjhKnVUV1QnspA6Y7W55V7Lum9nGOWsGlJ5+n8eWNV5UAfMBnO5aJU3i4qUAoZL/8RdKr3hpmtopw5xkqJ1/a9BhiDF7Yzl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=TqhAjSHl; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:From:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=hmvX6lXsNfi6ycZrPvAYUCXL1dG5MNTD+saDjh/8h5o=; b=TqhAjSHlMxXXRCdXtoNoo7J6Nq
	aH7+LhKRhrx+e9EInGZ0kF2377OdPdsrfCVlhbKFjytIs7Fhrz8aW0ubo7M1Km4v3DTuVisoi2G53
	TA8C3NXOXSF56qRhjkBZs4YYD/ISLRFqDY7xQepudqJ2ZX/RUEHL2lO5mbISFN+fxgr6QavzjiVbl
	8HH2NzPXYGibaO5ppNCWD9AU69oWr/F6OdXUExSfN7A8rVTzJuh2zU45JLYEnoZjkF7WAXHPnwrAk
	+BRH+71jqR20gX9qF1eClsLh7U3d9LLJOaFA3QOcaaQXFDECaYDs+nUY7U5+HiOrPKZcRhn66C0Re
	X15U5RSA==;
Date: Wed, 2 Oct 2024 15:13:41 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Stephen Boyd <sboyd@kernel.org>, Tony Lindgren <tony@atomide.com>, Aaro
 Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Lee Jones
 <lee@kernel.org>, linux-omap@vger.kernel.org, Roger Quadros
 <rogerq@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v2 0/3] mfd: twl: Add clock for TWL6030
Message-ID: <20241002151341.2c8421bd@akair>
In-Reply-To: <20241002110718.528337-1-andreas@kemnade.info>
References: <20241002110718.528337-1-andreas@kemnade.info>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Wed,  2 Oct 2024 13:07:15 +0200
schrieb Andreas Kemnade <andreas@kemnade.info>:

> Previously the clock support for only implemented for TWL6032 so add
> it also for the TWL6030. There are devices out there where especially
> WLAN only works if these clocks are enabled by some patched U-Boot.
> This allows to explicitly specify the clock requirements.
> 
oh, forgotten the changelog:
Changes in V2:
- cleanup some defines
- no separate ops for 6030
- remove is_prepared()
- update Kconfig

Regards,
Andreas

