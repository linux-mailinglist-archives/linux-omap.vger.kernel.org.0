Return-Path: <linux-omap+bounces-3527-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB47A78DEF
	for <lists+linux-omap@lfdr.de>; Wed,  2 Apr 2025 14:12:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4896D3AF4F5
	for <lists+linux-omap@lfdr.de>; Wed,  2 Apr 2025 12:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F60239099;
	Wed,  2 Apr 2025 12:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cFWwaADS"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D55239072;
	Wed,  2 Apr 2025 12:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743595912; cv=none; b=YAi4P72bxFNG6JOSue6NUVximjjbSuTvD6OBzAsBzM2AXRzpO7Z7STgFfctQwAxkJhe1WtzkvjqPe0ZGXksL4DK8ytYHy9dVUIc1asnbZuJAHXFrcNjeBS+pj2AF03QfSQzmc0JhX4v+PM6h1D7UzjfjQglNEBVQIGf65mcPdjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743595912; c=relaxed/simple;
	bh=6BMk32WsDiJe2rDQkrMTPjrC92B9rfDzpLMv4hg2VqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LugjqrlfB6em88/12lyw5Wq7DqBSJXq1MdL0mhNoEUhMxhnbToiqX04yUgpYzRvWpE3alJbotxfJ7gqHz5jBnfFSc60m/FNKEEDBoWjc5Ylefzgx7JrElv/lBB7ma70+6yuEWToAFZVv6vFa938ZNYrSDmerGzuufly0EFp+jdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cFWwaADS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B38CAC4CEE9;
	Wed,  2 Apr 2025 12:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743595912;
	bh=6BMk32WsDiJe2rDQkrMTPjrC92B9rfDzpLMv4hg2VqY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=cFWwaADS9Wkn09Lt5D2J/EZSE+IqeFjheDVEPHxugC2LHmMtJMJBVPhbMSOK4qdqs
	 3TqEQtoqNev5trDdZHMqDbjOZMnzojr6CH2Jg7jswbgsS+JFCWr6HUTTb6cARM5bQ1
	 pQ0je6vqGqmyfelepvg8uIQ5YJkVKYoKztUNzQqOUdB84lL0BKZdE5nSHvD1h0Rn7T
	 5vy5l1A9q0Y7QtRQ+J0ADWngsoyPtDPyneB3aja1ik1o3VTuDJ6ymGpZ6pJ0Hj80wH
	 humcWixSoFKobHJZpJzVHr7ZAMKXIXlkgCfMqs+483+m7bY+EMh6pi+VN1tm0pEoyl
	 v0VJv2SCEQEnw==
Message-ID: <7aefa588-9f64-4bb4-8782-05eb1ef9d5b2@kernel.org>
Date: Wed, 2 Apr 2025 15:11:47 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] ARM: dts: omap4: panda: fix resources needed for
 Panda
To: Andreas Kemnade <andreas@kemnade.info>, Rob Herring <robh@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-omap@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Aaro Koskinen <aaro.koskinen@iki.fi>, devicetree@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20250330151401.444956-1-andreas@kemnade.info>
 <20250330151401.444956-2-andreas@kemnade.info>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250330151401.444956-2-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 30/03/2025 18:14, Andreas Kemnade wrote:
> The Pandaboard needs a 32k clock in the TWL6030 to be enabled
> to work. With some luck, it is enabled by some U-Boot fork.
> Do not rely on it and properly specify the requirement.

It would be nice to mention who exactly needs the 32K clock.
From your changes it looks like the wl12xx module needs it?

> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi b/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
> index 97706d6296a6..c860b590142a 100644
> --- a/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
> @@ -130,6 +130,12 @@ hsusb1_phy: hsusb1_phy {
>  		clock-frequency = <19200000>;
>  	};
>  
> +	wl12xx_pwrseq: wl12xx-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		clocks = <&twl 0>;
> +		clock-names = "ext_clock";
> +	};
> +
>  	/* regulator for wl12xx on sdio5 */
>  	wl12xx_vmmc: wl12xx_vmmc {
>  		pinctrl-names = "default";
> @@ -408,6 +414,7 @@ twl: twl@48 {
>  		reg = <0x48>;
>  		/* IRQ# = 7 */
>  		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>; /* IRQ_SYS_1N cascaded to gic */
> +		#clock-cells = <1>;
>  		system-power-controller;
>  	};
>  
> @@ -488,6 +495,7 @@ &mmc5 {
>  	non-removable;
>  	bus-width = <4>;
>  	cap-power-off-card;
> +	mmc-pwrseq = <&wl12xx_pwrseq>;
>  
>  	#address-cells = <1>;
>  	#size-cells = <0>;

Reviewed-by: Roger Quadros <rogerq@kernel.org>

-- 
cheers,
-roger


