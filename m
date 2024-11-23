Return-Path: <linux-omap+bounces-2721-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7269D6ABD
	for <lists+linux-omap@lfdr.de>; Sat, 23 Nov 2024 19:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19A7D281BFD
	for <lists+linux-omap@lfdr.de>; Sat, 23 Nov 2024 18:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60CF614AD20;
	Sat, 23 Nov 2024 18:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="it08jqKu"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859942AE90;
	Sat, 23 Nov 2024 18:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732385659; cv=none; b=ccimKqpY+dBCO8F1lw51gtyMPIIyczR9QfOEfQc45SVj3e1d8QZ5SxkQYTz3Ytn2XjThpFC6MrIl1suLRimv7Krvcnl0tPs28E2opGoeHLitriQ8FTEltPp/Fad+q/4Qg5yhF/fkJ/9Om+3QzeZPeMrvoha0txn73JiaPysA/zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732385659; c=relaxed/simple;
	bh=q3l3UKad7opyXXPdHOM1LjrPgSEK7gk/MtSZ796FJPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iw7mfWIGo2mnidVdpo1VkAqzlHE+J4gomGSMH0y95K47nIj0DjaN0O+WRFwE7DldW+/+PO+oUoZUTttIGlIMN6jHLDhe1dQ4Zr29v8J8ezs+bXazS3YaKcMlFZ5797JQsB+P+Jc20tjTvHQG453+6odeMW501RZHjsb0dE7P6G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=it08jqKu; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-724f41d550cso334587b3a.2;
        Sat, 23 Nov 2024 10:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732385657; x=1732990457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3E9EubzZ/N5kAx7E2kPinqB77UmgRMRhN52ylzWmfUE=;
        b=it08jqKuAWisngDm9IdP0umMSGZD+b4aoZ15D3z7PNijWS5zkYAeCLjrVscqNYTwvb
         rG3x0aoPRdeIKVnIDoNEOAQSOKYu3oEgSBn4NcTzTOa4FIw2iTE4hmgFzMt3G7t0ILKy
         d6jZDfoprsPgsa58yUR+AIfDTaQH8XtZzE0GRKHCzVCaUmf8YsBFFqxHdOvGuI+UgWOA
         /EMzZ2QVY7Jm4k5Cug/6AcEEGOBVKtGxOK3Ex2H6K6IXFjhO4NLBR/Q5j/DK8cC8D92z
         J+RKVw5sZgANTRQI/O4w+tR7khca6ucdo667z5PieEh4qRSolIqRHxQDD6D55kb0M2lh
         PTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732385657; x=1732990457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3E9EubzZ/N5kAx7E2kPinqB77UmgRMRhN52ylzWmfUE=;
        b=s45fOJuSd/t9MyANNsO41GGXtmqTcXQYYmAk4NnZLsv/5KaVMRMZTqA4dRuEBuNPIl
         HJ/cnI3OBLJWpVxH+uTn1E89dlXZalOkRJKk6WNtHOI3MyFSC1NkwGubkh07xlp9ctkV
         KlyO93fGM8ZrpLPW9o67PujQmIkgYOub9438zD2IEtsgcOFvsqUz9M961hAZGjmdk3I5
         ar4nD0OsWG92+ndMiZOq776sFi+jm2+wjkCZSjPja51hhpSudGaaA5tAkIkyZzfhwoo9
         BHSUa2t3Cv+206bYvhSKO5FWQ2LFLL5WnjFHxeeG1/c5tOJCGXejCeYZgoaf/lgimP8e
         uVtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ94P7yYRx8lRk9YhrNnli8+mENNopBI//2fqGXYaFmuRljIl6mnOzGuSgBOE0HVPTh7alSihUDjrrh3HHPqye@vger.kernel.org, AJvYcCVefyO83qHKkwFyRR/x5zNOKVSNPBKVm5252D0QYtwOKb1IJDuP2hR8wRHQ9kA8LNoen9QVdWa+VlOgAST1@vger.kernel.org, AJvYcCXgbJXyzSb/fbe51glgWOhxcGGc3MwC9sZajqnOIZppMnbVvbtMbDFKQkaGjh8S3HY+lojWaBelma9J@vger.kernel.org, AJvYcCXph4k5qASfC7V6DSm/k94hvnYQMi3smEaB/uIXUov1NN8ZyZnY/zOCZidMnzu6/fCRm67ioFpgI0QtQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2A1dWzI4PrC6WWiYL2iYuEtu9Um2slqer7Y+0bFAP9qAbCxOT
	RQO7kTE4mE3ApTLMCLcBYW20uHzHNjZvalxq/oRaw+GdVXoRFJus
X-Gm-Gg: ASbGnctpY2wTYprpD2gn0uDEG6rLwpIESNjpMpV8OK+xTbOuIN95Z9BithEf2tVI0D2
	C52zwSUU+9tDpwsfJHEVEk3dUthkAr/t9zQ3aZAPiv5GaDcEViGjjSsokYS3vRbrGCR3td3L0rP
	BMH34nQR1RTNq40sRf5594mva+PFG2w77CKWIMyr0KD8duBqnuUebfiVmx8FG0MAhbwRToYbOBU
	1sBjQfLAdyLnF0ukwMJp53kmoMhUobJDjuYd2ImT8OP1LSOK78dS04J3iznWkK+LE9UwPU69cU=
X-Google-Smtp-Source: AGHT+IGJd5RjyH7yJ8NKMq5Zjdws3I52oMZR0Kvpby6Mp6JsafPgQckawu7CJQVnxW27Q4YT3G5/uw==
X-Received: by 2002:a17:903:234b:b0:212:5ee0:1249 with SMTP id d9443c01a7336-2129f28a2a0mr114356735ad.40.1732385656738;
        Sat, 23 Nov 2024 10:14:16 -0800 (PST)
Received: from mighty.kangaroo-insen.ts.net ([45.64.12.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc2c5fcsm34538135ad.280.2024.11.23.10.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 10:14:16 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: andreas@kemnade.info
Cc: Laurent.pinchart@ideasonboard.com,
	aaro.koskinen@iki.fi,
	airlied@gmail.com,
	bavishimithil@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	khilman@baylibre.com,
	krzk+dt@kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	quic_jesszhan@quicinc.com,
	rfoss@kernel.org,
	robh@kernel.org,
	rogerq@kernel.org,
	simona@ffwll.ch,
	thierry.reding@gmail.com,
	tony@atomide.com,
	tzimmermann@suse.de
Subject: Re: [PATCH v3 06/10] ARM: dts: ti: omap: espresso-common: Add common device tree for Samsung Galaxy Tab 2 series
Date: Sat, 23 Nov 2024 18:14:05 +0000
Message-ID: <20241123181405.861-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241112100616.5349ad37@akair>
References: <20241112100616.5349ad37@akair>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > +			no-map;
> > +			reg = <0xA0000000 0x200000>;
>
> If used for ramoops, then there should be a compatible = "ramoops"
> see Documentation/devicetree/bindings/reserved-memory/ramoops.yaml
> > +		};
> > +
> > +		continuous_splash: framebuffer@bef00000{
> > +			reg = <0xbef00000 (1024 * 600 * 4)>;
> > +			no-map;
> > +		};
> > +	};
> > +
> > +	chosen { 
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		ranges;
> 
> hmm, no bus here, so no need for address/size-cells, rather specify
> stdout-path, etc.

Will be dropping rampoops_region, and chosen nodes. They were used
initially for debugging, since we now have drm for display and other
means to get logs, these are not required.

> > +	i2c-gpio-5 {
> > +		compatible = "i2c-gpio";
> > +		sda-gpios = <&gpio4 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +		scl-gpios = <&gpio4 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +		i2c-gpio,delay-us = <10>;
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> hmm, no pinmux here? 

Cannot seem to find it in the muxset given in vendor kernel.
These are placeholders for now and hold other devices like smb136 charger,
stmpe811 adc etc. Drivers for which I need to upstream first.

https://github.com/MightyM17/linux_pvr/blob/testing/arch/arm/boot/dts/omap4-samsung-espresso7.dts#L10-L24

So for now is it better to drop them?

> > +	reg_espresso_external: regulator-espresso-external {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "vmmc1";
> > +		regulator-max-microvolt = <2800000>;
> > +		regulator-min-microvolt = <2800000>;
> > +		gpios = <&gpio2 2 GPIO_ACTIVE_HIGH>; /* GPIO_34 */
> > +		regulator-always-on;
>
> hmm, we cannot turn sd card power off?

A mistake by me, had kept it always on to ensure it works in testing.
Fixed the error in next revision.

> > +		power {
>
> button or key-power

Fixed.

> > +	led-ir {
> > +		compatible = "gpio-ir-tx";
> > +		gpios = <&gpio2 27 GPIO_ACTIVE_HIGH>; /* GPIO_59 */
> pinmux?

Added one according to -
https://github.com/Unlegacy-Android/android_kernel_ti_omap4/blob/3.4/common/arch/arm/mach-omap2/board-espresso-irled.c#L303-L305

> > +&omap4_pmx_wkup {
>
> order node names alphabetically

Fixed.

> > +	twl6030_wkup_pins: pinmux-twl6030-wkup-pins {
> > +		pinctrl-single,pins = <
> > +			OMAP4_IOPAD(0x54, PIN_OUTPUT | MUX_MODE3)
> > +			/* fref_clk0_out.sys_drm_msecure */
> > +		>;
> > +	};
> > +
> This can come from twl6030_omap4.dtsi

Correct, included twl6030_omap4.dtsi and removed this.

> > +&omap4_pmx_core {
>
> order node names alphabetically

Fixed.

> you can simply include twl6030_omap4.dtsi describing recommended
> connection between omap4 SoCs and twl603X pmics.

Fixed.

> It might be an idea to use a dedicated wakeup irq instead of
> explicitely specifying WAKEUP_EN like you did for the uart.
> That counts for other occurances of WAKEUP_EN as well.

Could you point out to some examples having this change?
I have just followed how muxset mentioned it. I assume this can be
worked on later as well.

> generic node names:
> pmic@48

Changed.

> > +	accelerometer@18 {
> > +		compatible = "bosch,bma254";
> > +		reg = <0x18>;
> > +		vdd-supply = <&ldo4>;
> > +		vddio-supply = <&ldo5>;
> > +		interrupt-parent = <&gpio4>;
> > +		interrupts = <25 (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_EDGE_RISING)>,
> > +			<26 (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_EDGE_RISING)>;
> 
> this looks odd, binding says IRQ_TYPE_EDGE_RISING. Why do you think you
> need both? After something is rising, it is high, so both seem not to
> make sense.

https://github.com/torvalds/linux/commit/5640fed3035e88c3ce1361e6fc93f4e72468f307
This was worked on before the above mentioned change, hence the confusion.
bma180 schema wants both the interrupts, I do not know why, but now it has
moved to the bma255 schema which makes more sense.
Fixed it according to new schema.

> +		mount-matrix =  "-1",  "0",  "0",
> +				"0",  "1",  "0",
> +				"0",  "0", "1";

> hmm, checking twice, since I mixed up something earlier. This just
> inverts x values, so we are mirroring across y-z plane, that does not
> look like a rotation matrix, so it does not describe how it is mounted.
> Eg. the n900 has two -1 in there, that is a turn by 180 degree.
> 
> Your mount-matrix would be achieved, by cutting the chip into ultra
> thin slices, sorting them upside down and glueing that together. I
> doubt somebody does that.

Went through the mount matrix docs multiple times. It seems fairly
straightforward for the accelerometer. being just a matrix that we can
multiply to get a desired result.
My intention is to flip the x values thus having a -1 in there.
What I do not understand is the logic of how you came to the conclusion
of "cutting the chip into ultra thin slices, sorting them upside down and
glueing". 
The matrix seems correct and works as intended as well.

Best Regards,
Mithil

