Return-Path: <linux-omap+bounces-2731-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 345AC9D9DC8
	for <lists+linux-omap@lfdr.de>; Tue, 26 Nov 2024 20:04:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6240287665
	for <lists+linux-omap@lfdr.de>; Tue, 26 Nov 2024 19:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E518B1DE2AA;
	Tue, 26 Nov 2024 19:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z29qgN7Y"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C181DD529;
	Tue, 26 Nov 2024 19:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732647883; cv=none; b=rVZ/PLQPVBjS8penG8Z+ltL0cVzu1D0oDzon3zRplLu+u6gM46sW9uz1sWzMDwyRBXTrUvg8ngEkvZ1PWyh7gE8bwfK5FyDNTh4uJoYeISKQVKc3t8yQmnVIobwT7g3H45KQha9i0KJxx5vE0avxXvHSg8+jWxL/YUJln4MQtlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732647883; c=relaxed/simple;
	bh=+mf68xlLx7KgwnDTeOl9Bn2WskxaGDYLqwnAUlB4Isk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nq8anCSRjNKmRtP0/VN33hfI96uWBLE9bztEN6ygQifWDrJ5Z0HdVf9Ztv5Jv/iCA/YpC7EgQ6z2l6sVTJmTEl2aOoSgq56VTP+XbPAs4ega4IpnUaFHD9f7+y0uKX9oIVu0Vma6xsHFbu7BPKPEcL5YzBQVp25vLxpuAQCuNj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z29qgN7Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D96EC4CECF;
	Tue, 26 Nov 2024 19:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732647883;
	bh=+mf68xlLx7KgwnDTeOl9Bn2WskxaGDYLqwnAUlB4Isk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z29qgN7YEASNNAQS6rQQgujOVDzxLhbry77wGPIiWuUg9+ORkpLxY9ll5hb0v9qrm
	 D5Wd2g7MmYnZ5y8lh8G84DDvQTI/VbQqjS4XgmI4oQY9HQTlLHX7WgRSx8j8dAaijB
	 YdUtlNGtLIdo+8YD1kpZpPunPQ0qGc7h1Vs7BEZEzpNe7L0V8mmXwJSOBWtnMb/cCM
	 b2tDYTEIkJLf9I1HKkaMbbr8CGeRwBT3RoVe2kxa7X7rwRYoZKcJg0nvMBX8B3rlDA
	 VkkyyBEk2RSt2i4MxW5AK44hzNcfUuhKgwlG0rT76uEA3HEMsnH8F28YR0QJQgiPDa
	 JIougiKkPZOGg==
Message-ID: <5e2d2174-44a7-4143-8562-4dcdb5ad6c94@kernel.org>
Date: Tue, 26 Nov 2024 20:04:36 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-j721e-beagleboneai64: Enable ACSPCIE
 output for PCIe1
To: Romain Naour <romain.naour@smile.fr>, devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, kristo@kernel.org,
 vigneshr@ti.com, nm@ti.com, Romain Naour <romain.naour@skf.com>
References: <20241126173307.4054601-1-romain.naour@smile.fr>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241126173307.4054601-1-romain.naour@smile.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/11/2024 18:33, Romain Naour wrote:
> From: Romain Naour <romain.naour@skf.com>
> 
> Unlike the SK-TDA4VM (k3-j721e-sk) board, there is no clock generator
> (CDCI6214RGET) on the BeagleBone AI-64 (k3-j721e-beagleboneai64) to
> provide PCIe refclk signal to PCIe Endponts. So the ACSPCIE module must
> provide refclk through PCIe_REFCLK pins.
> 
> Use the new "ti,syscon-acspcie-proxy-ctrl" property to enable ACSPCIE
> module's PAD IO Buffers.
> 
> Signed-off-by: Romain Naour <romain.naour@skf.com>
> ---
> With this patch, we can remove "HACK: Sierra: Drive clock out" patch
> applied on vendor kernel for BeagleBone AI-64:
> https://openbeagle.org/beagleboard/linux/-/commit/ad65d7ef675966cdbc5d75f2bd545fad1914ba9b
> ---
>  arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts |  4 ++++
>  arch/arm64/boot/dts/ti/k3-j721e-main.dtsi          | 10 ++++++++--
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
> index fb899c99753e..681e3af7ce6e 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
> @@ -859,6 +859,10 @@ &pcie1_rc {
>  	num-lanes = <2>;
>  	max-link-speed = <3>;
>  	reset-gpios = <&main_gpio0 22 GPIO_ACTIVE_HIGH>;
> +	/* There is no on-board or external reference clock generators,

Please use generic style comments, not netdev.

> +	 * use refclk from the ACSPCIE module's PAD IO Buffers.
> +	 */
> +	ti,syscon-acspcie-proxy-ctrl = <&acspcie0_proxy_ctrl 0x3>;
>  };
>  
>  &ufs_wrapper {
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> index 0da785be80ff..9f47e7672922 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2016-2024 Texas Instruments Incorporated - https://www.ti.com/
>   */
>  #include <dt-bindings/phy/phy.h>
> +#include <dt-bindings/phy/phy-cadence.h>
>  #include <dt-bindings/phy/phy-ti.h>
>  #include <dt-bindings/mux/mux.h>
>  
> @@ -82,6 +83,11 @@ ehrpwm_tbclk: clock-controller@4140 {
>  			reg = <0x4140 0x18>;
>  			#clock-cells = <1>;
>  		};
> +
> +		acspcie0_proxy_ctrl: acspcie0-ctrl@18090 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +			compatible = "ti,j784s4-acspcie-proxy-ctrl", "syscon";

I am not familiar with naming, so is this j784s4 or j721e or K3 SoC?
Compatible should be SoC specific.

Best regards,
Krzysztof

