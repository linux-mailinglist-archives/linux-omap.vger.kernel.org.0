Return-Path: <linux-omap+bounces-3282-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C06A2E8C6
	for <lists+linux-omap@lfdr.de>; Mon, 10 Feb 2025 11:13:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1C151882E25
	for <lists+linux-omap@lfdr.de>; Mon, 10 Feb 2025 10:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71DD61C5F0F;
	Mon, 10 Feb 2025 10:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DPLdlsJ2"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D05E14F70;
	Mon, 10 Feb 2025 10:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182408; cv=none; b=f9XMml8rS5zLmvgKcyYhc1/2vN/JuVvnt6vctqmeyDIqzTOjLTPpJL8m8M2rim+ttJpGS9NRYIgcIH6v8ZTkfFIBVFAs/h1F/xJd6Ko8KwFAa6MUKLWSFc701vVLNG5ZBcSKAHM6xTAVDLp07nzafF2ckUH7HBI9p475omLLP2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182408; c=relaxed/simple;
	bh=RSzTJjYfjPvNiwHfTBylUjfRwEARiQc4CXH7kfHiXxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iFPmdQmShiQZEB9YdHXWu9mUysT4CkRRc67pQ/jaAYzpdX/e/Yg086vIRU/cH830f1C0L3HmHzSq/uBwx5Luswi6GgnBweHjBUr8kagLx32Hrt2eHOrPC0pMbGpeQ5DXBbmzjH5KAWlEFTAlybamqzB/CQwvvR/NO6NJbw6TI3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DPLdlsJ2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 543B6C4CEE4;
	Mon, 10 Feb 2025 10:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739182407;
	bh=RSzTJjYfjPvNiwHfTBylUjfRwEARiQc4CXH7kfHiXxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DPLdlsJ2eGLL8SjwTlmLtdwNWoonVKQsDTfZVrHnAFCH0TM+ROKSLkz37OepozWpg
	 GqKINU5p7CvOibNJ6G/1fXhSBVKYn2OAsKGbo2Gb/bH4D4BnkgXQfa2vIw3rufYx03
	 iFjyBNvGFDNs0fPvaXpUg3BJMpHSjVpwZJrgnOAY94hbLkRl5QsluSK16V5XQennky
	 WcZo+VSqV6HI9zMwoWUKR2Dm2d14xA3QfdPKkF2bIouYHg2VNOB3Ay8gPbkmkuukmB
	 YtQtY6F9v48hlF4l0Bk0i9HRwU3JdXqRV0VxrLLknN6KpjqTJEWMZr92YVB4fn94n5
	 SgWt4fT8p/btQ==
Date: Mon, 10 Feb 2025 11:13:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, aaro.koskinen@iki.fi, andreas@kemnade.info, 
	khilman@baylibre.com, rogerq@kernel.org, tony@atomide.com, lee@kernel.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	m-leonard@ti.com, praneeth@ti.com
Subject: Re: [PATCH v5 2/5] regulator: dt-bindings: Add TI TPS65214 PMIC
 bindings
Message-ID: <20250210-masterful-pastoral-perch-7870c4@krzk-bin>
References: <20250206173725.386720-1-s-ramamoorthy@ti.com>
 <20250206173725.386720-3-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250206173725.386720-3-s-ramamoorthy@ti.com>

On Thu, Feb 06, 2025 at 11:37:22AM -0600, Shree Ramamoorthy wrote:
> @@ -102,7 +106,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: ti,tps65215

Just make it enum in the first patch, so you won't add line and
immediately remove it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


