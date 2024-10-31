Return-Path: <linux-omap+bounces-2547-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEDF9B763C
	for <lists+linux-omap@lfdr.de>; Thu, 31 Oct 2024 09:19:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C68461F2318A
	for <lists+linux-omap@lfdr.de>; Thu, 31 Oct 2024 08:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51221154445;
	Thu, 31 Oct 2024 08:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="erS7NAdX"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FB67E59A;
	Thu, 31 Oct 2024 08:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730362777; cv=none; b=YdotM2A+tWEmaRjhizyzdoO6WKHxxJVoK+9fM65k05cY6ZNP7LwJcxHF+C5UGieTEvBEHuJENvdO1jEvBZIhUTc0FY2z5gDrLo+QqbJuAiKnlWZl+Pqj7mmu9G5CW8VPheUrgd4yLbhzduUm+LAcEzOAI25UGjyFt29fmd/0tro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730362777; c=relaxed/simple;
	bh=tg9dTDPcw2EBzNpsfuZFb+zhda1t5DBSRUS9KYVQfqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qpHQz2CaA8WWyQvfH2wKbJP0rp8dRFhP09pxqnHMIBAl2kVienlVqNGe1ywUkam3sxiEtjXys9alUBFAbkOM1kPQyNgDRikGkJAhq7q5RvoM/iPg0Bpc2jsD8zWg779LChjRJ3SQxac0SM319W5FxXQ/W0HApc/ff83RxF95ypc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=erS7NAdX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81BD0C4CEC3;
	Thu, 31 Oct 2024 08:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730362776;
	bh=tg9dTDPcw2EBzNpsfuZFb+zhda1t5DBSRUS9KYVQfqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=erS7NAdXxoaq2JzyeAxUuQTsQi5ZOyUvIpqf3lC9GnDkWoFxczMqlExILPSvNUN7r
	 b4i4iLUv3PagP8fupDURkAwWNsz6lyx22gQMg3Lkjw6Izz8eBfE5aERcE+l/SWJA+n
	 bw0Xg8VX57MFGW9Zlu9IF5bb0FfSFa+ND072qykaQIyGxMXBbj2euxo9qlrDJS2QdL
	 hkZMaEkCAWv9o9/Axc3Fy5dBJCDaUFdcoBfBOc1i0iuyD4yJfIYuvOZBfuyIXlKdwR
	 bIISrN0twvrLE8xtC9qYBLp6IMdxBdXqJ9/eF1l15cevV/b7hM85NZuYqUjZlNNJiE
	 211Ef3Z8n+kMg==
Date: Thu, 31 Oct 2024 09:19:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mithil Bavishi <bavishimithil@gmail.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 4/6] arm/dts: Add initial support for Galaxy Tab 2 7.0
Message-ID: <o6gqtqxuv2n73bjohn2zqtvbh5bpwenwqydyululjriveel3dq@ueczn5ht5olg>
References: <20241030211847.413-1-bavishimithil@gmail.com>
 <20241030211847.413-2-bavishimithil@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241030211847.413-2-bavishimithil@gmail.com>

On Wed, Oct 30, 2024 at 09:18:44PM +0000, Mithil Bavishi wrote:
> Create a device tree for the 3 inch variants (P3100, P3110, P3113)

3 inch variants of what? Describe here the hardware.

> 
> Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
> ---

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters


>  arch/arm/boot/dts/ti/omap/Makefile            |  1 +
>  .../dts/ti/omap/omap4-samsung-espresso7.dts   | 70 +++++++++++++++++++
>  2 files changed, 71 insertions(+)
>  create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts


