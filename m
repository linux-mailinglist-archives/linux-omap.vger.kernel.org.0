Return-Path: <linux-omap+bounces-3082-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C068FA095D0
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jan 2025 16:35:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66B25167A7D
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jan 2025 15:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0D9211A10;
	Fri, 10 Jan 2025 15:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tr47FpyB"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34331FA15C;
	Fri, 10 Jan 2025 15:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736523322; cv=none; b=Ew0pXx4W/OQsa32P6c+Px6poieu1xXQBo0vx5MC+traX/oxFlfd1iPDw8YnJSCaK0uzFm9ncWDOrRtX/k5689vCPTlWamLCHaYPx54b/uh5MfPuhPEdUPIc0z3MUMlkc+d8eMcbgAEsNLgnArI2auUjnUuzTtCBgRwoHVh3t5hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736523322; c=relaxed/simple;
	bh=PFQQnbTdjkTsQINXUX4WtvC8+Xl/XUqNkaTRSn+p8PQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dblT6hxFvKQz6Bhm6NGqkEmkwxTn9R5BbcoVR+4Al+aQ56xDbNIKWL65reJUIWLjCPoif/qLsRYimoz8TKEWA7F9kbgw+cx/PPVyhOlK4XokkRdoBykSfVWEZ/Isiur3P99q8UXyKvvGbFC8JqpjWxQbxjBagugpWk4O55vAIVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tr47FpyB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 461A5C4CEE1;
	Fri, 10 Jan 2025 15:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736523321;
	bh=PFQQnbTdjkTsQINXUX4WtvC8+Xl/XUqNkaTRSn+p8PQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tr47FpyBJmQsGet8LoZu8CpuYHhZzU947dmY3I1J/2GgLqsHFvC32EQvwd1IwhBhl
	 Fy9yxBkEYX35vs6OqZI2ytHSAefQ1c8LXLNkJuojd36+Lc50YVtcl92pwS2skeEtbN
	 BhdowyGEDk/pQs3HK01iO0c7xSgXMMyrrTqAOdI39LEnuM5RXXfim5TTCMCkUqsLZx
	 ZfTeMwvdVgqdyIu82hx9bPap9fozYDJdTtZpC/kh0u8FZIc7Go5KQL/6Vx6lPG/16h
	 s0g14EI5QPYlinHWifbJPv7iCA0MbNPnb/CYQZbXEWJTIF8Rr5ymwrCF40aTIXzOun
	 eW7J5juF3q1+Q==
Date: Fri, 10 Jan 2025 09:35:20 -0600
From: Rob Herring <robh@kernel.org>
To: Romain Naour <romain.naour@smile.fr>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
	kristo@kernel.org, vigneshr@ti.com, nm@ti.com, afd@ti.com,
	Romain Naour <romain.naour@skf.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: mfd: syscon: Add
 ti,j721e-acspcie-proxy-ctrl compatible
Message-ID: <20250110153520.GA2904744-robh@kernel.org>
References: <20250110100331.1642242-1-romain.naour@smile.fr>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110100331.1642242-1-romain.naour@smile.fr>

On Fri, Jan 10, 2025 at 11:03:30AM +0100, Romain Naour wrote:
> From: Romain Naour <romain.naour@skf.com>
> 
> The ACSPCIE_PROXY_CTRL registers within the CTRL_MMR space of TI's J721e
> SoC are used to drive the reference clock to the PCIe Endpoint device via
> the PAD IO Buffers. Add the compatible for allowing the PCIe driver to
> obtain the regmap for the ACSPCIE_CTRL register within the System
> Controller device-tree node in order to enable the PAD IO Buffers.
> 
> Using the ti,j721e-acspcie-proxy-ctrl compatible imply to use "Proxy1"
> address (1A090h) instead of "Proxy0" (18090h) to access
> CTRLMMR_ACSPCIE0_CTRL register:
> 
>   CTRLMMR_ACSPCIE0_CTRL Register (Proxy0 Offset = 18090h; Proxy1 Offset = 1A090h)
> 
> "Proxy0" is used as the default access path that can be locked with the
> help of "CTRLMMR_LOCK0_KICK0" and "CTRLMMR_LOCK0_KICK1" registers.
> 
> The Technical Reference Manual for J721e SoC with details of the
> ASCPCIE_CTRL registers is available at:
> https://www.ti.com/lit/zip/spruil1
> 
> Signed-off-by: Romain Naour <romain.naour@skf.com>
> ---
> v5:
>   - Add missing change to the J721e system controller binding
>     to avoid DT check warning when the new acspcie0_proxy_ctrl (syscon)
>     will be added to J721e system controller node (Andrew Davis).
> 
>   https://lore.kernel.org/linux-devicetree/90f47fae-a493-471d-8fe6-e7df741161be@ti.com/
> 
>   - Explain why "Proxy1" address (1A090h) should be used while using
>     ti,j721e-acspcie-proxy-ctrl compatible (Siddharth Vadapalli).
> 
>   https://lore.kernel.org/linux-devicetree/begojbvvrpyjfr3pye7mqwiw73ucw5ynepdfujssr4jx4vs33a@pwahnph3qesl/
> 
> v4: Add missing change in the second list (From Andrew Davis) [1]
>   Rebase after the ti,j784s4-acspcie-proxy-ctrl compatible fix [2]
>   [1] https://lore.kernel.org/linux-devicetree/20250103174524.28768-1-afd@ti.com/
>   [2] https://lore.kernel.org/linux-devicetree/20250103174524.28768-2-afd@ti.com/
> 
> v3: new commit
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml           | 2 ++
>  .../bindings/soc/ti/ti,j721e-system-controller.yaml         | 6 ++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index 0e68c69e7bc9..1f3e67f432e7 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -115,6 +115,7 @@ select:
>            - ti,am625-dss-oldi-io-ctrl
>            - ti,am62p-cpsw-mac-efuse
>            - ti,am654-dss-oldi-io-ctrl
> +          - ti,j721e-acspcie-proxy-ctrl
>            - ti,j784s4-acspcie-proxy-ctrl
>            - ti,j784s4-pcie-ctrl
>            - ti,keystone-pllctrl
> @@ -213,6 +214,7 @@ properties:
>            - ti,am625-dss-oldi-io-ctrl
>            - ti,am62p-cpsw-mac-efuse
>            - ti,am654-dss-oldi-io-ctrl

> +          - ti,j721e-acspcie-proxy-ctrl
>            - ti,j784s4-acspcie-proxy-ctrl

How do these 2 compare? Are they compatible?

>            - ti,j784s4-pcie-ctrl
>            - ti,keystone-pllctrl
> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> index 378e9cc5fac2..16929218d611 100644
> --- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> +++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> @@ -68,6 +68,12 @@ patternProperties:
>      description:
>        The node corresponding to SoC chip identification.
>  
> +  "^syscon@[0-9a-f]+$":
> +    type: object
> +    $ref: /schemas/mfd/syscon.yaml#
> +    description:
> +      This is the ASPCIe control region.

So this is a syscon child of a syscon. The primary reason for 'syscon' 
compatible is to create a regmap. Why can't you use the parent's syscon?

Rob

