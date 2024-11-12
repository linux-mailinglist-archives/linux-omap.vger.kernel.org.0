Return-Path: <linux-omap+bounces-2664-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1035C9C5609
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2024 12:15:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67A2CB4423E
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2024 11:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B55B21CFA0;
	Tue, 12 Nov 2024 10:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="9oMiat9a"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5776421CF86;
	Tue, 12 Nov 2024 10:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731408528; cv=none; b=qd21qqJmmElRqo8ojXhuW6w60O2LuoOLah6vV4lGTejz7o/ihfBsVPMSM/P6sGMc3UVXmHRqZXFDYcqOGUM6Mquu/bt9q/aqvMI0Lkxt2p9HvwFZx2AFY8Lm1Frnl6inPx3Ag2gw0EIHhF3J8WmMAprPimyzdLpZLMEGqxNfPu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731408528; c=relaxed/simple;
	bh=Rlz9/2w3HuGHPx/1Dx6dMSeAHh6+zlOAnHthXakqKJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d+wxFEPST5Ua9G2imtY5gPmu/raZSUw7lmZBvPgHQUhG/SMRjxcQKzA//Kzt6f1wTHY+Z2ohooSqsHoW/OuzLTstD66/GmeLrwQFNBgOckKFU/CTS2Q3e8/lQ+ywik9wlXNylXULRWfDcsjiSJe0azdb47AMa7tG3qUtRPQS4Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=9oMiat9a; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=2m7yLhxfZDBBcaSm+o4e0Z6YDFzbc2KbJ1HEoJJMrgE=; b=9oMiat9aS3OnXG3WvYQ6dodxHB
	c3IKeiuhoIjkbP/vFCRnyEKdsl90Q82eNInauL9GoJFDN6sN/smTp40tdct7YHbmusIztadZeNmT1
	cMA32aoHjjpu+yKHPZr3sMJE0SXKKv8n09FgEm6HNwnVZ3xYBr/QG8Q0PEvXAJ60wd2xK7/g/atl1
	5cidNMeMHYtCv1CxH09N+J4oAvA2DozhbCpxbtemIOZsxhUpKlrGweu3bj2lRyvOONLu+cZs+FZJn
	0/eXYnZJRXoVFmduzywld+K6DGYhoeTbfRx/GqN6A460Lbv1GK1yxOZxQO8CeeS0eOplhyS4GE/fh
	v+x5pbSg==;
Date: Tue, 12 Nov 2024 11:48:18 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Mithil Bavishi <bavishimithil@gmail.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Reding
 <thierry.reding@gmail.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 10/10] ARM: dts: ti: omap: samsung-espresso10: Add
 initial support for Galaxy Tab 2 10.1
Message-ID: <20241112114818.1eb238e9@akair>
In-Reply-To: <20241108200440.7562-11-bavishimithil@gmail.com>
References: <20241108200440.7562-1-bavishimithil@gmail.com>
	<20241108200440.7562-11-bavishimithil@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Fri,  8 Nov 2024 20:04:39 +0000
schrieb Mithil Bavishi <bavishimithil@gmail.com>:

> Create a device tree for the 10 inch variants (P5100, P5110, P5113)
> 
> Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
> ---
>  .../dts/ti/omap/omap4-samsung-espresso10.dts  | 102 ++++++++++++++++++
>  1 file changed, 102 insertions(+)
>  create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts
> 
> diff --git a/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts
> new file mode 100644
> index 000000000..70bbef468
> --- /dev/null
> +++ b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/dts-v1/;
> +
> +#include "omap4-samsung-espresso-common.dtsi"
> +#include <dt-bindings/power/summit,smb347-charger.h>
> +/ {
> +	model = "Samsung Galaxy Tab 2 (10 inch)";
> +	compatible = "samsung,espresso10", "ti,omap4430", "ti,omap4";
> +
> +	i2c-gpio-5 {
> +		smb347: charger@6 {
> +			compatible = "summit,smb347";
> +			reg = <0x6>; // 0x0C >> 1
> +			interrupt-parent = <&gpio2>;
> +			interrupts = <0 IRQ_TYPE_EDGE_BOTH>;
> +
> +			summit,enable-usb-charging;
> +			summit,enable-charge-control = <SMB3XX_CHG_ENABLE_SW>;
> +			summit,chip-temperature-threshold-celsius = <120>;
> +			summit,usb-current-limit-microamp = <1800000>;
> +		};
> +	};
> +
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&backlight_pins>;
> +		pwms = <&pwm10 0 1600 0>;
> +		power-supply = <&reg_lcd>;
> +		enable-gpios = <&gpio3 31 GPIO_ACTIVE_HIGH>;
> +		brightness-levels = <0 4 8 16 32 64 128 255>;
> +		default-brightness-level = <7>;
> +	};
> +
> +	panel {
> +		compatible = "samsung,ltn101al03", "panel-lvds";
> +		power-supply = <&reg_lcd>;
> +		width-mm = <223>;
> +		height-mm = <125>;
> +		data-mapping = "vesa-24";
> +		backlight = <&backlight>;
> +
> +		panel-timing {
> +			clock-frequency = <69818000>;
> +
> +			hback-porch = <64>;
> +			hactive = <1280>;
> +			hfront-porch = <16>;
> +			hsync-len = <48>;
> +
> +			vback-porch = <11>;
> +			vactive = <800>;
> +			vfront-porch = <16>;
> +			vsync-len = <3>;
> +
> +			hsync-active = <0>;
> +			vsync-active = <0>;
> +			de-active = <1>;
> +			pixelclk-active = <1>;
> +		};
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&bridge_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&i2c3 {
> +	touchscreen: synaptics-rmi4-i2c@20 {

touchscreen@20

> +		compatible = "syna,rmi4-i2c";
> +		reg = <0x20>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		interrupt-parent = <&gpio2>;
> +		interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&touch_pins>;
> +
> +		avdd-supply = <&reg_touch_ldo_en>;
not known in schema

> +		vdd-supply = <&ldo6>;
> +
> +		syna,reset-delay-ms = <200>;
> +		syna,startup-delay-ms = <200>;
> +
> +		touchscreen-size-x = <1279>;

Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml:
horizontal resolution of touchscreen (maximum x coordinate reported + 1)

So this touchscreen reports max 1278?

> +		touchscreen-size-y = <799>;

same question.

And these things belong below rm4-f11 according to
Documentation/devicetree/bindings/input/syna,rmi4.yaml

Regards,
Andreas

