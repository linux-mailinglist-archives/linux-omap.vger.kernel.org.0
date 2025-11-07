Return-Path: <linux-omap+bounces-4874-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DECC41567
	for <lists+linux-omap@lfdr.de>; Fri, 07 Nov 2025 19:47:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CD303AE8BD
	for <lists+linux-omap@lfdr.de>; Fri,  7 Nov 2025 18:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 429323346B7;
	Fri,  7 Nov 2025 18:47:42 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8D62765E3
	for <linux-omap@vger.kernel.org>; Fri,  7 Nov 2025 18:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762541262; cv=none; b=oJv1Ch874kECQlURxBKy32HxOKCxhZiMfw9Rw4xsWCaRZqKMMOiBvbmJSFlrflS1T/OFKnwHYMpbbKakdZjGPmfl2tN0w8eUecz3j+0j8rvQASLdL3xz9W/fEmYwdhNqIzjykUk1Ur30l6wU4iJkkEflEOwJ1GgUf0aHgjnA3yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762541262; c=relaxed/simple;
	bh=3wL2Fx1GM+1qPw2Dwp+GpV6ZmRbeZuisDU0PcVxgC9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R7USbCClUI9qJOFg2t3Y1lJrsNceeDwAkFKxHZN11jmCWcqiiPE0+1l8Uhx60uYXuEf37qptrrLrmc066vmVPF3uzfycOCWyNpCY1+oOO2YwzOYVTcgmyiwga8EJCSpjJoLyip9Drc2OpCqUS38mw55mxHgN1A2qzeBXXJP/ufw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vHRUm-0006Ym-31; Fri, 07 Nov 2025 19:47:36 +0100
Message-ID: <91f764ab-bec1-4791-b01b-3ba0803ce8f8@pengutronix.de>
Date: Fri, 7 Nov 2025 19:47:34 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: DT compatibility break for am335x (Was: Re: [PATCH] ARM: dts:
 am33xx-l4: fix UART compatible)
To: Bruno Thomsen <bruno.thomsen@gmail.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20250721173741.6369-1-bruno.thomsen@gmail.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20250721173741.6369-1-bruno.thomsen@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-omap@vger.kernel.org

Hello Bruno,

On 21.07.25 19:37, Bruno Thomsen wrote:
> Fixes the following dtschema check warning:
> 
> serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
> 	['ti,am3352-uart', 'ti,omap3-uart'] is too long
> 	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
> 	'ti,am654-uart' was expected
> 	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
> 
> Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>

I tripped over this patch, because it broke the console in barebox after the
device tree sync with Linux v6.18-rc1, fortunately caught before release.

I believe the correct resolution for the DT binding warning would have been
to extend the compatible list in the binding with ti,omap3-uart if they are
indeed compatible.

I have submitted a patch to add the now sole compatible to the barebox driver[1],
but please keep DT compatibility in mind with similar changes in future.

[1]: https://lore.kernel.org/barebox/20251107182805.3367244-1-a.fatoum@pengutronix.de/T/#u

Thanks,
Ahmad


> ---
>  arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
> index d6a143abae5f..cef24aafed1a 100644
> --- a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
> @@ -200,7 +200,7 @@ SYSC_OMAP2_SOFTRESET |
>  			ranges = <0x0 0x9000 0x1000>;
>  
>  			uart0: serial@0 {
> -				compatible = "ti,am3352-uart", "ti,omap3-uart";
> +				compatible = "ti,am3352-uart";
>  				clock-frequency = <48000000>;
>  				reg = <0x0 0x1000>;
>  				interrupts = <72>;
> @@ -1108,7 +1108,7 @@ SYSC_OMAP2_SOFTRESET |
>  			ranges = <0x0 0x22000 0x1000>;
>  
>  			uart1: serial@0 {
> -				compatible = "ti,am3352-uart", "ti,omap3-uart";
> +				compatible = "ti,am3352-uart";
>  				clock-frequency = <48000000>;
>  				reg = <0x0 0x1000>;
>  				interrupts = <73>;
> @@ -1139,7 +1139,7 @@ SYSC_OMAP2_SOFTRESET |
>  			ranges = <0x0 0x24000 0x1000>;
>  
>  			uart2: serial@0 {
> -				compatible = "ti,am3352-uart", "ti,omap3-uart";
> +				compatible = "ti,am3352-uart";
>  				clock-frequency = <48000000>;
>  				reg = <0x0 0x1000>;
>  				interrupts = <74>;
> @@ -1770,7 +1770,7 @@ SYSC_OMAP2_SOFTRESET |
>  			ranges = <0x0 0xa6000 0x1000>;
>  
>  			uart3: serial@0 {
> -				compatible = "ti,am3352-uart", "ti,omap3-uart";
> +				compatible = "ti,am3352-uart";
>  				clock-frequency = <48000000>;
>  				reg = <0x0 0x1000>;
>  				interrupts = <44>;
> @@ -1799,7 +1799,7 @@ SYSC_OMAP2_SOFTRESET |
>  			ranges = <0x0 0xa8000 0x1000>;
>  
>  			uart4: serial@0 {
> -				compatible = "ti,am3352-uart", "ti,omap3-uart";
> +				compatible = "ti,am3352-uart";
>  				clock-frequency = <48000000>;
>  				reg = <0x0 0x1000>;
>  				interrupts = <45>;
> @@ -1828,7 +1828,7 @@ SYSC_OMAP2_SOFTRESET |
>  			ranges = <0x0 0xaa000 0x1000>;
>  
>  			uart5: serial@0 {
> -				compatible = "ti,am3352-uart", "ti,omap3-uart";
> +				compatible = "ti,am3352-uart";
>  				clock-frequency = <48000000>;
>  				reg = <0x0 0x1000>;
>  				interrupts = <46>;
> 
> base-commit: 89be9a83ccf1f88522317ce02f854f30d6115c41


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

