Return-Path: <linux-omap+bounces-2627-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B259C2617
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 21:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49E931F218E2
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 20:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B76471E22F3;
	Fri,  8 Nov 2024 20:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FG2WwoxS"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E503A1C1F0E;
	Fri,  8 Nov 2024 20:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731096303; cv=none; b=sHxQkMgJDQwiUk1oBeSjbgpfsUNYhfhCLgSF9MmV3GxAsblIynyqe8ZGmAHm3Rsqtx8m77cmLrlYBLefPzO1vaGGjspiZ9nOhJ3Hwe7yiO3tOyP44+94l3tKcHvtDD0HwZ2aIhZzO1hijH13d7orbTF3/+6jojVM4EglgGhjOEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731096303; c=relaxed/simple;
	bh=Cr5+IhCHxPHPW3626dojbnKDaxlXfjju7kU8t6CdTJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TC8ALXH5Flt1SAYlhtSRGKjEw+/kqZhYTklzmOdGfR/DYoDBzfHestiwQo9mvFFHJg51UfCVQvFneyaoOOXk04raklHNrvOpcvrkOTKvTTydESy7VL7sZ5NdmFmefqTUVGq3B2YZKjatSwDV6/jN1sKdf5FDnVrvMni63AU50cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FG2WwoxS; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71e52582cf8so2139451b3a.2;
        Fri, 08 Nov 2024 12:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731096301; x=1731701101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nclpl2L8R9cKrulz3mBbfGGvQIswT/qMcBsWKZFoMYo=;
        b=FG2WwoxSlKA5vDnktp39qW9EdtmhC/5ss25aCNlRwPa9EwJzAEvS21P6c4BZDsCkZI
         abSE7t8qfXdLKCSs29VBIXIj6llZWz1dY0Z/d6Ul6DQ7/VuTl1LSdcDVi/MMTlYaHyDL
         Px6Gka5hLZxrvXSZHTJjspMxg1KGKPm3jpVj6Ufs01CGZQ8XZtiEDEw9OCD0kp0OnDbj
         p8llSua0meqeDo3SvDKnw5sCU1ekWhs9f0Lu/IQuaNRncv4GYxnJT7btKsEskcfnZ9rU
         he0PfLBEXJRAlnTYaC4pHeaJPb/UgkZVjUkYne9WVK1DR3Fb6oEv/Bq1FLagKdYjHOu+
         CGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731096301; x=1731701101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nclpl2L8R9cKrulz3mBbfGGvQIswT/qMcBsWKZFoMYo=;
        b=awiIFyBIOuYNVjjC2XoLS8FhiAzjvnn85hwq15DROhKqo+G9e79wNYP3+0G06sC/yH
         6rUT+jg3VAtVAA4F/Fwnv+Ol0n48v9AAzX56BBzrAY2Yyo3/7E1G5Vl7la9wBkTWIC10
         a9WBuh2JaDA4Flq4iy9Y51g4Z8p5T7O/iKxKvxuLoSE1NL0vuckw36E4lT4soyM+rYIU
         0jKw15c1MnNQV68U0tPyi5tY3podNGKZXoTqmva+/TXVBCx/rVF06ahtpd98IZRBkZbK
         HKJkDXlHIcji3AHk+zhwUcwIL9/i1o3RM7bWBS8o0gX46zvAapiDYKJLiT0D/g0B6FjH
         hfTw==
X-Forwarded-Encrypted: i=1; AJvYcCUXkd/oEdTfZbMp64qvZY3kP/LiOq7abKjzDueBWtaCK1sMSmAuc8D3t/ij50TRj7g3H2PpPx+H6oRlY/T3@vger.kernel.org, AJvYcCW3CBIVP+7uquzHhpUK9+wzwWI7ksIXoorV05669K1O+itYyPZhKXPLDUqkpGI3vBQLydluBkczfJqY@vger.kernel.org, AJvYcCWSuH2Q828NJgVCx3gI4U/TU3FGfCHX10VXHg8HYHcy3MWnA/BHVqokK4Tl4Ltk9lRyQ44E4xhxTt/0Xos8A7j+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1Jb84P1r0w3VSJXweLSfdkJKTEYMTWxJ03HAZrgfioqinACh/
	i3BVb/3Jvh4UIVWLMXvXfEpwUQSqHhr/8VGhCtgGV8iAU25GcsqY
X-Google-Smtp-Source: AGHT+IGKkfE9EL1XG9TLXqRwviI1pwSILrbF7A+LIucI2Aznsbdg8kvZmaMir9TyW26Em6L1AGlazg==
X-Received: by 2002:a05:6a00:1150:b0:71e:cc7:c507 with SMTP id d2e1a72fcca58-7241338bda9mr5333661b3a.23.1731096300408;
        Fri, 08 Nov 2024 12:05:00 -0800 (PST)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a56a30sm4323418b3a.188.2024.11.08.12.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 12:04:59 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Mithil Bavishi <bavishimithil@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v3 01/10] ARM: dts: twl6032: Add DTS file for TWL6032 PMIC
Date: Fri,  8 Nov 2024 20:04:30 +0000
Message-ID: <20241108200440.7562-2-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241108200440.7562-1-bavishimithil@gmail.com>
References: <20241108200440.7562-1-bavishimithil@gmail.com>
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


