Return-Path: <linux-omap+bounces-2534-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8996D9B6E84
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 22:12:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3374B217AE
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 21:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BBD121744F;
	Wed, 30 Oct 2024 21:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYSD0Eh1"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168A0215026;
	Wed, 30 Oct 2024 21:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730322753; cv=none; b=QhTy8FoVgblFnJaXAFs2hX/ATAUlJQaGQcdEtNuaFvKyw6aKOQaldZCguJFAs3Mdg6Hd+EyQCZ3quRs8QH251M/oi2Qpia/hzuqw95b24diw+HJ/jye62d74xYLzVRSoonjc3Nfi1wVhpWu42OaFQzLYbhGdWu9nQ3B4Ar03Dsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730322753; c=relaxed/simple;
	bh=FQduf5cwXIgUyz/63A/Nc2IGXdKSOXKo45SIt/5WtS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GzRTKHW9WtHcqP9z7JhbnxGg5on9Pmeg3WhvcioFfi9io7CgV/mtc2UavFcra3AdbsbYfqdqm64iGvKBgPvjoi1yxN848pXxd8n2G80z9edkFrcK3H+FMMvwM0We/9ukL5+dDgcctvAFVAR8CkIr2pYhQbqNLFz9Y1d2XwZuumk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYSD0Eh1; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e56df894d4so198606a91.3;
        Wed, 30 Oct 2024 14:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730322750; x=1730927550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oe5hHL8GbBpLCsAL+CtzpElKiB4JLj+qmFfxgJqIhIc=;
        b=gYSD0Eh1NxND6gi072fh0JEqXbjtXvQqZZXAJrcFxe9k1X+qZLoOd4YAedwV7hcIer
         GygCm4qobvQ4gcpRl7bhbb9AQgfV3f+DMpzTctE9Q8f1k+ew6+cZR7ZzLcotmP2CrFaI
         wpyi/43azrN+fwNeXBu2VUnoCK2Tc3OqWeVvSZoUd+YVbZM1BtHdtPyU1Z6U7H6QSv81
         emjLUknRE3RjOI6c/gKMuacLx1PHsIQzaDezU4BnduqGqN0nAxxerhz89K4OUVGVIx31
         w0mznGj29O86K8qDSiFPVBvkTIpUTraUrZ/D1nuZjKnsmmoUXUb+dAtgb/tOcJ8QQpGg
         1yFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730322750; x=1730927550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oe5hHL8GbBpLCsAL+CtzpElKiB4JLj+qmFfxgJqIhIc=;
        b=FvjIf6QIQLyV0X9JNib+Nw6NZRUfTIHsJ9aqo3uyLcqLEA47JYofyqo91XjfSZp/sD
         Q2wbXW+YotQIURaz42jId0HgJVPp+GBoWAbthvoCOz7qxT/Zft3mjDSDM1EVjwySIcjC
         2+c4P9qEfaHbclgPkOM7cmO9wo/gBo9qjhF6HXZFdw3tnFnvLHBM9EiWqJudKACCK/0s
         VW7mZOpDLKxTrYuBBDfmtpULA9YvYA9bcharFi/HDSWdwiznhZPDCCyc0RzdvpXCPd1c
         ADf52UhhtZJz57DM44hd1Ztb5toW41uYMefS8W9pGLW6P7y37Wpf7tZ0kMsVq1eGnDYq
         oD4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVcbcO4Kir84ZU+Au8J2NY0BCn7YfLaY9+jj7fZAJbzVvIOvcpkqusvtXfFph1y2FBPBnyV6Rc9A+oxPYCSlEtI@vger.kernel.org, AJvYcCWt2eIk+nlqVV4yGqobMoGNkqkvgbBeOfKhiCcGeOmOGr0HpIFYjBR1wjMYGegKLXFotzvXrxr3sU66JRPF@vger.kernel.org, AJvYcCXOtrTX2ty+xWB7iEjqz4xf7sPFXx5ASMD9tvQSSG3oWT7QK1bUNcWr73rUv+Pt45gvTqZwEz6ejO4t@vger.kernel.org
X-Gm-Message-State: AOJu0YykxXRaYx4N1H3sn8K602xuEgjGT/NxVub2UpJZXl/U0jajwcQI
	1va79g194GccAswRjrfsf484rflJTfymSliSsj0JedNFo3btTWT5CoO0V4t8qDc=
X-Google-Smtp-Source: AGHT+IHJLuVQMqgVFpdKwBvPrnyY2bgMg18Z5qZlDnVxg2ixq1YP432b3XFZAeeGW+9FSIrCgQuGUA==
X-Received: by 2002:a17:90b:38cf:b0:2e2:ffb0:89f6 with SMTP id 98e67ed59e1d1-2e93c14fd1emr1031795a91.15.1730322750364;
        Wed, 30 Oct 2024 14:12:30 -0700 (PDT)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.142])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa0ed5esm2406800a91.2.2024.10.30.14.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 14:12:29 -0700 (PDT)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 1/6] ARM: dts: twl6032: Add DTS file for TWL6032 PMIC
Date: Wed, 30 Oct 2024 21:12:10 +0000
Message-ID: <20241030211215.347710-2-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241030211215.347710-1-bavishimithil@gmail.com>
References: <20241030211215.347710-1-bavishimithil@gmail.com>
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

Regulator values are found from downstream kernel for espresso.

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 arch/arm/boot/dts/ti/omap/twl6032.dtsi | 81 ++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/twl6032.dtsi

diff --git a/arch/arm/boot/dts/ti/omap/twl6032.dtsi b/arch/arm/boot/dts/ti/omap/twl6032.dtsi
new file mode 100644
index 000000000..1518a2c5a
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


