Return-Path: <linux-omap+bounces-2832-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 369A39F43D1
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 07:38:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D3DD7A529C
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 06:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A5C160783;
	Tue, 17 Dec 2024 06:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="queR8hmt"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC9B14C5AF;
	Tue, 17 Dec 2024 06:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734417499; cv=none; b=fytx/ojlIUyBYlhiFGZE/MJKu8/RqNldNoUbMm/E/5NYtb4jsxQAuon5v2QmDfPNHp6gYGl/2frQgvgzNjxSI3VtonWpTTJInpG8ys60i2hwQHVn3rkj3gewKt6VFPNJ64NYVSvjolPsM+D4CFX8mF9dLrddsa5KsJ5d+Tb0E60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734417499; c=relaxed/simple;
	bh=iXgTN+THXFFDY1ixNjCIqNClPIcvMU+2H7cPf+003N4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vb4KhxRBIl8yOJ/q+Z12KIlckNpPgue/X4OZUhh4n4/fbGK89iRrLeVMDX4plXm+7qlvPLPgNg/nkmCRfLaH6DYPrAYxoC2oOxzTJYVTXJ633r2GoZRusA/pS7d5EHHw6q9Uekf6dPElkTBxqyPmqrN5rFWhB5J9Xc2LJQcnekw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=queR8hmt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB68C4CED3;
	Tue, 17 Dec 2024 06:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734417499;
	bh=iXgTN+THXFFDY1ixNjCIqNClPIcvMU+2H7cPf+003N4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=queR8hmtQVc+yn1esnw/lzAc7CHHD28ehkLb9dqDDIvghFxahycnGT++oNfjwjk/u
	 ay6Red0gTMk2ETogtxzn7c+a0f0PZNI2Y6K9/hjJhyxyZxdm+Qjyz5+J8PCBJSzPgs
	 XhqT+oCvkwZNm0PwFrhDjZBGI2GcH/boRIhYSqkBE7eOTMX0ZslY4nuJN18UP3rpG6
	 AaAVVXztdSvyLR73KProaRrJAr+s4h+KVIwQrVDumNPDQcV7zGFKfb6x2Rp1x2GOzJ
	 Cp2LMdnH8yvKKKgAkrINhQ7Ner0w3lXEt+b2Agry1UeqsHJHEk086AC8ioO7XaYd0T
	 Y0Zoneiw/uV8A==
Date: Tue, 17 Dec 2024 07:38:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Karol Przybylski <karprzy7@gmail.com>
Cc: andreas@kemnade.info, rogerq@kernel.org, lee@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org
Subject: Re: [PATCHv3] dt-bindings: mfd: omap-usb-tll: convert to YAML
Message-ID: <r4gzj34igulq7ivb6jed5liw5ya62b7fyhp4aqpuuc6wok2bp5@wbyxkpa7q6wd>
References: <20241214215207.842765-1-karprzy7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241214215207.842765-1-karprzy7@gmail.com>

On Sat, Dec 14, 2024 at 10:52:07PM +0100, Karol Przybylski wrote:
> Conversion of omap-usb-tll.txt into yaml format, inspired by discussion in
> lore.kernel.org/all/cd915c18-7230-4c38-a860-d2a777223147@kernel.org/
> 
> Changes made to the binding during conversion:
> - Added Roger Quadros as maintainer
> - Removed deprecated ti,hwmod
> - Renamed .yaml file to ti,usbhs-tll.yaml
> 
> Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
> ---

Changelog goes here. I asked about this last time.

Use b4 or `git format-patch -v3`, so there will be proper space before
v3 in subject prefix.

These are nits but the problem is that you never responded to my review
and did not implement it fully.

>  .../devicetree/bindings/mfd/omap-usb-tll.txt  | 27 -----------
>  .../devicetree/bindings/mfd/ti,usbhs-tll.yaml | 47 +++++++++++++++++++
>  2 files changed, 47 insertions(+), 27 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/omap-usb-tll.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/ti,usbhs-tll.yaml

...

> +  clocks:
> +    minItems: 1
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: usb_tll_hs_usb_ch0_clk
> +      - const: usb_tll_hs_usb_ch1_clk
> +      - const: usb_tll_hs_usb_ch2_clk
> +    minItems: 1

Same question as last time - why the number of clocks is flexible?
Original binding suggested that if clocks are present, then three clocks
are required, so you are changing here something which should be
explained in commit msg.

More over, implementation suggests that you could provide clock "ch2"
without "ch0" and "ch1", which your binding does not allow. So again a
change or deviation from the current ABI.

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

Nothing improved here. See my last comment.

Best regards,
Krzysztof


