Return-Path: <linux-omap+bounces-4004-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D283AEFAAB
	for <lists+linux-omap@lfdr.de>; Tue,  1 Jul 2025 15:33:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0BEF7ACBB8
	for <lists+linux-omap@lfdr.de>; Tue,  1 Jul 2025 13:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 296C6275AF5;
	Tue,  1 Jul 2025 13:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KWbPdVO5"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD2B275AEB;
	Tue,  1 Jul 2025 13:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376712; cv=none; b=RNV4jTiT453DCZWPkGH149bhgdq4NYVkJxOKq9M31sVhQ/LWj9ofPUdWaFhMrgwE5R4197nhVNCsNwcDSpiN1U4m15MSIHAdmWzrF56b6ho57gwQ9kh2yQ8vOxf/p/j0W7OPAxeY2dvwqhcxE7+FYTQlu+4UtIDks0t+kplzKIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376712; c=relaxed/simple;
	bh=U8b4f/6CxtIpRrDULIVKBBNQZ2cn1XoO/0xEOtCVxSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qhqfAuFPTMYNvsiNZUeh6uTRU0BZTqgRqyNjTfNTYC3zf5VQpOPptUPorMWE2vpEf10vjUiasvELc95k2Bq37Fcm14foiCEgNqwRzUT2gNtF09ASDnp2OPQQKeWG4C+sUErotP6PAAFydltdw/rsRVHf71jEeV+EUwcZVqAemq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KWbPdVO5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8959DC4CEED;
	Tue,  1 Jul 2025 13:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751376712;
	bh=U8b4f/6CxtIpRrDULIVKBBNQZ2cn1XoO/0xEOtCVxSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KWbPdVO5CB0Bxz4zhUJa4RHr6q09FPWOOd5B96g9AWfDlGDzJ/gv9ZPZ2k2qe61tU
	 iHY1VT2mfkaUgvSx5S6GkRy94znlXKZDNnMnVkPQkM6ikoCJSoazA0iXNb/Kfl8/VQ
	 S/8KKWFNUm/r0U+W/T/iy+seU1Oa8yVztfkx27eRFAnCey5iVOdYkIUDB42QRh0aGa
	 Z3LuHYpjjP3un5XWg9kP6xn8hrq1MQ6DY2uLPiWRVVoLbEYgchtX9unD0cGXOYQU5o
	 qGBbuLm90tb0qRyOtDS1WXFWKOKnSvbbLOYBhm9VRlnhl8Y6RShPKGdw49TLD8Q49q
	 czRd4j/MVWoZQ==
Date: Tue, 1 Jul 2025 14:31:47 +0100
From: Lee Jones <lee@kernel.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Geliang Tang <geliang@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: (subset) [RESEND PATCH mfd-next v2] mfd: Drop unused variables
 'node'
Message-ID: <20250701133147.GM10134@google.com>
References: <a2cc3ac9466633ea44a656a855ed80289ae917e0.1750905716.git.tanggeliang@kylinos.cn>
 <175137657148.2321363.112208113279845572.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <175137657148.2321363.112208113279845572.b4-ty@kernel.org>

On Tue, 01 Jul 2025, Lee Jones wrote:

> On Thu, 26 Jun 2025 10:48:07 +0800, Geliang Tang wrote:
> > This patch drops the unused variables 'node' to fix the following build
> > warnings:
> > 
> > drivers/mfd/88pm860x-core.c: In function 'device_irq_init':
> > drivers/mfd/88pm860x-core.c:576:29: warning: unused variable 'node' [-Wunused-variable]
> >   576 |         struct device_node *node = i2c->dev.of_node;
> >       |                             ^~~~
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] mfd: Drop unused variables 'node'
>       commit: 0e76098aa66eb82189f5a0681717862271bfb805

Ah, change of plan.  Arnd already fixed this.

-- 
Lee Jones [李琼斯]

