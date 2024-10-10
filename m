Return-Path: <linux-omap+bounces-2368-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B414997B53
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 05:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA0AD1F22EDE
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 03:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F333191F8D;
	Thu, 10 Oct 2024 03:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DEOhmpa2"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2129429CEC;
	Thu, 10 Oct 2024 03:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728531301; cv=none; b=KD+IeU0hblmfiOXKB/Bmozry+limeosEgx2ma4qPhOsUmVRwrcukhL5Gfy0SoLqayXOUPKfDHve4fqtez9Jdc4nZiAFNHx4/eIUbOuUGsa3rQuHGc73+3ANlLeuXON6Z/0o5UVbPwPUeaIsty19RcxtvdN5bC8eXEr5ydhrg+8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728531301; c=relaxed/simple;
	bh=HRHgG5jbEVObO69ghP4ySIjYU1RAmUl9a4hkfRJ4aQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANrONF2z28Lwyurrs3hNmXoDeFmkL3wq6p2ySjv/Yw/1kDaL0/bL0BsDFAiarMOEefmWFievqUVxMCpnCQl5V+czmoTWTef7HvPcnZu8XeD/w0Q7N/N+ljKtZEHrPPU0odZWNEZ+X4hrJo3+KBLNFJMIk82Ig2xbsHM2jHXd8jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DEOhmpa2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8EEC4CEC6;
	Thu, 10 Oct 2024 03:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728531300;
	bh=HRHgG5jbEVObO69ghP4ySIjYU1RAmUl9a4hkfRJ4aQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DEOhmpa2qPEbQHb4KZYM8MjPjXiMLk3yOJWi4BO0kAX5vgg0g8w+k0kkGMP8qoj0A
	 kcz6O+2axML30axzbUVgTOdsTQ3m2BnHvcf36f0XsfKPBNKxagJ85Y/r4ve83Kyn9c
	 3d1XINXYb6kxOQ5vl9x30y6D9cNwmRZIRPjxxAdAQ4PDnVqJsX45JmjQ76fbtxGQBO
	 azo/oplOHBYucSWtKhGsTfqlfIakomGs7lpSjmqUrxVyorTM9iDC7THzafzBfMOtLR
	 vPfI3V/XOwqJZKXuNoZOiNVqLDOS9Fp3AnP2s1xwZieDFC8bOZmgR/EJ9/s9vw7E3l
	 6N2yKBDm6EnYA==
Date: Wed, 9 Oct 2024 22:34:59 -0500
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
Subject: Re: [PATCH RFC v2 1/2] dt-bindings: clock: ti: Convert interface.txt
 to json-schema
Message-ID: <20241010033459.GA1297859-robh@kernel.org>
References: <20241009205619.16250-1-andreas@kemnade.info>
 <20241009205619.16250-2-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009205619.16250-2-andreas@kemnade.info>

On Wed, Oct 09, 2024 at 10:56:18PM +0200, Andreas Kemnade wrote:
> Convert the OMAP interface clock device tree binding to json-schema.
> Specify the creator of the original binding as a maintainer.

Nice to see this! These are the top occurring undocumented (by schema) 
warnings for arm32.

> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  .../bindings/clock/ti/interface.txt           | 55 ---------------
>  .../bindings/clock/ti/ti,interface-clock.yaml | 70 +++++++++++++++++++
>  2 files changed, 70 insertions(+), 55 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/ti/interface.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,interface-clock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/ti/interface.txt b/Documentation/devicetree/bindings/clock/ti/interface.txt
> deleted file mode 100644
> index 85fb1f2d2d28..000000000000
> --- a/Documentation/devicetree/bindings/clock/ti/interface.txt
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -Binding for Texas Instruments interface clock.
> -
> -This binding uses the common clock binding[1]. This clock is
> -quite much similar to the basic gate-clock [2], however,
> -it supports a number of additional features, including
> -companion clock finding (match corresponding functional gate
> -clock) and hardware autoidle enable / disable.
> -
> -[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> -[2] Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
> -
> -Required properties:
> -- compatible : shall be one of:
> -  "ti,omap3-interface-clock" - basic OMAP3 interface clock
> -  "ti,omap3-no-wait-interface-clock" - interface clock which has no hardware
> -				       capability for waiting clock to be ready
> -  "ti,omap3-hsotgusb-interface-clock" - interface clock with USB specific HW
> -					handling
> -  "ti,omap3-dss-interface-clock" - interface clock with DSS specific HW handling
> -  "ti,omap3-ssi-interface-clock" - interface clock with SSI specific HW handling
> -  "ti,am35xx-interface-clock" - interface clock with AM35xx specific HW handling
> -  "ti,omap2430-interface-clock" - interface clock with OMAP2430 specific HW
> -				  handling
> -- #clock-cells : from common clock binding; shall be set to 0
> -- clocks : link to phandle of parent clock
> -- reg : base address for the control register
> -
> -Optional properties:
> -- clock-output-names : from common clock binding.
> -- ti,bit-shift : bit shift for the bit enabling/disabling the clock (default 0)
> -
> -Examples:
> -	aes1_ick: aes1_ick@48004a14 {
> -		#clock-cells = <0>;
> -		compatible = "ti,omap3-interface-clock";
> -		clocks = <&security_l4_ick2>;
> -		reg = <0x48004a14 0x4>;
> -		ti,bit-shift = <3>;
> -	};
> -
> -	cam_ick: cam_ick@48004f10 {
> -		#clock-cells = <0>;
> -		compatible = "ti,omap3-no-wait-interface-clock";
> -		clocks = <&l4_ick>;
> -		reg = <0x48004f10 0x4>;
> -		ti,bit-shift = <0>;
> -	};
> -
> -	ssi_ick_3430es2: ssi_ick_3430es2@48004a10 {
> -		#clock-cells = <0>;
> -		compatible = "ti,omap3-ssi-interface-clock";
> -		clocks = <&ssi_l4_ick>;
> -		reg = <0x48004a10 0x4>;
> -		ti,bit-shift = <0>;
> -	};
> diff --git a/Documentation/devicetree/bindings/clock/ti/ti,interface-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,interface-clock.yaml
> new file mode 100644
> index 000000000000..0e9542ed381f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti/ti,interface-clock.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/ti/ti,interface-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments interface clock.
> +
> +maintainers:
> +  - Tero Kristo <kristo@kernel.org>
> +
> +description: |
> +  This clock is quite much similar to the basic gate-clock[1], however,
> +  it supports a number of additional features, including
> +  companion clock finding (match corresponding functional gate
> +  clock) and hardware autoidle enable / disable.
> +
> +  [1] Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,omap3-interface-clock           # basic OMAP3 interface clock
> +      - ti,omap3-no-wait-interface-clock   # interface clock which has no hardware
> +                                           # capability for waiting clock to be ready
> +      - ti,omap3-hsotgusb-interface-clock  # interface clock with USB specific HW handling
> +      - ti,omap3-dss-interface-clock       # interface clock with DSS specific HW handling
> +      - ti,omap3-ssi-interface-clock       # interface clock with SSI specific HW handling
> +      - ti,am35xx-interface-clock          # interface clock with AM35xx specific HW handling
> +      - ti,omap2430-interface-clock        # interface clock with OMAP2430 specific HW handling
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
> +  ti,bit-shift:
> +    description:
> +      bit shift for the bit enabling/disabling the clock
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0

maximum: 31 ?

Otherwise,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

> +
> +required:
> +  - compatible
> +  - clocks
> +  - '#clock-cells'
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
> +      aes1_ick: clock-controller@3 {
> +        #clock-cells = <0>;
> +        compatible = "ti,omap3-interface-clock";
> +        clocks = <&security_l4_ick2>;
> +        reg = <3>;
> +      };
> +    };
> -- 
> 2.39.5
> 

