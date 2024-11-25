Return-Path: <linux-omap+bounces-2729-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE08C9D8E03
	for <lists+linux-omap@lfdr.de>; Mon, 25 Nov 2024 22:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF4E8B2CAC4
	for <lists+linux-omap@lfdr.de>; Mon, 25 Nov 2024 21:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5F81CD21B;
	Mon, 25 Nov 2024 21:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="IMaMPSBR"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716801CCEF8;
	Mon, 25 Nov 2024 21:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732570215; cv=none; b=kwRvDZ1oaDQ8+xAKFpdTn6EOXVSnb0zSaZcsue5ijT0CDw+dwHPYCat+v33VpG6O/he33O2uppv0+OdnEDBTdPgojLU0Uz1jPc6ecgLIfe9G2NNEOC/ZP0CqpALg/uOZg2c3nH0MStb2NbpDOHf3ctSWxzzVZ9RyS2rL6cjdB+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732570215; c=relaxed/simple;
	bh=4O6BXFuQzDtPnFLXu56acl6DbuUQWT9MKV7AxwD9Dso=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=itdux1DULhvXyOV5+UoUENz6apvJPyrDohjXmLmRHYTj0BeQGWp/NxLwn5ADmn3NIbTz+qqcBtjIPEgUtoNFHWMHOADH/sVAU9Lk+ZIMN+kAESMfET3efoBNN9uE+9ygscaJBjh2Jp1epal/dlwAMyy46P/Oxo0jPOIEbeh81KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=IMaMPSBR; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=OBqvw9C3qDYIhkxocUnc72l/ACN2rkhM5PpmpOhWLfI=; b=IMaMPSBRYPv6NoiXYdzaappXwf
	fqyl4xtfVzMsq6XB1LVKxzy6tpvZk+nTqAV1I2Yzu+NSyn2gtOzpW5GBWzNGRvT1RJJ/UEj+x/xO/
	2vY++hWKxTrfX2MjKLAnzxS3GIgthJt61sNDWCU7gEX9WQgCX4xaLoPUUfArWvrIDAdAnbgTnPr3q
	x6C5oK3RrQCn8ybV9nfoCrbmCdcGANVDCchNXZo/R7c4X10wKs8ISihnUjNrxTBiJoThTKbKX4gXc
	wBXmqEVMUb2u+RWuuKS/WRcb5Vg/v/VTdtZEYJNKWMnxPbNcGJSRoPTQjbgjQznOzO3i0W6Q/LzeT
	Wvfsizbw==;
Date: Mon, 25 Nov 2024 22:29:46 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Mithil Bavishi <bavishimithil@gmail.com>
Cc: Laurent.pinchart@ideasonboard.com, aaro.koskinen@iki.fi,
 airlied@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 khilman@baylibre.com, krzk+dt@kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
 quic_jesszhan@quicinc.com, rfoss@kernel.org, robh@kernel.org,
 rogerq@kernel.org, simona@ffwll.ch, thierry.reding@gmail.com,
 tony@atomide.com, tzimmermann@suse.de
Subject: Re: [PATCH v3 06/10] ARM: dts: ti: omap: espresso-common: Add
 common device tree for Samsung Galaxy Tab 2 series
Message-ID: <20241125222946.51fa8cec@akair>
In-Reply-To: <20241123181405.861-1-bavishimithil@gmail.com>
References: <20241112100616.5349ad37@akair>
	<20241123181405.861-1-bavishimithil@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Sat, 23 Nov 2024 18:14:05 +0000
schrieb Mithil Bavishi <bavishimithil@gmail.com>:

> > > +			no-map;
> > > +			reg = <0xA0000000 0x200000>;  
> >
> > If used for ramoops, then there should be a compatible = "ramoops"
> > see Documentation/devicetree/bindings/reserved-memory/ramoops.yaml  
> > > +		};
> > > +
> > > +		continuous_splash: framebuffer@bef00000{
> > > +			reg = <0xbef00000 (1024 * 600 * 4)>;
> > > +			no-map;
> > > +		};
> > > +	};
> > > +
> > > +	chosen { 
> > > +		#address-cells = <1>;
> > > +		#size-cells = <1>;
> > > +		ranges;  
> > 
> > hmm, no bus here, so no need for address/size-cells, rather specify
> > stdout-path, etc.  
> 
> Will be dropping rampoops_region, and chosen nodes. They were used
> initially for debugging, since we now have drm for display and other
> means to get logs, these are not required.
> 
you might want to set stdout-path in chosen for earlycon to work.

> > > +	i2c-gpio-5 {
> > > +		compatible = "i2c-gpio";
> > > +		sda-gpios = <&gpio4 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +		scl-gpios = <&gpio4 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +		i2c-gpio,delay-us = <10>;
> > > +		#address-cells = <1>;
> > > +		#size-cells = <0>;  
> > hmm, no pinmux here?   
> 
> Cannot seem to find it in the muxset given in vendor kernel.

If in doubt, you can get it via busybox devmem from a working system,
look in the reference manual for the gpios, I think they are at:
for sda: 0x4A1000DE 
for scl: 0x4A1000E0
Now you need Mode 3 with input pullup.

> These are placeholders for now and hold other devices like smb136
> charger, stmpe811 adc etc. Drivers for which I need to upstream first.
> 
> https://github.com/MightyM17/linux_pvr/blob/testing/arch/arm/boot/dts/omap4-samsung-espresso7.dts#L10-L24
> 
> So for now is it better to drop them?
> 
keep them and add comments for the devices without driver/binding, so
people can get in touch regarding driver testing, etc.

E.g. like this one:
https://elixir.bootlin.com/linux/v6.12/source/arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts#L138

Regarding missing devices:
btw: you know that the wm1811 is covered by the wm8994 driver?

[...]
> > It might be an idea to use a dedicated wakeup irq instead of
> > explicitely specifying WAKEUP_EN like you did for the uart.
> > That counts for other occurances of WAKEUP_EN as well.  
> 
> Could you point out to some examples having this change?
> I have just followed how muxset mentioned it. I assume this can be
> worked on later as well.
> 
Look around for pmx_core in the devicetrees, you find e.g:
in motorola-mapphone-common.dtsi:

        tmp105@48 {
                compatible = "ti,tmp105";
                reg = <0x48>;
                pinctrl-0 = <&tmp105_irq>;
                pinctrl-names = "default";
                /* kpd_row0.gpio_178 */
                interrupts-extended = <&gpio6 18 IRQ_TYPE_EDGE_FALLING
                                       &omap4_pmx_core 0x14e>;
                interrupt-names = "irq", "wakeup";
                wakeup-source;
        };

and of course the uart interrupts in your submission. There is an
offset of 0x40 between things in OMAP4_IOPAD and &omap4_pmx_core 0x...

So you replace some WAKEUP_EN with such a wakeup interrupt and
wakeup-source property. You do not need to do that for stuff in the
wakeup domain (GPIO1). That should work for any i2c device with
interrupts. With that, you can control wakeup from suspend via
/sys/i2c/devices/X-YY/power/wakeup (or maybe power/wakeup of subdevices
thereof.

Regarding Wifi or Bluetooth wakeup, I doubt that WAKEUP_EN has any
effect. If BT or Wifi wakeup is enabled, the gpio is kept active so
power consumption is elevated anyways and nothing sleeps what can be
woken up by WAKEUP_EN unless the driver supports a dedicated wakeup irq.

So I think, replace the WAKEUP_EN for wakeup irqs for i2c stuff and
remove the WAKEUP_EN in wifi/bt if it has no effect there.
 
> > generic node names:
> > pmic@48  
> 
> Changed.
> 
> > > +	accelerometer@18 {
> > > +		compatible = "bosch,bma254";
> > > +		reg = <0x18>;
> > > +		vdd-supply = <&ldo4>;
> > > +		vddio-supply = <&ldo5>;
> > > +		interrupt-parent = <&gpio4>;
> > > +		interrupts = <25 (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_EDGE_RISING)>,
> > > +			<26 (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_EDGE_RISING)>;  
> > 
> > this looks odd, binding says IRQ_TYPE_EDGE_RISING. Why do you think you
> > need both? After something is rising, it is high, so both seem not to
> > make sense.  
> 
> https://github.com/torvalds/linux/commit/5640fed3035e88c3ce1361e6fc93f4e72468f307
> This was worked on before the above mentioned change, hence the confusion.
> bma180 schema wants both the interrupts, I do not know why, but now it has
> moved to the bma255 schema which makes more sense.
> Fixed it according to new schema.
> 
> > +		mount-matrix =  "-1",  "0",  "0",
> > +				"0",  "1",  "0",
> > +				"0",  "0", "1";  
> 
> > hmm, checking twice, since I mixed up something earlier. This just
> > inverts x values, so we are mirroring across y-z plane, that does not
> > look like a rotation matrix, so it does not describe how it is mounted.
> > Eg. the n900 has two -1 in there, that is a turn by 180 degree.
> > 
> > Your mount-matrix would be achieved, by cutting the chip into ultra
> > thin slices, sorting them upside down and glueing that together. I
> > doubt somebody does that.  
> 
> Went through the mount matrix docs multiple times. It seems fairly
> straightforward for the accelerometer. being just a matrix that we can
> multiply to get a desired result.

In your opinion, you can use the matrix for any kind of conversion of
the values. which can mathematically be done. Which a matrix you can
scale things e.g. too. But there is also the scale parameter. So I
doubt that there are limits what should be done with that matrix.

In my understanding, the matrix is for describing how the chip is
rotated towards the rest of the device not for anything else.
bosch,bma255.yaml clearly says:
 mount-matrix:
    description: an optional 3x3 mounting rotation matrix.

*rotation*

> My intention is to flip the x values thus having a -1 in there.

And I do not have an idea how the chip can be turned in the device to
require that kind of matrix ... 180 degree turns need two flips ...

> What I do not understand is the logic of how you came to the conclusion
> of "cutting the chip into ultra thin slices, sorting them upside down and
> glueing". 
besides of this hypothetical operation.

> The matrix seems correct and works as intended as well.

So maybe the chip is weird and maybe that is the most practical way is
to correct that weidness with the matrix as well and throw away any
dogmatics. Checking..
 
Comparing with n900
Datasheets: I do not find a datasheet for the BMA254, but for some
similar chips:
https://www.bosch-sensortec.com/media/boschsensortec/downloads/datasheets/bst-bma253-ds000.pdf
https://www.geeetech.com/Documents/BST-BMA180-DS000.pdf

vs.

https://www.st.com/resource/en/datasheet/lis302dl.pdf

No flipping in the axis direction between the them. So either both
n900 and espresso would need single mirroring (=flip one axis) or none.

So if n900 matrix is correct, than you need another -1 in there to have
some 180 degree rotation.

Regards,
Andreas

