Return-Path: <linux-omap+bounces-3915-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8FAAE043E
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 13:48:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8A4016CA9F
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 11:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516CF22DFA4;
	Thu, 19 Jun 2025 11:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VK7zKQqd"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFD52253A5;
	Thu, 19 Jun 2025 11:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750333688; cv=none; b=HtwiGbcoKr0XV5pnDxN4ER2qWUxiVQv4X//1rG8s+mL6L9b8plnLrBaoZZIKPZOajaD+nlBb/7JNP+Qcie71iYnsnIksJ8MaWJ1GDQMSOW+Y7e2Z3dVzOkOwzweDVL6zd/jIk1vrtxxEIbqHigCUfZUt+taP+4VOUWVGwfqVi1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750333688; c=relaxed/simple;
	bh=JkXoITyKy8DmJddDXIx6xoQAWgCNh9p4zc7FYc0W9Gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L09yx8ZVqc4lF9g8m/ahJXC+bL03WFdnqlGVSmn8wIm+N9bAYVjUSUVpxAzsRqPih0nG0tnBW1gAzmd9S5kTNua7EwheVWD9HKNJTHYr5aRYh05FCUY3tkZCGrfpIfF0dReVylByUm7hQkyW1jotTzmKWvhg2LHnmIXHeugIT80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VK7zKQqd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9965CC4CEEA;
	Thu, 19 Jun 2025 11:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750333687;
	bh=JkXoITyKy8DmJddDXIx6xoQAWgCNh9p4zc7FYc0W9Gk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VK7zKQqdXUrQP186VowAQXek/ADtQwECyY0mbmnq+aSMNfgdV1gC52Ayzy0VVumwr
	 g0JtdAkzwU9sewMZEYmjYeAuWtzzl8RkNgL1UhDmjivc7pl78JNRGS60lPNoKz45bi
	 QfKKJwKkDD5bS4Fj50nv4M4ql+XChPv84QnXmscsvIFl5j/XoHak/iTMIUvMmUfqlR
	 eWIxdiaEpr1lynZET5gsPQmDJ78+vXt6xpFhPdC/gVxix2AruS8jgPWQf4qkVxeBpO
	 wVVd/Wr3LmjyMGR9c5buoky8o9JGyvSQ2GSl3b3cAjnj9sU+gbBd6FokGUdD3EEj/G
	 2jPcr3w1irA0w==
Date: Thu, 19 Jun 2025 12:48:03 +0100
From: Lee Jones <lee@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH 1/3] mfd: tps65219: Constify struct
 regmap_irq_sub_irq_map and tps65219_chip_data
Message-ID: <20250619114803.GI587864@google.com>
References: <c4abceb95665e4363937a1f41588772f38c47411.1749998382.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4abceb95665e4363937a1f41588772f38c47411.1749998382.git.christophe.jaillet@wanadoo.fr>

On Sun, 15 Jun 2025, Christophe JAILLET wrote:

> 'struct regmap_irq_sub_irq_map' and 'struct tps65219_chip_data' are not
> modified in this driver.
> 
> Constifying these structures moves some data to a read-only section, so
> increases overall security.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   27413	  10272	    256	  37941	   9435	drivers/mfd/tps65219.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>   27893	   9792	    256	  37941	   9435	drivers/mfd/tps65219.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only
> ---
>  drivers/mfd/tps65219.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Set doesn't apply.  Please rebase.

-- 
Lee Jones [李琼斯]

