Return-Path: <linux-omap+bounces-2525-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 268539B6CF9
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 20:42:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB321282957
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 19:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42E231D0F66;
	Wed, 30 Oct 2024 19:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zjw8xIQG"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060671D0DE6;
	Wed, 30 Oct 2024 19:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730317313; cv=none; b=FGIgbYEHnLS7CkbFNvMDQK4j3yC6GsKy671GP+KSJk8cisuDxqnhI7wCEnpv73q9MsPxLyNVh+RcMCI+JU7zf2AyNYbAuuQPbvP6eXCdH1/iYJFalbBYHf99NRPR3IY13TK8HEMTPoI0HsQBEBIBuavVZ/fDLiyyUYZ5yzoc6c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730317313; c=relaxed/simple;
	bh=s5cIQzgDOH+wwruXJIeyOj/xnoks/Mm7itSuYt6Ton4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nm2a3eekMvyTjkLOsNr0QNKnMMqGRM4t42/rcaUIPOJV3g4Es1rIm8i+PkGKJWH6yWaAIf+7sObwC8KdZV8pvxlotmXOvjMQS1d4jCEY17tWDxCxr8NYJCp/wL8kERgODji9OfiD+z0tQyUNiLSn79OJEF7yqPtC80Nmp5DncQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zjw8xIQG; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71ec997ad06so135741b3a.3;
        Wed, 30 Oct 2024 12:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730317311; x=1730922111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VtZE+LZWoBOHnrtaHcIAAMsUNyUFojKb/CVa2OBDcMc=;
        b=Zjw8xIQGsI5+buaMTRjaE6m/lj4fHaimr0NwzICbVuzso9a6M2lH3qIyPEjQcWvz2g
         FOVZ5PfLntXAGYIDULgJ5FriEJxpWVcljhaZ+lSp7+dG7XDq+MSZacg8UIuCXp53KKKy
         9DtDwmlN++lEkJ7cV9OYmxR1IXLNrMPtADC6WHrPQ89V6PMgLsCpX0nXUW4ARYj7N+jD
         PcYXrFpvHHAj3+bWTM5lxU1a0zODN6zaSzhBTKio2iTx8Is3wPN84H+OKUwc0WqV40oc
         IOV8SNbsMhVQMhWzWPJsN/wyosZvfqmczmK/xif1RRuD3gTPEX9ihCjXPHrIhWZ8aMzh
         ZmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730317311; x=1730922111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VtZE+LZWoBOHnrtaHcIAAMsUNyUFojKb/CVa2OBDcMc=;
        b=GmyQCfWKs++t8Eoc2zQgQGRDUF6oN73BwOzU1CPoBzbpYHNk3bAvlt31dO4bYpEsvK
         JJFr+yk99VxKB4bDXiaRD2PCIiztbh0MzP0i28XFGe2JQKJvKmSKBMvgwCmGeuUip7N4
         uO8+FPxyCiVZAPgvBz0sd+cfWfyvyzUUUZJ4Ga16keq7G4DlDxIIEcSINlP6RNMFpBVd
         BxbmovF0HBw7tBdoRq3MaUt3mSj8rBIIxgAbpfinGxculs6BcVCKBOfVMewyj71lAI2S
         Fh3DZnKK6kzvcJU6HY8SvXe3DO9aCs7DNHKXo4ADvqOsT/3YZko7VsO4W0cYXfDpPA9t
         YCUg==
X-Forwarded-Encrypted: i=1; AJvYcCVRX7OjMjhm6RtS4Gz629t0omr43vWrZtKoMpz2+ajBqxDa6BSJdu0ojinzojGnLmioUPBNm/pcTgsG@vger.kernel.org, AJvYcCXERXlnFnFRfXr/PtczIft5H+uCmGV9c1Y3kDE7fsuPzMV77bjQheS6g9d1602UW4mQqa9Ce6Ok6K2GOvZD@vger.kernel.org, AJvYcCXVMzFqLQ8v2p7/rJvDlIwppP7jArewENXkatW0aRULM54EPxoauH8OnMUV1dm7pi+AmKTedKOsrtoF6iU9bSKe@vger.kernel.org
X-Gm-Message-State: AOJu0YyZI/fgYxHt7WZYi8iis7p+M+oyAXXppzhV7syaZzCUnP3ncEqt
	IoGqn+Yhmm/UkuzTmaj/E/oWvz9wF0EvOgjP5uEsnCcJuZmREX7S
X-Google-Smtp-Source: AGHT+IEsDiLdmUiYZwxFZUqxWPTuqbuPxSQOCMEJTcI4DQbUODK+iFB2dTQEHoCG3Vy312JYEHJ9bA==
X-Received: by 2002:a05:6a21:920b:b0:1cf:573a:bb58 with SMTP id adf61e73a8af0-1d9eee1e178mr5682354637.40.1730317311259;
        Wed, 30 Oct 2024 12:41:51 -0700 (PDT)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.142])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8495cabsm9661839a12.0.2024.10.30.12.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 12:41:50 -0700 (PDT)
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
Subject: [PATCH v1 1/6] ARM: dts: twl6032: Add DTS file for TWL6032 PMIC
Date: Wed, 30 Oct 2024 19:41:31 +0000
Message-ID: <20241030194136.297648-2-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241030194136.297648-1-bavishimithil@gmail.com>
References: <20241030194136.297648-1-bavishimithil@gmail.com>
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
index 000000000..52c318510
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
2.43.0


