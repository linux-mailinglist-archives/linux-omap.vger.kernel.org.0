Return-Path: <linux-omap+bounces-5553-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D558D39DA3
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 06:12:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF50730145AC
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 05:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5D332F766;
	Mon, 19 Jan 2026 05:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OoXgOmrU"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B57032F759
	for <linux-omap@vger.kernel.org>; Mon, 19 Jan 2026 05:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768799515; cv=none; b=QJ6nBd9A6v5BJ8PkOGqMOJDO2tCrS1GxlSAfZ6/97ow6mKuFG4AviH/dmC9us/QL21LmMvPGCNxB4LTz9z2RBe+czq8XxanSvfCSv3DkU+61iPIa/U83AJkLrP7/40CqqKGfpaigkMuExfwRDfTlZml+CUV+peg4zcUgqY8GmcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768799515; c=relaxed/simple;
	bh=Cr5+IhCHxPHPW3626dojbnKDaxlXfjju7kU8t6CdTJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FOw9PkgV9Vn5L+dLdm7Iezce30N4PqbJ4EgUG/jSMAnGmIlZY+6nJ373lbeR3IDwMP8M3Y5aFlcl/M7nowqMBxGhOiWNkVOxiVPuwmIC1xR69A5VA9osnIQFy4+aqIBar2B5jQ4fUxEax63TxKcNRinNyO3iqt+3DDwdcQFFuhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OoXgOmrU; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-88a37cb5afdso69861946d6.0
        for <linux-omap@vger.kernel.org>; Sun, 18 Jan 2026 21:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768799511; x=1769404311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nclpl2L8R9cKrulz3mBbfGGvQIswT/qMcBsWKZFoMYo=;
        b=OoXgOmrUCarcunbpiHP1SvwJQ4w3zeOS80s8CyG02munZ1n7GJDLSwchXD/BRj8LHv
         JmGTCGepf3j2YiTTlddJ+qzcce5DarvfuQqFhJ/STDQGKKG9LyXGvnn3AhKQU/nF2F7H
         RsElrOizTlBl+JT5DYncoM7JM7omta+/n1GngNWuYCOz5+bq+M2R0TNOo1Uv623UrDNP
         RmiZs2eaQCejRtS5i5Y5YDKePjokK5TwT2ko646CS8mvbF4YwHwQ2ddSnGeJKJTRX2R4
         fGhU507FfcbedoRSIPzRPS25J3RG8fXat5T4KWO9yfKNG8W2EdVJjF0GI6+eMvJBdiL/
         9tNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768799511; x=1769404311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nclpl2L8R9cKrulz3mBbfGGvQIswT/qMcBsWKZFoMYo=;
        b=HVcf/bh5EEMdeyvuC+r/6sxj2zAYplBVJ475oBEsq1NwwJmdBr8HFnu1FWZUONwTS8
         tSr7RzihVrfOu/et/Al2qNLPoLH1I10jEHKje/llnDoQEaHrqghg1VrWW01UcI++6NjF
         TS+krfrWcBzy4kRePnZ6qjy/fzeAqumtiiyX3eindzNWUrHFV/z6WTvzezbsKBi9GpKH
         780tz0c67xIM7QQqyuvPY0Hb96mBWokBG4ZdT4cepES/nU3NyoEPqXJ7nXeWkOknKRee
         bmwwnY6zj0PEzZu7yK8SkkkkbsLOEumEpfTL6EkoWeFqjphM3UQus2dlL03iIKR07Q6z
         tKTg==
X-Gm-Message-State: AOJu0YxiXkW2LKpr0dgzeGnaggOoBErr5hrKGX+bekuAza17YSyxMHpP
	oGmpCZ/S0vykRzo/4nhrWoDuGl1cq2oagi3/Ful9xy8Al5gNa4kUW7U1XQOFqQ==
X-Gm-Gg: AY/fxX64223KRvbqHglK0qHK/vB3z4UIpc4AIzTf1S19UGJ+UtzgW/TF+wL/M2A7hB6
	VBK2lriaAZKlhs1HW323gGT4PcV+RkXv8WhNMtTDbNlwGkaqhpf/KbYLsT8ZcpNKCbE9kTmMv1i
	pacuLUiyJgUZGBU31sOFXt4tLuDWFDuq2XvYTrTmaAnppsbr8lhvMUkRexQoapfN0TnaYaThTK6
	UPGt7XXkRNL6u7mSw6qjaJ1MmkJG+RulOJkcJah0bElFm0ZbOhaQ8ngQYrfqvw5/ffqwTxNlW8U
	IxTOTiXdvyCv72ckBi/QtY01ko/ndTjF/4MaLpzJ2gwGa8Mbm+R2ONrgpSgVPwSSRH7PMUGCc3B
	6sQlWBxdwvFSJhm/hKsPxS7THdvAn3ymP+nLgk2M9nufBmGRw5aDN6c/xuLHzaPObr+rrL50yE1
	QMmcnys1f6PKEqWqEUdIB08isvAhwIfOVbWQeNHhqCuePDA03afXmzXMiqBJV+00OhI2Q0CWvhF
	namiA==
X-Received: by 2002:a05:620a:450b:b0:8c6:a587:377f with SMTP id af79cd13be357-8c6a58737e7mr1680298485a.36.1768793444229;
        Sun, 18 Jan 2026 19:30:44 -0800 (PST)
Received: from mighty.localdomain (nat-130-245-192-1.resnet.stonybrook.edu. [130.245.192.1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71ab20dsm724706885a.5.2026.01.18.19.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 19:30:43 -0800 (PST)
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
Date: Sun, 18 Jan 2026 22:30:26 -0500
Message-ID: <20260119033035.57538-3-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119033035.57538-1-bavishimithil@gmail.com>
References: <20260119033035.57538-1-bavishimithil@gmail.com>
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


