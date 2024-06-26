Return-Path: <linux-omap+bounces-1590-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04927917CF3
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 11:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 828231F20D38
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 09:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B25D16E867;
	Wed, 26 Jun 2024 09:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnHD4hz8"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD60416D331;
	Wed, 26 Jun 2024 09:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719395494; cv=none; b=WsICKcIa/LM4giShquYhvGA/zRdcmQ7910B5Hd0GxXagd2JteZgQgZfYZTzkgwF1Oe8T04RncwK7LYPWwiE0DNdbM0sm+K1rXY/fkP5UqtXrUxQdvEcQazvienlOktNLf0VlWnl9EtFVGh1G5exlTG/j1EMWhBKQa+bpFVEyog4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719395494; c=relaxed/simple;
	bh=sLfkjHrtGFtoucHVyBSUq7l/6Nf9cNU5KnkzOcXtG7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BRT5RFZlQfQyztsk8RmAZmOUxC5uvME37I3tudjLijIpL1WTxnprkifNr8E65C+R2DdWLyxK6715qNnBLgx+C8yVC5S/VhRg3i1uTyVBML4kjs/wVP8a5rcAggGfv/i8n3NkHFSRqux9jebyT3+vLCfH8Z10kZkmC1rWbzZY73I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnHD4hz8; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-718354c17e4so3182286a12.1;
        Wed, 26 Jun 2024 02:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719395491; x=1720000291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8wu+Xk/FN21EiQi/+h2cL2uKesNUdvCxWZb1Bq8XqUY=;
        b=cnHD4hz8gP7wnprAFQ4YiVx3iHf8ofUmifhtYUyEZIVFzEmPu9Xf6eBki3BSZ8qeVm
         3N7PF/aVUztlqSX/4D3cOCmnVFU1csxSweBrZbkFprF31koxf4UUUp0SoSk1YYYYL1hX
         Ii7oNFyUZFPuySb0J3+Mjri9ng0ldiD90n5tiLQv/+Md9Vwg4cilwTvAjvLChFYP1lB0
         BJ/19BGaE9TOkvOZB2eSiZFD2kOP7qXUY570lBDoUV3N8WsTUZP6VptJ13ZsEMHeKwk7
         VYz3KUVHySC9ROx1nEmDZ6YSc/1WeVL4Zj2NgU5TYJbOSa4DCNnaCYCc1/E5jpAr87AX
         4ZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719395491; x=1720000291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8wu+Xk/FN21EiQi/+h2cL2uKesNUdvCxWZb1Bq8XqUY=;
        b=V1sML23/kfpzvbtD0SyZl4/wkopyMqpxtdMAHsLcxhYxyH5CW12ZyJQw/jpbO9PhJx
         GBGTF7L8B07bk0qZRC4Y2mY3Qtam95yJx7CBxBl5A0aGkPcPemgDcvDkQXdsSHRYTWRv
         E38DNC0N6jcpcodnqaJnAcPo+D70Aue5InzjWy43d0TyeaXsMNyVLoK/0SnjmMdi43aO
         KzzjzGNP2BP665k2AuJCxhLYOlW8afeKOj9Ly2f0zmR3ap3eovFmP6dGRoRobr7QsdI6
         1MBz0kkvIGwFMQodlFg4CxnEfiPcZcL/ZIUWqRcmte3aPHZhhI9tiWFOTKUlOoIZE+1r
         WZ4A==
X-Forwarded-Encrypted: i=1; AJvYcCUUD3kRK9IzqPnW0nr3NVBkhHSwGPhOnTS1dPfCbvqPCAcT51wsOFRqtUTaT+x8K8BC6o20EvvfneX/HLfMIuHa4n5D3FZ0IC1+SAT9UBUR9J8si5gwXbMX4Yzxc2M5tbkzllFWH24pSzLftAn1RFpaqlDOI1Jaj/EhyETX0YRkMnYij+Y=
X-Gm-Message-State: AOJu0YwhnXSwB9HPo/xYQIpxNeGc6wfBd0pGiTOKq7fJp6OSk2ayOtOq
	mm70D2yGyBuBnSft1niKYyzob2d0zLqVbrdOZ/Qwww6oA0UKhKGs
X-Google-Smtp-Source: AGHT+IGNT7zcMe0P1L8BDEagjyPPhYBdROCZ1QvU050JL4ztaAgxdPI/Sq/Ln4DH0nd57UXO6geY5Q==
X-Received: by 2002:a05:6a20:bf28:b0:1bd:91b0:10a5 with SMTP id adf61e73a8af0-1bd91b0126cmr1259251637.47.1719395490834;
        Wed, 26 Jun 2024 02:51:30 -0700 (PDT)
Received: from localhost.localdomain ([150.107.164.233])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c8d7e58ff7sm1213112a91.8.2024.06.26.02.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 02:51:30 -0700 (PDT)
From: Mighty <bavishimithil@gmail.com>
To: 
Cc: andreas@kemnade.info,
	Mithil Bavishi <bavishimithil@gmail.com>,
	=?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: dts: twl6032: Add DTS file for TWL6032 PMIC
Date: Wed, 26 Jun 2024 15:20:56 +0530
Message-Id: <20240626095056.12607-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mithil Bavishi <bavishimithil@gmail.com>

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
Changelog v2:
- Added nodes for pwm, pwm-led
- Added nodes for regulators - ldoln and ldo2
- Renamed nodes to match compatible names
- Removed regulator properties and voltages, since we do not have a datasheet and relying on downstream values is not always correct, hence let the properties and min/max volatages be defined in the board device trees.

 arch/arm/boot/dts/ti/omap/twl6032.dtsi | 81 ++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/twl6032.dtsi

diff --git a/arch/arm/boot/dts/ti/omap/twl6032.dtsi b/arch/arm/boot/dts/ti/omap/twl6032.dtsi
new file mode 100644
index 000000000..4372ce466
--- /dev/null
+++ b/arch/arm/boot/dts/ti/omap/twl6032.dtsi
@@ -0,0 +1,81 @@
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
+	vana: regulator-vana {
+		compatible = "ti,twl6030-vana";
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
+		io-channel-cells = <1>;
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
2.34.1


