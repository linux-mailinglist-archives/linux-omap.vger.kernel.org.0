Return-Path: <linux-omap+bounces-5554-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB53FD39DCA
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 06:33:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79BA23008888
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 05:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A179275844;
	Mon, 19 Jan 2026 05:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fSW8pja4"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFCC13A3F7
	for <linux-omap@vger.kernel.org>; Mon, 19 Jan 2026 05:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768800832; cv=none; b=Wgjm428CVIxnX62VMdlkpcFZAF3hqH5Mam+1fpHYMPJcChMnSSo4wcyp+VR9yIYppcvDPNs1u1lI5g6QF7OcpobvkVD3p0RwJFkotadsww/3vssgthQZ0ZbR9zeAem9zJsZVW2927fBFOnn3pOjfS3wnTWfjDbKGql7nCJyN1pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768800832; c=relaxed/simple;
	bh=Cr5+IhCHxPHPW3626dojbnKDaxlXfjju7kU8t6CdTJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gPDTL8epcn+/GrVLV+TATuJZgn71/IruDyeKIUhrXjIsCj4kXVgD9wBhj/TR09VX9ZzgDh2qs371YUcFMyCU3YZsvCIpETZDt+c3H9J9ZUQ5+cqYHbKQTdFpfn65qzSjXeb6+xnKQDB6jJLGubELR+TfGzibGNhgXyvw3tpVFh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fSW8pja4; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-29f2676bb21so39631615ad.0
        for <linux-omap@vger.kernel.org>; Sun, 18 Jan 2026 21:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768800831; x=1769405631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nclpl2L8R9cKrulz3mBbfGGvQIswT/qMcBsWKZFoMYo=;
        b=fSW8pja4vc3ASN2l/vP3VgEfAXHws/NizLOtGyVrvkD+m5p5kI7xwA1pkAI9JGHG9M
         2Vc3dWiYQ2qGuREI/fVsHJOOGV3V16qL/BiusOerQIiQAiXSW6UbGUQ+ZVitzXCFr659
         a2GH0HaqnGe5zNxKGiz+fIIdYX2Ag8UQvXVYuTFYVKZzE5FMW5XTzr83Kc1Ww5WlJTww
         meCstEstFBCuCMYP2Ov/vABhkU82bORVNoEduu98DT3uPso60ClMhx6Y9P0jzIQwDPL/
         swHECmGcxEXbcRVJwrQnpq6ywDCUUXiIB6rTy9SZcKT2AM35nfbqxrbGzvyAiAQDBnVa
         fOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768800831; x=1769405631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nclpl2L8R9cKrulz3mBbfGGvQIswT/qMcBsWKZFoMYo=;
        b=UN2+LdQ3TzujAgi/hbvSJd22LNavw8w+VhOrfEwLngA9O1wSX6ZdQ2lVSYSIhSVFaJ
         mfwttBkcITqQqs1pQzAG4MU5heEgDApIs53TnbcBoJYZJsa2mCYkOFFpdi8UAfJFWVwX
         WTaJaRIgJyCwRDNg3dsxJRLBSyzyveBWErJNcYMJtXiu+iRZ7f3+B3ZLdzR7He2X+JD5
         qcIlm2aLqULEmnxMsyu1GDYIvdML4zmw9r01D6OmDhauUZKhNXyrpCfsLQgyLMnJM0BA
         IlroQKfrrIVmKd6Zd4iP1oU8wyqKwlqJxVWxx0UKnDfREDWd8tRDh+yTKuMKABepS3OV
         yt+Q==
X-Gm-Message-State: AOJu0Yx2jPWw8Ok9VF0ncd391wRVu634IrH0Rm+gJ4LbiFJrsCCh9+qO
	uUZlHT1ZsM2v12o62OBkTSnVPmC8RdPh8TbcTNC8pGF96XgjU2VYduf/cKF0Kw==
X-Gm-Gg: AZuq6aJAmOa90+RFwYzgeDh4PHdL71q/kBGVwnUEmPGW9X1dIPTj64bQUtuQSyzHsry
	MopgD30W8FxkvVSxZp93VNxBh/gDBO9vRvadekWty9/OzYhOcs6WIHXksztBtc84S4MKc/K8Csu
	+RcXfLMhIcnoZy6B13XEOklgzR+crjVmv2fOiO/z+lMk60E3hMkaAe3Sup0CJobJna0E3wTyVax
	AwyiVBGu1Y/cJbIch3GeFSy/QtvjAfB+bB8jmLjQ3BGQLsxsCMhFsSt+79QITYLEi+r1R8zjisa
	bHMI4q6Ml5zSZIlhFgVxxnF0ZoJRBSc+vFjxQs8Rj7hHEXSmkpyhPXiY3tD98oVH28gjxSndLZR
	CP52NX1lZ3xsfZ3i54wN9AqxG+v2Tg/5pbrpIcnqvNHyUf7VLxafCaTABXcx6ahkP6NRgbc0x7w
	ioJADQuPFaBTKwMDd7by3xWFEeCvWshtVS6MFAGKKL9RmlxH7zR+q4PaAf5uepe7KSRJGLnRAKE
	iQINA==
X-Received: by 2002:a05:622a:15c6:b0:4ff:c63c:525b with SMTP id d75a77b69052e-502a1e5d13cmr132927051cf.26.1768794044833;
        Sun, 18 Jan 2026 19:40:44 -0800 (PST)
Received: from mighty.localdomain (nat-130-245-192-1.resnet.stonybrook.edu. [130.245.192.1])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1f1b872sm64030801cf.31.2026.01.18.19.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 19:40:44 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	quic_jesszhan@quicinc.com,
	bavishimithil@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	thierry.reding@gmail.com
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v4 01/10] ARM: dts: twl6032: Add DTS file for TWL6032 PMIC
Date: Sun, 18 Jan 2026 22:40:25 -0500
Message-ID: <20260119034025.58091-2-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119034025.58091-1-bavishimithil@gmail.com>
References: <20260119034025.58091-1-bavishimithil@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a dedicated DTS file for the TWL6032 PMIC (Phoenix Lite). Already
has driver support with TWL6030 (Phoenix) since both of them are so
similar, some nodes can be reused from TWL6030 as well.

This can be included in the board files like twl6030.
Example:
...
&i2c1 {
    twl: twl@48 {
        reg = <0x48>;
        interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
        interrupt-controller;
        interrupt-parent = <&gic>;
    };
};

/include/ "twl6032.dtsi"
...

Used in devices like samsung-espresso, amazon-jem, epson-embt2ws etc.

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 arch/arm/boot/dts/ti/omap/twl6032.dtsi | 77 ++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/twl6032.dtsi

diff --git a/arch/arm/boot/dts/ti/omap/twl6032.dtsi b/arch/arm/boot/dts/ti/omap/twl6032.dtsi
new file mode 100644
index 000000000..d599a2ca6
--- /dev/null
+++ b/arch/arm/boot/dts/ti/omap/twl6032.dtsi
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Integrated Power Management Chip
+ * https://www.ti.com/lit/ds/symlink/twl6032.pdf
+ */
+
+&twl {
+	compatible = "ti,twl6032";
+	interrupt-controller;
+	#interrupt-cells = <1>;
+
+	rtc {
+		compatible = "ti,twl4030-rtc";
+		interrupts = <11>;
+	};
+
+	vio: regulator-vio {
+		compatible = "ti,twl6032-vio";
+	};
+
+	ldo1: regulator-ldo1 {
+		compatible = "ti,twl6032-ldo1";
+	};
+
+	ldo2: regulator-ldo2 {
+		compatible = "ti,twl6032-ldo2";
+	};
+
+	ldo3: regulator-ldo3 {
+		compatible = "ti,twl6032-ldo3";
+	};
+
+	ldo4: regulator-ldo4 {
+		compatible = "ti,twl6032-ldo4";
+	};
+
+	ldo5: regulator-ldo5 {
+		compatible = "ti,twl6032-ldo5";
+	};
+
+	ldo6: regulator-ldo6 {
+		compatible = "ti,twl6032-ldo6";
+	};
+
+	ldoln: regulator-ldoln {
+		compatible = "ti,twl6032-ldoln";
+	};
+
+	ldousb: regulator-ldousb {
+		compatible = "ti,twl6032-ldousb";
+	};
+
+	smps4: regulator-smps4 {
+		compatible = "ti,twl6032-smps4";
+	};
+
+	gpadc: gpadc {
+		compatible = "ti,twl6032-gpadc";
+		interrupts = <3>;
+		#io-channel-cells = <1>;
+	};
+
+	twl_usb_comparator: usb-comparator {
+		compatible = "ti,twl6030-usb";
+		interrupts = <4>, <10>;
+	};
+
+	twl_pwm: pwm {
+		compatible = "ti,twl6030-pwm";
+		#pwm-cells = <2>;
+	};
+
+	twl_pwmled: pwmled {
+		compatible = "ti,twl6030-pwmled";
+		#pwm-cells = <2>;
+	};
+};
-- 
2.43.0


