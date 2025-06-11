Return-Path: <linux-omap+bounces-3825-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 938BEAD4F5E
	for <lists+linux-omap@lfdr.de>; Wed, 11 Jun 2025 11:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E6517ACA97
	for <lists+linux-omap@lfdr.de>; Wed, 11 Jun 2025 09:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3384A253953;
	Wed, 11 Jun 2025 09:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VmeNnFz0"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F4B13AA53;
	Wed, 11 Jun 2025 09:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749632814; cv=none; b=MPPbbCR9fj/k+/W1V/4r/SiRSMbtGWemkKnXQp22a62ng8A8Ld/AlJgeTyWQIIuCeBgiFSo0QLQmWvn50QAWmPleXMoUnhHmI2c7dIz59pMqy03t5CJj6X7xAg3HcpmKlBud/Coq/od0F1yTgNSmbxBsESSpEvWp8Mdk8XdVxP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749632814; c=relaxed/simple;
	bh=O0uQCkVF2DF0j/u8y3WHsonkojrCpDOW+gMtxCpHxYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZrZhKEwcdHSx6p8sazkmh7+PvR1P27KYoRSBqXuS2eeTMmpqrewYoPCR84SxnlROt2PQ4Lx92kOuE6O1/vka5cidvmvg8xFaKuCtGaxkbYKA1Fn2R/TFew62Ew4gfIKM15S+uXPvn9PSL9bHZqqkSQotQ+1UyQmf07yPg1jC68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VmeNnFz0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0000C4CEEE;
	Wed, 11 Jun 2025 09:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749632814;
	bh=O0uQCkVF2DF0j/u8y3WHsonkojrCpDOW+gMtxCpHxYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VmeNnFz0+/K5eSgh8l9OZLPHDZUhrvOiw0gJVG/B6B1SroJCxbdfVNm1J8SJ5N2ww
	 y5geFDy8k8v7zyaOon+Rf//Yknp/aYhFeC6KzgB7LpKi1/fN1fJ6WXQIqM8ze3kkNZ
	 VMrokQj4jMkV3gqbOyop7nZbrk589Y9mouQ1Gf4NYW/z2FBsR9ihPaLwqK9upaRECc
	 6ll3JEDg2di9UY3NSrpVZ83eAylG6S4jgvMjGfoGj4zmys+c304iwEv3/YaliFFeta
	 kFAF59JEIW/sqzdWSmuEJ8LwWcVtbfhRon5BGhRGJxeG8wHypFvGfEcPpNMjXAGNFl
	 PgLsvxIdBbcXQ==
Date: Wed, 11 Jun 2025 11:06:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Bajjuri Praneeth <praneeth@ti.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/5] binding: omap: Add lots of missing omap AM33
 compatibles
Message-ID: <20250611-purring-ochre-basilisk-3fd08c@kuoka>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
 <20250609-bbg-v2-2-5278026b7498@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250609-bbg-v2-2-5278026b7498@bootlin.com>

On Mon, Jun 09, 2025 at 05:43:52PM GMT, Kory Maincent wrote:
> Add several compatible strings that were missing from the binding
> documentation. Add description for Bone, BoneBlack and BoneGreen
> variants.
> 
> Add several compatible that were missing from the binding.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Subject prefix is: dt-bindings.

https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

Best regards,
Krzysztof


