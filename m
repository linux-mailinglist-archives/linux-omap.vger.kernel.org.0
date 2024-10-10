Return-Path: <linux-omap+bounces-2370-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CEC997B68
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 05:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 056EE284CF7
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 03:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E3451925B6;
	Thu, 10 Oct 2024 03:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ItucPJuQ"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931DFBE57;
	Thu, 10 Oct 2024 03:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728531875; cv=none; b=ftx0exz5Hr/A0oNzdV7wKr0BaG4pBLQhFtvcGqW4YFpK2ckj2cwyMBjBiJV2ybjj7KJBT4opZAVnqq2tTakWhRnm175T4R2ERayf/ChP8f07mBI2ZVFJLIaOf/YXfbPxqlXlCfSJeP5+eRYVVl0yls8fFZ9DVcAUgez6QEYsi7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728531875; c=relaxed/simple;
	bh=bYoe6q1x0Sk3adtxUbZFYFT+tsbRQndRmOmd+ZX4Ktc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uqj6+/KuwQASzGkTenayzBq0fDojtYVEK1lTk6eLk0dAgjws3lYPpm6UWe9kFUeiSMso7P/ComRkqT3eBvXgx0TJL/+YZbE7vUVo6kBSxIjvC8NFSDHNMw1Y1UtFLj9srNATpFkJfrzovKMsY8+5D3aokPyFof+jyfxdXWpcqZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ItucPJuQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC1B0C4CEC6;
	Thu, 10 Oct 2024 03:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728531875;
	bh=bYoe6q1x0Sk3adtxUbZFYFT+tsbRQndRmOmd+ZX4Ktc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ItucPJuQQITH+ACENUpKJizecJfZEmYJSQhL0TXPYsTkE9C1hmIOrGb98wCIA+777
	 /Q6Dn8CjurD0c7MZDzdr69P78cb6lQl3EH5DitRrt5fZg4o8bUB9phW9n02NCJEvdS
	 mtnwoP18BaWxxzSUtCpH0fEnM56zGNZo93njs1b5dyi5xmkmc6bGSWz2/OxkcmZwa8
	 oC4eLgxvkbPLC/zAp2dD4v4NMwO/4330y0HeSagj5QcxlEhX/VFCoLiYv4TipC3thc
	 6KY2aID0KzCoYTOX6WSyvY233j+gBf/vD+xHiHCQRQ3TXOn7GKp+VIipLnq8YKpd4r
	 x9LoAvIO9wTbw==
Date: Wed, 9 Oct 2024 22:44:34 -0500
From: Rob Herring <robh@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>,
	Roger Quadros <rogerq@kernel.org>, linux-omap@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, Tero Kristo <kristo@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 2/2] dt-bindings: clock: ti: Convert divider.txt
 to json-schema
Message-ID: <20241010034434.GB1297859-robh@kernel.org>
References: <20241009205619.16250-1-andreas@kemnade.info>
 <20241009205619.16250-3-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009205619.16250-3-andreas@kemnade.info>

On Wed, Oct 09, 2024 at 10:56:19PM +0200, Andreas Kemnade wrote:
> Convert the OMAP divider clock device tree binding to json-schema.
> Specify the creator of the original binding as a maintainer.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  .../devicetree/bindings/clock/ti/divider.txt  | 115 ------------
>  .../bindings/clock/ti/ti,divider-clock.yaml   | 175 ++++++++++++++++++
>  2 files changed, 175 insertions(+), 115 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/ti/divider.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/ti/divider.txt b/Documentation/devicetree/bindings/clock/ti/divider.txt
> deleted file mode 100644
> index 4d7c76f0b356..000000000000
> --- a/Documentation/devicetree/bindings/clock/ti/divider.txt
> +++ /dev/null
> @@ -1,115 +0,0 @@
> -Binding for TI divider clock
> -
> -This binding uses the common clock binding[1].  It assumes a
> -register-mapped adjustable clock rate divider that does not gate and has
> -only one input clock or parent.  By default the value programmed into
> -the register is one less than the actual divisor value.  E.g:
> -
> -register value		actual divisor value
> -0			1
> -1			2
> -2			3
> -
> -This assumption may be modified by the following optional properties:
> -
> -ti,index-starts-at-one - valid divisor values start at 1, not the default
> -of 0.  E.g:
> -register value		actual divisor value
> -1			1
> -2			2
> -3			3
> -
> -ti,index-power-of-two - valid divisor values are powers of two.  E.g:
> -register value		actual divisor value
> -0			1
> -1			2
> -2			4
> -
> -Additionally an array of valid dividers may be supplied like so:
> -
> -	ti,dividers = <4>, <8>, <0>, <16>;
> -
> -Which will map the resulting values to a divisor table by their index:
> -register value		actual divisor value
> -0			4
> -1			8
> -2			<invalid divisor, skipped>
> -3			16
> -
> -Any zero value in this array means the corresponding bit-value is invalid
> -and must not be used.
> -
> -The binding must also provide the register to control the divider and
> -unless the divider array is provided, min and max dividers. Optionally
> -the number of bits to shift that mask, if necessary. If the shift value
> -is missing it is the same as supplying a zero shift.
> -
> -This binding can also optionally provide support to the hardware autoidle
> -feature, see [2].
> -
> -[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> -[2] Documentation/devicetree/bindings/clock/ti/autoidle.txt
> -
> -Required properties:
> -- compatible : shall be "ti,divider-clock" or "ti,composite-divider-clock".
> -- #clock-cells : from common clock binding; shall be set to 0.
> -- clocks : link to phandle of parent clock
> -- reg : offset for register controlling adjustable divider
> -
> -Optional properties:
> -- clock-output-names : from common clock binding.
> -- ti,dividers : array of integers defining divisors
> -- ti,bit-shift : number of bits to shift the divider value, defaults to 0
> -- ti,min-div : min divisor for dividing the input clock rate, only
> -  needed if the first divisor is offset from the default value (1)
> -- ti,max-div : max divisor for dividing the input clock rate, only needed
> -  if ti,dividers is not defined.
> -- ti,index-starts-at-one : valid divisor programming starts at 1, not zero,
> -  only valid if ti,dividers is not defined.
> -- ti,index-power-of-two : valid divisor programming must be a power of two,
> -  only valid if ti,dividers is not defined.
> -- ti,autoidle-shift : bit shift of the autoidle enable bit for the clock,
> -  see [2]
> -- ti,invert-autoidle-bit : autoidle is enabled by setting the bit to 0,
> -  see [2]
> -- ti,set-rate-parent : clk_set_rate is propagated to parent
> -- ti,latch-bit : latch the divider value to HW, only needed if the register
> -  access requires this. As an example dra76x DPLL_GMAC H14 divider implements
> -  such behavior.
> -
> -Examples:
> -dpll_usb_m2_ck: dpll_usb_m2_ck@4a008190 {
> -	#clock-cells = <0>;
> -	compatible = "ti,divider-clock";
> -	clocks = <&dpll_usb_ck>;
> -	ti,max-div = <127>;
> -	reg = <0x190>;
> -	ti,index-starts-at-one;
> -};
> -
> -aess_fclk: aess_fclk@4a004528 {
> -	#clock-cells = <0>;
> -	compatible = "ti,divider-clock";
> -	clocks = <&abe_clk>;
> -	ti,bit-shift = <24>;
> -	reg = <0x528>;
> -	ti,max-div = <2>;
> -};
> -
> -dpll_core_m3x2_div_ck: dpll_core_m3x2_div_ck {
> -	#clock-cells = <0>;
> -	compatible = "ti,composite-divider-clock";
> -	clocks = <&dpll_core_x2_ck>;
> -	ti,max-div = <31>;
> -	reg = <0x0134>;
> -	ti,index-starts-at-one;
> -};
> -
> -ssi_ssr_div_fck_3430es2: ssi_ssr_div_fck_3430es2 {
> -	#clock-cells = <0>;
> -	compatible = "ti,composite-divider-clock";
> -	clocks = <&corex2_fck>;
> -	ti,bit-shift = <8>;
> -	reg = <0x0a40>;
> -	ti,dividers = <0>, <1>, <2>, <3>, <4>, <0>, <6>, <0>, <8>;
> -};
> diff --git a/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
> new file mode 100644
> index 000000000000..31fe876fb40b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
> @@ -0,0 +1,175 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments divider clock
> +
> +maintainers:
> +  - Tero Kristo <kristo@kernel.org>
> +
> +description: |
> +  This clock It assumes a register-mapped adjustable clock rate divider
> +  that does not gate and has only one input clock or parent.  By default the
> +  value programmed into the register is one less than the actual divisor value.
> +  E.g:
> +
> +  register value    actual divisor value
> +  0                 1
> +  1                 2
> +  2                 3
> +
> +  This assumption may be modified by the following optional properties:
> +
> +  ti,index-starts-at-one - valid divisor values start at 1, not the default
> +  of 0.  E.g:
> +  register value    actual divisor value
> +  1                 1
> +  2                 2
> +  3                 3
> +
> +  ti,index-power-of-two - valid divisor values are powers of two.  E.g:
> +  register value    actual divisor value
> +  0                 1
> +  1                 2
> +  2                 4
> +
> +  Additionally an array of valid dividers may be supplied like so:
> +
> +  ti,dividers = <4>, <8>, <0>, <16>;
> +
> +  Which will map the resulting values to a divisor table by their index:
> +  register value    actual divisor value
> +  0                 4
> +  1                 8
> +  2                 <invalid divisor, skipped>
> +  3                 16
> +
> +  Any zero value in this array means the corresponding bit-value is invalid
> +  and must not be used.
> +
> +  The binding must also provide the register to control the divider and
> +  unless the divider array is provided, min and max dividers. Optionally
> +  the number of bits to shift that mask, if necessary. If the shift value
> +  is missing it is the same as supplying a zero shift.
> +
> +  This binding can also optionally provide support to the hardware autoidle
> +  feature, see [1].
> +
> +  [1] Documentation/devicetree/bindings/clock/ti/autoidle.txt
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,divider-clock
> +      - ti,composite-divider-clock
> +
> +  "#clock-cells":
> +    const: 0
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-output-names:
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  ti,dividers: true
> +
> +  ti,bit-shift:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      number of bits to shift the divider value

maximum: 31 ?
default: 0

> +
> +  ti,min-div:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      min divisor for dividing the input clock rate, only
> +      needed if the first divisor is offset from the default value (1)

minimum: 1
maximum: ?
default: 1

> +
> +  ti,max-div:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      max divisor for dividing the input clock rate, only needed
> +      if ti,dividers is not defined.
> +
> +  ti,index-starts-at-one:
> +    type: boolean
> +    description:
> +      valid divisor programming starts at 1, not zero,
> +      only valid if ti,dividers is not defined
> +
> +  ti,index-power-of-two:
> +    type: boolean
> +    description:
> +      valid divisor programming must be a power of two,
> +      only valid if ti,dividers is not defined.

This can be expressed as:

dependentSchemas:
  ti,dividers:
    properties:
      ti,min-div: false
      ti,max-div: false
      ti,index-power-of-two: false
      ti,index-starts-at-one: false

> +
> +  ti,autoidle-shift:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      bit shift of the autoidle enable bit for the clock,
> +      see [1].

maximum: 31
default: 0

> +
> +  ti,invert-autoidle-bit:
> +    type: boolean
> +    description:
> +      autoidle is enabled by setting the bit to 0,
> +      see [1]
> +
> +  ti,set-rate-parent:
> +    type: boolean
> +    description:
> +      clk_set_rate is propagated to parent            |
> +
> +  ti,latch-bit:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      latch the divider value to HW, only needed if the register
> +      compatible access requires this. As an example dra76x DPLL_GMAC
> +      H14 divider implements such behavior.
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
> +      dpll_usb_m2_ck: clock-controller@190 {

Drop unused labels.

> +        #clock-cells = <0>;
> +        compatible = "ti,divider-clock";
> +        clocks = <&dpll_usb_ck>;
> +        ti,max-div = <127>;
> +        reg = <0x190>;
> +        ti,index-starts-at-one;
> +      };
> +
> +      aess_fclk: clock-controller@528 {
> +        #clock-cells = <0>;
> +        compatible = "ti,divider-clock";
> +        clocks = <&abe_clk>;
> +        ti,bit-shift = <24>;
> +        reg = <0x528>;
> +        ti,max-div = <2>;
> +      };
> +
> +      ssi_ssr_div_fck_3430es2: clock-controller@a40 {
> +        #clock-cells = <0>;
> +        compatible = "ti,composite-divider-clock";
> +        clocks = <&corex2_fck>;
> +        ti,bit-shift = <8>;
> +        reg = <0x0a40>;
> +        ti,dividers = <0>, <1>, <2>, <3>, <4>, <0>, <6>, <0>, <8>;
> +      };
> +    };
> -- 
> 2.39.5
> 

