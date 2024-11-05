Return-Path: <linux-omap+bounces-2583-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 277379BCE48
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2024 14:52:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB38F283650
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2024 13:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D32C1D6DD1;
	Tue,  5 Nov 2024 13:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sZ4kn9Bl"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17521D63CC;
	Tue,  5 Nov 2024 13:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730814756; cv=none; b=nzAn9YD1N/zpmAUlM26G5kXTI2ppwCVzB5jFWm7n0mAhWebZ4C79Y7iHKocHfyHFX1+3k7B9A6lNd/cor3jhZVCMlnjJceMW9s5luFwA5k6LFItHqdp2+cg60knfQXuGWrKcO0nh2Db4RTZmBmutezT3oihgrgoDD3riWh79Yzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730814756; c=relaxed/simple;
	bh=9RmemElWczQmjSbmF+yQD5UD6vSvu+VPFLQ/xqDnlok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hjsh/ehSZTXbB8APnjTeN18J52y1M5U/q3hxt4ohl6qzA7k/fzdhlngH07xAIz1lojr7XfJ0PoyA3e3i4tT8VY3c29YVbxDLZWqGdP/i0qMyfR6QxYivtRh4q6RykNy7ypA2NVuRge67u4ei0MMBJ4kPXdl/19Kzz4e8qW2h9M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sZ4kn9Bl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 137CEC4CED0;
	Tue,  5 Nov 2024 13:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730814756;
	bh=9RmemElWczQmjSbmF+yQD5UD6vSvu+VPFLQ/xqDnlok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sZ4kn9BlsfgtIwNVWgGErbE7ubGbKK+kvIlYvXbEYFIRoofLd14ERw/p6jFF6iXA7
	 EpZyVlMmlhxHd3R3bO3g//6moUX4gDZFS7Ncr3EDhJQkgMPuZ/k3pR1nyXI6zrPWO4
	 ecveh4Trj0UyYWbSa5TtUj5za1puos93SA7PZzM5L8IY1SLyXUFQDqumYNw62wUgnE
	 OSAggZ+ZISz1E5FwsdJCJXvxaYOSP+ZLpI83m9Uu1sNyzi/d+BVlge12An1a5IaGz+
	 lY2Q4PmeLia3mvQjGJJ/I6LG+gZos+6w6L1Smu2fUk8A2Z9eLxQXX+oHqCbpU+qmwG
	 Y/S09ir6gbV3A==
Date: Tue, 5 Nov 2024 07:52:34 -0600
From: Rob Herring <robh@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-omap@vger.kernel.org, Tero Kristo <kristo@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: ti: Convert mux.txt to json-schema
Message-ID: <20241105135234.GA3100411-robh@kernel.org>
References: <20241104135549.38486-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104135549.38486-1-andreas@kemnade.info>

On Mon, Nov 04, 2024 at 02:55:49PM +0100, Andreas Kemnade wrote:
> Convert the OMAP mux clock device tree binding to json-schema.
> Specify the creator of the original binding as a maintainer.
> Choose GPL-only license because original binding was also GPL.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  .../bindings/clock/ti/composite.txt           |   2 +-
>  .../devicetree/bindings/clock/ti/mux.txt      |  78 -----------
>  .../bindings/clock/ti/ti,mux-clock.yaml       | 123 ++++++++++++++++++
>  3 files changed, 124 insertions(+), 79 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/ti/mux.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/ti/composite.txt b/Documentation/devicetree/bindings/clock/ti/composite.txt
> index b02f22490dcb..238e6f7d74f8 100644
> --- a/Documentation/devicetree/bindings/clock/ti/composite.txt
> +++ b/Documentation/devicetree/bindings/clock/ti/composite.txt
> @@ -16,7 +16,7 @@ merged to this clock. The component clocks shall be of one of the
>  "ti,*composite*-clock" types.
>  
>  [1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> -[2] Documentation/devicetree/bindings/clock/ti/mux.txt
> +[2] Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml
>  [3] Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
>  [4] Documentation/devicetree/bindings/clock/ti/gate.txt
>  
> diff --git a/Documentation/devicetree/bindings/clock/ti/mux.txt b/Documentation/devicetree/bindings/clock/ti/mux.txt
> deleted file mode 100644
> index cd56d3c1c09f..000000000000
> --- a/Documentation/devicetree/bindings/clock/ti/mux.txt
> +++ /dev/null
> @@ -1,78 +0,0 @@
> -Binding for TI mux clock.
> -
> -This binding uses the common clock binding[1].  It assumes a
> -register-mapped multiplexer with multiple input clock signals or
> -parents, one of which can be selected as output.  This clock does not
> -gate or adjust the parent rate via a divider or multiplier.
> -
> -By default the "clocks" property lists the parents in the same order
> -as they are programmed into the register.  E.g:
> -
> -	clocks = <&foo_clock>, <&bar_clock>, <&baz_clock>;
> -
> -results in programming the register as follows:
> -
> -register value		selected parent clock
> -0			foo_clock
> -1			bar_clock
> -2			baz_clock
> -
> -Some clock controller IPs do not allow a value of zero to be programmed
> -into the register, instead indexing begins at 1.  The optional property
> -"index-starts-at-one" modified the scheme as follows:
> -
> -register value		selected clock parent
> -1			foo_clock
> -2			bar_clock
> -3			baz_clock
> -
> -The binding must provide the register to control the mux. Optionally
> -the number of bits to shift the control field in the register can be
> -supplied. If the shift value is missing it is the same as supplying
> -a zero shift.
> -
> -[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> -
> -Required properties:
> -- compatible : shall be "ti,mux-clock" or "ti,composite-mux-clock".
> -- #clock-cells : from common clock binding; shall be set to 0.
> -- clocks : link phandles of parent clocks
> -- reg : register offset for register controlling adjustable mux
> -
> -Optional properties:
> -- clock-output-names : from common clock binding.
> -- ti,bit-shift : number of bits to shift the bit-mask, defaults to
> -  0 if not present
> -- ti,index-starts-at-one : valid input select programming starts at 1, not
> -  zero
> -- ti,set-rate-parent : clk_set_rate is propagated to parent clock,
> -  not supported by the composite-mux-clock subtype
> -- ti,latch-bit : latch the mux value to HW, only needed if the register
> -  access requires this. As an example, dra7x DPLL_GMAC H14 muxing
> -  implements such behavior.
> -
> -Examples:
> -
> -sys_clkin_ck: sys_clkin_ck@4a306110 {
> -	#clock-cells = <0>;
> -	compatible = "ti,mux-clock";
> -	clocks = <&virt_12000000_ck>, <&virt_13000000_ck>, <&virt_16800000_ck>, <&virt_19200000_ck>, <&virt_26000000_ck>, <&virt_27000000_ck>, <&virt_38400000_ck>;
> -	reg = <0x0110>;
> -	ti,index-starts-at-one;
> -};
> -
> -abe_dpll_bypass_clk_mux_ck: abe_dpll_bypass_clk_mux_ck@4a306108 {
> -	#clock-cells = <0>;
> -	compatible = "ti,mux-clock";
> -	clocks = <&sys_clkin_ck>, <&sys_32k_ck>;
> -	ti,bit-shift = <24>;
> -	reg = <0x0108>;
> -};
> -
> -mcbsp5_mux_fck: mcbsp5_mux_fck {
> -	#clock-cells = <0>;
> -	compatible = "ti,composite-mux-clock";
> -	clocks = <&core_96m_fck>, <&mcbsp_clks>;
> -	ti,bit-shift = <4>;
> -	reg = <0x02d8>;
> -};
> diff --git a/Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml
> new file mode 100644
> index 000000000000..b271ab86dde1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: GPL-2.0-only

Surely TI as the only author of the original binding would agree to
dual-license this?

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/ti/ti,mux-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments mux clock
> +
> +maintainers:
> +  - Tero Kristo <kristo@kernel.org>
> +
> +description: |
> +  This clock assumes a register-mapped multiplexer with multiple inpt clock
> +  signals or parents, one of which can be selected as output. This clock does
> +  not gate or adjust the parent rate via a divider or multiplier.
> +
> +  By default the "clocks" property lists the parents in the same order
> +  as they are programmed into the register.  E.g:
> +
> +    clocks = <&foo_clock>, <&bar_clock>, <&baz_clock>;
> +
> +  results in programming the register as follows:

Results

> +
> +  register value   selected parent clock
> +  0                foo_clock
> +  1                bar_clock
> +  2                baz_clock
> +
> +  Some clock controller IPs do not allow a value of zero to be programmed
> +  into the register, instead indexing begins at 1.  The optional property
> +  "index-starts-at-one" modified the scheme as follows:
> +
> +  register value   selected clock parent
> +  1                foo_clock
> +  2                bar_clock
> +  3                baz_clock
> +
> +  The binding must provide the register to control the mux. Optionally
> +  the number of bits to shift the control field in the register can be
> +  supplied. If the shift value is missing it is the same as supplying
> +  a zero shift.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,mux-clock
> +      - ti,composite-mux-clock
> +
> +  "#clock-cells":
> +    const: 0
> +
> +  clocks: true
> +
> +  clock-output-names:
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  ti,bit-shift:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      number of bits to shift the bit-mask, defaults to 0 if not present

Number

And on all the other descriptions...

No need to say in prose what the constraints say. So drop "defaults to 0 
if not present".

> +    maximum: 31
> +    default: 0
> +
> +  ti,index-starts-at-one:
> +    type: boolean
> +    description:
> +      valid input select programming starts at 1, not zero
> +
> +  ti,set-rate-parent:
> +    type: boolean
> +    description:
> +      clk_set_rate is propagated to parent clock,
> +      not supported by the composite-mux-clock subtype.

blank line.

> +  ti,latch-bit:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      latch the mux value to HW, only needed if the register
> +      access requires this. As an example, dra7x DPLL_GMAC H14 muxing
> +      implements such behavior.

Constraints?

> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: ti,composite-mux-clock
> +then:
> +  properties:
> +    ti,set-rate-parent: false
> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +  - clocks
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    bus {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      clock-controller@110 {
> +        #clock-cells = <0>;
> +        compatible = "ti,mux-clock";
> +        clocks = <&virt_12000000_ck>, <&virt_13000000_ck>, <&virt_16800000_ck>;
> +        reg = <0x0110>;
> +        ti,index-starts-at-one;
> +        ti,set-rate-parent;
> +      };
> +
> +      clock-controller@120 {

Wrong unit-address.

> +        #clock-cells = <0>;
> +        compatible = "ti,composite-mux-clock";
> +        clocks = <&core_96m_fck>, <&mcbsp_clks>;
> +        ti,bit-shift = <4>;
> +        reg = <0x02d8>;
> +      };
> +    };
> -- 
> 2.39.5
> 

