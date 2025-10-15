Return-Path: <linux-omap+bounces-4685-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6283ABDEB08
	for <lists+linux-omap@lfdr.de>; Wed, 15 Oct 2025 15:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A6F25506391
	for <lists+linux-omap@lfdr.de>; Wed, 15 Oct 2025 13:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC79732BF25;
	Wed, 15 Oct 2025 13:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jShSKbgo"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2DD2F5A01;
	Wed, 15 Oct 2025 13:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760533909; cv=none; b=cv/8nwliXqoXvsXX03WEnOJg6kEZc4a77rW/SWJhOo5jivmj6FFzbzpPRpvxt49eWZ0z4hXH3i3EG3nwg4rxnaZ8kuLU8vGb7nPHBjuN7A3Gm4FA9YsIHlr5VTMXnVPHm8PG71y7cDLi2BBcuglEC9BlUgNrgSbjhFSHWdHcW/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760533909; c=relaxed/simple;
	bh=YMcaKLHJu+qHEbscCu4PYBYwemy0TdAJrZY1GyASnwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p63TI4+8hcBNfmDKOafyxpZDMqFntcbFbelbMlLhba7Z78ANcji9s0v0pt7DOJf4fS/n/E6V6j6Gte3dapkE68svuvbw8Vn9C34zbv4MQQUJtu6mqzE8NPB/xFJpCJg+3T7AoZN9yI7u6kJiGAvCZtm7GWFZL0EarSFmL+HW3xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jShSKbgo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77804C4CEF8;
	Wed, 15 Oct 2025 13:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760533907;
	bh=YMcaKLHJu+qHEbscCu4PYBYwemy0TdAJrZY1GyASnwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jShSKbgo0043mtGtnxIS8E2Kp/UjfwAeEoyAAoepCfZ++Mp7ale1wbbAM1F2Fh+CM
	 JoL6cZlisKdlsK1vASuWJ9z3NcORVFpHOff0SYfKv/F2+k5XAKNvPRUp+nAyUznn6T
	 5fJ8UOz88wxZ8N8sABCBxiYjOhBk91JZ8ISblkmLE2duD0qvAmhV6GXXJQx+caVvg2
	 LIa5M5jfmrSN59GT7/ve3l/yIVg9IusEhu3RgEM5e9/jLLpCPopRAQfbl9jbfGnvNe
	 W8ruTvVTjYcKqbm0CsZ8juQIE+aTWGabD/QIY8W9H965CVB25e/x7D41Jj3uLoUqZh
	 373UFz5oreNNQ==
Date: Wed, 15 Oct 2025 08:11:45 -0500
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
Subject: Re: [PATCH v3 2/2] dt-bindings: mmc: ti,omap2430-sdhci: convert to
 DT schema
Message-ID: <20251015131145.GA3232873-robh@kernel.org>
References: <20251011-ti-sdhci-omap-v3-0-9487ef2de559@gmail.com>
 <20251011-ti-sdhci-omap-v3-2-9487ef2de559@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011-ti-sdhci-omap-v3-2-9487ef2de559@gmail.com>

On Sat, Oct 11, 2025 at 08:40:24AM +0000, Charan Pedumuru wrote:
> Convert TI OMAP SDHCI Controller binding to YAML format.
> Changes during Conversion:
> - Define new properties like "clocks", "clock-names",
>   "ti,needs-special-reset", "ti,needs-special-hs-handling",
>   "pbias-supply", "cap-mmc-dual-data-rate" and "power-domains" to
>   resolve dtb_check errors.
> - Remove "pinctrl-names" and "pinctrl-<n>"
>   from required as they are not necessary for all DTS files.
> - Remove "ti,hwmods" property entirely from the YAML as the
>   DTS doesn't contain this property for the given compatibles and the
>   text binding is misleading.
> - Add "clocks", "clock-names", "max-frequency" and "ti,needs-special-reset"
>   to the required properties based on the compatible and the text binding
>   doesn't mention these properties as required.
> - Add missing strings like "default-rev11", "sdr12-rev11", "sdr25-rev11",
>   "hs-rev11", "sdr25-rev11" and "sleep" to pinctrl-names string array
>   to resolve errors detected by dtb_check.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  .../devicetree/bindings/mmc/sdhci-omap.txt         |  43 -----
>  .../devicetree/bindings/mmc/ti,omap2430-sdhci.yaml | 202 +++++++++++++++++++++
>  2 files changed, 202 insertions(+), 43 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-omap.txt b/Documentation/devicetree/bindings/mmc/sdhci-omap.txt
> deleted file mode 100644
> index f91e341e6b36c410275e6f993dd08400be3fc1f8..0000000000000000000000000000000000000000
> --- a/Documentation/devicetree/bindings/mmc/sdhci-omap.txt
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -* TI OMAP SDHCI Controller
> -
> -Refer to mmc.txt for standard MMC bindings.
> -
> -For UHS devices which require tuning, the device tree should have a "cpu_thermal" node which maps to the appropriate thermal zone. This is used to get the temperature of the zone during tuning.
> -
> -Required properties:
> -- compatible: Should be "ti,omap2430-sdhci" for omap2430 controllers
> -	      Should be "ti,omap3-sdhci" for omap3 controllers
> -	      Should be "ti,omap4-sdhci" for omap4 and ti81 controllers
> -	      Should be "ti,omap5-sdhci" for omap5 controllers
> -	      Should be "ti,dra7-sdhci" for DRA7 and DRA72 controllers
> -	      Should be "ti,k2g-sdhci" for K2G
> -	      Should be "ti,am335-sdhci" for am335x controllers
> -	      Should be "ti,am437-sdhci" for am437x controllers
> -- ti,hwmods: Must be "mmc<n>", <n> is controller instance starting 1
> -	     (Not required for K2G).
> -- pinctrl-names: Should be subset of "default", "hs", "sdr12", "sdr25", "sdr50",
> -		 "ddr50-rev11", "sdr104-rev11", "ddr50", "sdr104",
> -		 "ddr_1_8v-rev11", "ddr_1_8v" or "ddr_3_3v", "hs200_1_8v-rev11",
> -		 "hs200_1_8v",
> -- pinctrl-<n> : Pinctrl states as described in bindings/pinctrl/pinctrl-bindings.txt
> -
> -Optional properties:
> -- dmas:		List of DMA specifiers with the controller specific format as described
> -		in the generic DMA client binding. A tx and rx specifier is required.
> -- dma-names:	List of DMA request names. These strings correspond 1:1 with the
> -		DMA specifiers listed in dmas. The string naming is to be "tx"
> -		and "rx" for TX and RX DMA requests, respectively.
> -
> -Deprecated properties:
> -- ti,non-removable: Compatible with the generic non-removable property
> -
> -Example:
> -	mmc1: mmc@4809c000 {
> -		compatible = "ti,dra7-sdhci";
> -		reg = <0x4809c000 0x400>;
> -		ti,hwmods = "mmc1";
> -		bus-width = <4>;
> -		vmmc-supply = <&vmmc>; /* phandle to regulator node */
> -		dmas = <&sdma 61 &sdma 62>;
> -		dma-names = "tx", "rx";
> -	};
> diff --git a/Documentation/devicetree/bindings/mmc/ti,omap2430-sdhci.yaml b/Documentation/devicetree/bindings/mmc/ti,omap2430-sdhci.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..7683481204b2e222847244b67f9ae2684db93028
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/ti,omap2430-sdhci.yaml
> @@ -0,0 +1,202 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/ti,omap2430-sdhci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI OMAP SDHCI Controller
> +
> +maintainers:
> +  - Kishon Vijay Abraham I <kishon@ti.com>
> +
> +description:
> +  For UHS devices which require tuning, the device tree should have a
> +  cpu_thermal node which maps to the appropriate thermal zone. This
> +  is used to get the temperature of the zone during tuning.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,omap2430-sdhci
> +      - ti,omap3-sdhci
> +      - ti,omap4-sdhci
> +      - ti,omap5-sdhci
> +      - ti,dra7-sdhci
> +      - ti,k2g-sdhci
> +      - ti,am335-sdhci
> +      - ti,am437-sdhci
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: fck
> +      - const: mmchsdb_fck
> +
> +  dmas:
> +    maxItems: 2
> +
> +  dma-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +
> +  pinctrl-names:
> +    $ref: /schemas/types.yaml#/definitions/string-array

Drop. Already has a type.

> +    minItems: 1
> +    maxItems: 14
> +    items:
> +      enum:
> +        - default
> +        - default-rev11
> +        - hs
> +        - sdr12
> +        - sdr12-rev11
> +        - sdr25
> +        - sdr25-rev11
> +        - sdr50
> +        - ddr50-rev11
> +        - sdr104-rev11
> +        - ddr50
> +        - sdr104
> +        - ddr_1_8v-rev11
> +        - ddr_1_8v
> +        - ddr_3_3v
> +        - hs-rev11
> +        - hs200_1_8v-rev11
> +        - hs200_1_8v
> +        - sleep

