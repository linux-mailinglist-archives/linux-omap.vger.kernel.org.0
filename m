Return-Path: <linux-omap+bounces-2817-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A19D9F0D3B
	for <lists+linux-omap@lfdr.de>; Fri, 13 Dec 2024 14:23:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A82116089C
	for <lists+linux-omap@lfdr.de>; Fri, 13 Dec 2024 13:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 211951E009B;
	Fri, 13 Dec 2024 13:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="taDX7bcz"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A8B1DFE3A;
	Fri, 13 Dec 2024 13:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734096226; cv=none; b=L1cyu5VPvOlcqi01KUVmF88K22Fa5f4eqea9QEwboyGPTn1AvOt6c1gINt4wVLxfTxE7zhmXPhuvow7vgZiAtmcftmByZB/MwRCJPTTt/ezS8weevRGMdWNGvy7yh1xHDKoNAmI0nvRrrRpRah2Bp/VzWVXVA7SsBH7wbUMVNhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734096226; c=relaxed/simple;
	bh=1EaPPBSw8SwzoJoo4tB8Jv6iIScsKRwkT98iNlANf8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q6x6FOVRlMHl91NhG4dXZOGNAxo6yQ2hoAxediSAlRRY/aKUuDh8HXmof9UWuBiylva+ef3IMVWBbP28+rRLqaNtDy0pBTjnCoRySPi5quiRwzaI8vqbRhWLm+gOawugduoG4/uXBqah3mRPlLrSYOkF0mB9fjIPD8znew1GAkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=taDX7bcz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CA45C4CED0;
	Fri, 13 Dec 2024 13:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734096226;
	bh=1EaPPBSw8SwzoJoo4tB8Jv6iIScsKRwkT98iNlANf8s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=taDX7bczBkOhBarSfnClG75+F1WNp++CycTJtaaMiDU3YDf1j1EE/sUJBIQPIgShp
	 maFFyehxIpm/oEK94d2PQfXVjxUYqnHRYxshVhlUv39sA7CbsQHvtr2X17rG9+inhP
	 C7jlZS090Tat7gCvwcRsLu+r3CfotONwY/eS5rcs+UZgUhlsBmC/zR2wv1QUrlzNqK
	 GR9VG2MmLJhAq+whh8DVCTkjiGtZcrMzO4QGJ7RweslCv3rOJXkm4RGmDq2+dG2yC1
	 hF+03S6M6fBB0h21W5Kn7PeJ/AUQ5oJRlonyBSMYjtaFwodZIOpUWf00nKJ4EKUCV4
	 Vid6VaJ8iUsXw==
Message-ID: <9422b770-9fa7-452e-b6d1-fcd6d1ea7acb@kernel.org>
Date: Fri, 13 Dec 2024 14:23:38 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] dt-bindings: mfd: omap-usb-tll: convert to YAML
To: Karol Przybylski <karprzy7@gmail.com>, andreas@kemnade.info,
 rogerq@kernel.org, lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org
References: <20241212153138.368086-1-karprzy7@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241212153138.368086-1-karprzy7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/12/2024 16:31, Karol Przybylski wrote:
> Conversion of omap-usb-tll.txt into yaml format, inspired by discussion in [1]
> 

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

Also, your commit msg should explain changes made to the binding during
conversion.

> Changes after v1:
> Added Roger Quadros as maintainer
> Removed deprecated property 'ti,hwmod'
> Renamed .yaml file

Changelog goes after ---.

> 
> 1 - https://lore.kernel.org/all/cd915c18-7230-4c38-a860-d2a777223147@kernel.org/
> 
> Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
> ---

<form letter>
Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC. It might happen, that command when run on an older
kernel, gives you outdated entries. Therefore please be sure you base
your patches on recent Linux kernel.

Tools like b4 or scripts/get_maintainer.pl provide you proper list of
people, so fix your workflow. Tools might also fail if you work on some
ancient tree (don't, instead use mainline) or work on fork of kernel
(don't, instead use mainline). Just use b4 and everything should be
fine, although remember about `b4 prep --auto-to-cc` if you added new
patches to the patchset.

You missed at least devicetree list (maybe more), so this won't be
tested by automated tooling. Performing review on untested code might be
a waste of time.

Please kindly resend and include all necessary To/Cc entries.
</form letter>

This wasn't tested, so just brief review:

>  .../devicetree/bindings/mfd/omap-usb-tll.txt  | 27 -----------
>  .../devicetree/bindings/mfd/ti,usbhs-tll.yaml | 46 +++++++++++++++++++
>  2 files changed, 46 insertions(+), 27 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/omap-usb-tll.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/ti,usbhs-tll.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/omap-usb-tll.txt b/Documentation/devicetree/bindings/mfd/omap-usb-tll.txt
> deleted file mode 100644
> index c58d70437..000000000
> --- a/Documentation/devicetree/bindings/mfd/omap-usb-tll.txt
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -OMAP HS USB Host TLL (Transceiver-Less Interface)
> -
> -Required properties:
> -
> -- compatible : should be "ti,usbhs-tll"
> -- reg : should contain one register range i.e. start and length
> -- interrupts : should contain the TLL module's interrupt
> -- ti,hwmod : must contain "usb_tll_hs"
> -
> -Optional properties:
> -
> -- clocks: a list of phandles and clock-specifier pairs, one for each entry in
> -  clock-names.
> -
> -- clock-names: should include:
> -  * "usb_tll_hs_usb_ch0_clk" - USB TLL channel 0 clock
> -  * "usb_tll_hs_usb_ch1_clk" - USB TLL channel 1 clock
> -  * "usb_tll_hs_usb_ch2_clk" - USB TLL channel 2 clock
> -
> -Example:
> -
> -	usbhstll: usbhstll@4a062000 {
> -		compatible = "ti,usbhs-tll";
> -		reg = <0x4a062000 0x1000>;
> -		interrupts = <78>;
> -		ti,hwmods = "usb_tll_hs";
> -	  };
> diff --git a/Documentation/devicetree/bindings/mfd/ti,usbhs-tll.yaml b/Documentation/devicetree/bindings/mfd/ti,usbhs-tll.yaml
> new file mode 100644
> index 000000000..d666d3e23
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ti,usbhs-tll.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/ti,usbhs-tll.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OMAP HS USB Host TLL (Transceiver-Less Interface)
> +
> +maintainers:
> +  - <rogerq@kernel.org>

Use full name from the maintainers.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,usbhs-tll
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1

missing maxItems.

minItems incorrect - below you have two.

> +
> +  clock-names:
> +    items:
> +      - const: usb_tll_hs_usb_ch0_clk
> +      - const: usb_tll_hs_usb_ch1_clk
> +      - const: usb_tll_hs_usb_ch2_clk
> +    minItems: 2

Nut anyway, why is this flexible?

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    usbhstll@4a062000 {
> +      compatible = "ti,usbhs-tll";
> +      reg = <0x4a062000 0x1000>;
> +      interrupts = <78>;

Make example complete.

> +    };


Best regards,
Krzysztof

