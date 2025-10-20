Return-Path: <linux-omap+bounces-4723-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A25ABF1D5F
	for <lists+linux-omap@lfdr.de>; Mon, 20 Oct 2025 16:27:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4699F4ED989
	for <lists+linux-omap@lfdr.de>; Mon, 20 Oct 2025 14:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91D683254A1;
	Mon, 20 Oct 2025 14:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B+f13sey"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E5A2A1B2;
	Mon, 20 Oct 2025 14:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760970433; cv=none; b=n9s6NJDkISMJxVuuWrJX4V1PW/r5z8BgOJveFMtKGpNAYyca/5ZOxTsL9uX/9JC0MvZxwOtHto881OUhnKVDqRmVwtRKBg3Dm94gFhwK8m0mA05+PbeyHQLBOzn2BRj10bCp7Hh77TzCqcyxuhshZaFwn6nf/rCxGXutvUPAyB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760970433; c=relaxed/simple;
	bh=e3Nou+Q4E5SIque6x7KS5r0eaKpTjh9QBqBmU8tiWLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNcNznwZhAwp7/+Ddy4aHekMEBMNwy9gjlBDi4EFRY2K40btpirhe/yIVv11zVw7D3FXE8Qb5R15mK7snlHrxzYMRz3JStL/ruX8TZxslDpRlYcDoRFwNejq9kbKieX0yt8IzV1+gW3+265S2h2+In97XvScR4lKzFdkdTRB1qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B+f13sey; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 722AFC4CEFB;
	Mon, 20 Oct 2025 14:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760970432;
	bh=e3Nou+Q4E5SIque6x7KS5r0eaKpTjh9QBqBmU8tiWLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B+f13seyrinCKvQBn0W5eg+JpZwZv5D8wCHsJkVWyeNmhoodETYd0q55d5h/fbEXk
	 XHKUQlTKq4hR9/WSCYYKzAHXpZ2LwjYKYWatCaG7jNNFroaW+hRB4D4KKmkZelGfJm
	 RZCn4Y7R8fLWdKjiBJy1Dn7KnWEasEJmZN1K1tgU3ngUzmuATTCuXYKeZbWmby69iY
	 uMdMoSjGBY4O2zwjJziiYse04DDiFXrd6zqTYvhAIQTmPByAtBiftZZe2Fs5/UycRP
	 spdGN0MUdQMQkZq2J5KI26ibZEsYeI/KK7bjk8xzWeEijIKCOSewSX2SKiuePtrhPl
	 /qFne7t2/917g==
Date: Mon, 20 Oct 2025 09:27:10 -0500
From: Rob Herring <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Barker <paul.barker@sancloud.com>,
	Marc Murphy <marc.murphy@sancloud.com>,
	Tony Lindgren <tony@atomide.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v4 0/2] dt-bindings: mmc: ti,omap2430-sdhci: Add json
 schema for the text binding
Message-ID: <20251020142710.GA576827-robh@kernel.org>
References: <20251019-ti-sdhci-omap-v4-0-fdc63aaeb083@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251019-ti-sdhci-omap-v4-0-fdc63aaeb083@gmail.com>

On Sun, Oct 19, 2025 at 01:04:36PM +0000, Charan Pedumuru wrote:
> Create a YAML binding for ti,omap2430-sdhci and fix vmmc-supply
> property typo for a DTS file.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
> Note: The property "ti,needs-special-reset" was not removed from DTS cause it will
>       disrupt the compilation for other compatibles as the node &mmc is used for all
>       compatibles for some DTS files.

I don't understand. AFIACT, "ti,needs-special-reset" is only used for 
the hsmmc driver/binding. But this series for for the sdhci 
driver/binding. So shouldn't the property be removed from sdhci nodes 
(and the binding), but kept for hsmmc nodes?

Rob

