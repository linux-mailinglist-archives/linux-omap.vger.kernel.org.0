Return-Path: <linux-omap+bounces-2925-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA3A9FEA74
	for <lists+linux-omap@lfdr.de>; Mon, 30 Dec 2024 20:46:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A4471883A5C
	for <lists+linux-omap@lfdr.de>; Mon, 30 Dec 2024 19:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3421993A3;
	Mon, 30 Dec 2024 19:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2syL2h7"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608FF1DA3D;
	Mon, 30 Dec 2024 19:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735587976; cv=none; b=oFYjd601dZix+OobPVKc3UxB3KThy/3GtC49ABd4J+Zo7GHtC+Gyh4xrFdkOfcRLxH8q78h7clUSP46e54QgnCZ1REfAQSWVIiKA05PMTZPb8b+oezhmn5zzi/DvMk/DfXXB5IPuMmFye/XBbKUWf3xz6YwCvVtmHco1bTEpPb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735587976; c=relaxed/simple;
	bh=pwrekhb6iM83fDn68y5eSWMedNMkXIUJlXGtlqvUncU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uD7hr+PKvkeazF+tqmGH8F6eFOgObb0YRX/pjF4pWg34rcWLjsPJlLmtskr7km0WyVvj52cH3+BfWKphsXbyoCfmtkwlkGiv/2ZAH+rqFRhr4pH8eLsO3gW0qiMeFRM/l4GZmsi2GqehQAlIQwaCqEqBgCCe7B/Js61bepxoIu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2syL2h7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B389EC4CED0;
	Mon, 30 Dec 2024 19:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735587976;
	bh=pwrekhb6iM83fDn68y5eSWMedNMkXIUJlXGtlqvUncU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H2syL2h7c1H/BozWL16h/OzfOBlnIRu8dh7Z//BI3m7p9XHEnHDF4+x3DYhy80AUa
	 3WEOy3DgqaTWajuNRF5YAG37O257V96k59NmVRl1UUUc41NLre13BInqbIDT+Ik0aq
	 truXv+6jZQD3QCmVb+K25WCDScDro3Gs3gDzNqyW4cBa8q/Ci1S9+Scv2hag9KL+iC
	 M5nIJHZ5Qj3z0xeARPKFSFzlIqApFjO4cZmJ76KNEfBsnRvpi/HPl6YYM85xukxKUh
	 3pJ0m2DTUdUCTR+SvY2HDRenZt3m7F3bY1gYuGwVjTCQ/89JEonOvvm28YIplfsyWa
	 kD555Nw0ltMRw==
Date: Mon, 30 Dec 2024 13:46:14 -0600
From: Rob Herring <robh@kernel.org>
To: akemnade@kernel.org
Cc: Tero Kristo <kristo@kernel.org>, Andreas Kemnade <andreas@kemnade.info>,
	Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: clock: ti: Convert composite.txt to
 json-schema
Message-ID: <20241230194614.GA2255009-robh@kernel.org>
References: <20241229135351.5014-1-akemnade@kernel.org>
 <20241229135351.5014-3-akemnade@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241229135351.5014-3-akemnade@kernel.org>

On Sun, Dec 29, 2024 at 02:53:51PM +0100, akemnade@kernel.org wrote:
> From: Andreas Kemnade <andreas@kemnade.info>
> 
> Convert the OMAP gate clock device tree binding to json-schema.
> Specify the creator of the original binding as a maintainer.
> Choose GPL-only license because original binding was also GPL.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  .../bindings/clock/ti/composite.txt           | 55 -------------
>  .../bindings/clock/ti/ti,composite-clock.yaml | 80 +++++++++++++++++++
>  2 files changed, 80 insertions(+), 55 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/ti/composite.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,composite-clock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/ti/composite.txt b/Documentation/devicetree/bindings/clock/ti/composite.txt
> deleted file mode 100644
> index 238e6f7d74f8..000000000000
> --- a/Documentation/devicetree/bindings/clock/ti/composite.txt
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -Binding for TI composite clock.
> -
> -This binding uses the common clock binding[1]. It assumes a
> -register-mapped composite clock with multiple different sub-types;
> -
> -a multiplexer clock with multiple input clock signals or parents, one
> -of which can be selected as output, this behaves exactly as [2]
> -
> -an adjustable clock rate divider, this behaves exactly as [3]
> -
> -a gating function which can be used to enable and disable the output
> -clock, this behaves exactly as [4]
> -
> -The binding must provide a list of the component clocks that shall be
> -merged to this clock. The component clocks shall be of one of the
> -"ti,*composite*-clock" types.
> -
> -[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> -[2] Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml
> -[3] Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
> -[4] Documentation/devicetree/bindings/clock/ti/gate.txt
> -
> -Required properties:
> -- compatible : shall be: "ti,composite-clock"
> -- clocks : link phandles of component clocks
> -- #clock-cells : from common clock binding; shall be set to 0.
> -
> -Optional properties:
> -- clock-output-names : from common clock binding.
> -
> -Examples:
> -
> -usb_l4_gate_ick: usb_l4_gate_ick {
> -	#clock-cells = <0>;
> -	compatible = "ti,composite-interface-clock";
> -	clocks = <&l4_ick>;
> -	ti,bit-shift = <5>;
> -	reg = <0x0a10>;
> -};
> -
> -usb_l4_div_ick: usb_l4_div_ick {
> -	#clock-cells = <0>;
> -	compatible = "ti,composite-divider-clock";
> -	clocks = <&l4_ick>;
> -	ti,bit-shift = <4>;
> -	ti,max-div = <1>;
> -	reg = <0x0a40>;
> -	ti,index-starts-at-one;
> -};
> -
> -usb_l4_ick: usb_l4_ick {
> -	#clock-cells = <0>;
> -	compatible = "ti,composite-clock";
> -	clocks = <&usb_l4_gate_ick>, <&usb_l4_div_ick>;
> -};
> diff --git a/Documentation/devicetree/bindings/clock/ti/ti,composite-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,composite-clock.yaml
> new file mode 100644
> index 000000000000..b7063764bc0a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti/ti,composite-clock.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/ti/ti,composite-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments composite clock
> +
> +maintainers:
> +  - Tero Kristo <kristo@kernel.org>
> +
> +description: |
> +  This binding assumes a register-mapped composite clock with multiple
> +  different sub-types;

s/;/:/

> +
> +  a multiplexer clock with multiple input clock signals or parents, one
> +  of which can be selected as output, this behaves exactly as [1].
> +
> +  an adjustable clock rate divider, this behaves exactly as [2].
> +
> +  a gating function which can be used to enable and disable the output
> +  clock, this behaves exactly as [3].

Indent these 3 paragraphs more since they are a list.

> +
> +  The binding must provide a list of the component clocks that shall be
> +  merged to this clock. The component clocks shall be of one of the
> +  "ti,*composite*-clock" types.
> +
> +  [1] Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml
> +  [2] Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
> +  [3] Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml
> +
> +properties:
> +  compatible:
> +    const: ti,composite-clock
> +
> +  "#clock-cells":
> +    const: 0
> +
> +  clocks: true
> +
> +  clock-output-names:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    bus {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      usb_l4_gate_ick: clock-controller@a10 {
> +        #clock-cells = <0>;
> +        compatible = "ti,composite-interface-clock";
> +        clocks = <&l4_ick>;
> +        ti,bit-shift = <5>;
> +        reg = <0x0a10>;
> +      };
> +
> +      usb_l4_div_ick: clock-controller@a40 {
> +        #clock-cells = <0>;
> +        compatible = "ti,composite-divider-clock";
> +        clocks = <&l4_ick>;
> +        ti,bit-shift = <4>;
> +        ti,max-div = <1>;
> +        reg = <0x0a40>;
> +        ti,index-starts-at-one;
> +      };
> +    };
> +
> +    clock-controller {
> +      #clock-cells = <0>;
> +      compatible = "ti,composite-clock";
> +      clocks = <&usb_l4_gate_ick>, <&usb_l4_div_ick>;
> +    };
> -- 
> 2.39.5
> 

