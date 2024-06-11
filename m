Return-Path: <linux-omap+bounces-1516-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A825903D0A
	for <lists+linux-omap@lfdr.de>; Tue, 11 Jun 2024 15:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EACCA2861C1
	for <lists+linux-omap@lfdr.de>; Tue, 11 Jun 2024 13:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611ED17D34F;
	Tue, 11 Jun 2024 13:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOeB5Mmt"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95DD17BB35;
	Tue, 11 Jun 2024 13:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718112114; cv=none; b=YK8xrpfIwW0FeFiCQ7HkCZJRn0Rqqbk/KcD1eBFtcS9NlSBz3adggVj85XRdFzdOxnx8U/x9i6Zh7XYiRABYVSB/01bqeD/34IuODpKBgt8NfJlfAYImj0ig4sdRHlPdmjohViGyxX8re2lPiU3WexND5kaYyLU4NQ4RJWdbm+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718112114; c=relaxed/simple;
	bh=lPPPhQNOTHe+MdJPKIaXmZK6muGPdkJfgwV7F4eRo50=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e9MI8GgvCh1NTH69Za1GzFhTr/48PKQTkQkN9shU9z15mtFqaGEbneuHdY+Ux/nAu0xB4z3RHDe9FTQFhYe/S2Etb6Gr/1Qcl550KWUyC/uKdGm1WYOYCqgWQQQRMSWMWo6VHwHKPOZK8HiTDqvRWElgRFZ5D0eF/Iq5RTpj7Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LOeB5Mmt; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f480624d10so49390105ad.1;
        Tue, 11 Jun 2024 06:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718112112; x=1718716912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E1Gm0VRJQ96IVvvubY5I30aDBQIE2W/tuhyQjRyhok8=;
        b=LOeB5MmtnPZL4GD723WB7Wvw3OnEGTioGsfNWEBqSMFJ4ps4+Kyf2Nh6dmLdjVAAiK
         h3txgGd4sxpcpGNVwjSSG4epBtQovW+TFCti/QbIp9Xp1uPGdFFwsdCS3UZjOUej/TWG
         B4Ik7hHtHXm8uniFdO8J1x2W98ytjU95rKVgrKsrbYkMJIKA/Vaxa4exJMwSg+WrscL7
         dI/qKyJjzKiJ4hYfYZ5NophJf7ml7UHIOKHfWXqpHkVA2oEdF/K6vcqrUVO+PMjwDMsu
         xyEk917rxf0+EpKLWsy2NZfWzbu+dl0mFTFzHFfS5y74NdAFgQL1V7CzlAWGzKtwtj6w
         kr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718112112; x=1718716912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E1Gm0VRJQ96IVvvubY5I30aDBQIE2W/tuhyQjRyhok8=;
        b=qjRwDz4mHeel5RZPqHRhPjOJTrTrPXeJqV+i1zbLhxSmyLBwAacL8mW7aoJZIjtrt0
         j6zYkySxSZdyd8gCRrFqI1lA2/65zvANVKZ3zyy0dlgqHKPS/G/v9RuCLXHyrqoYjZOe
         GD+Yb5UCRjgvJVBy5tJYh127ExXMnn0gtFYC5sBtOy1U65an9NBQ8aPzX5YFeUsAIye8
         BIwqeNTEsla3Su9qpZ3ogk9YluqUmdqhR8AWAKtJIYSVQteh2lpfVfvFJhWEt34XENcN
         vvBC4DhjFzJwnKjTkWgGkZuWswbBgli7f9eXEBbCd3HZtIT4tXecv3UysNSnubj+a9gU
         OVuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcRGkAb6JMFhDIgQhNRUBNpYTxF+eB1xTSJQ8GUz1wYh7rBjWHSyl10W+UHdGN7YypK5isj1GdoId2xwgOs4VrymEmU3Wn3GooWJ9Btul43v+1+CuimRxGNYCCWoVgsNky4bvVZGfl8/BCB05LFZAnLYV3gI7SWtcSFgc5seI55UoibWI=
X-Gm-Message-State: AOJu0Yw1u1h5JVraS85uLH4Okt+BpNZswy2KDBsjosChdQR0csIahwIf
	BAshhSWn6/Xt3UNPzUeJKVCfGptr5L/UXXEbNNt01j/z7fvTyJLu
X-Google-Smtp-Source: AGHT+IGYnseK3m4sL5xhcLg4FZ+KaLEccEmH9YDJalsGIsk52tQZL7HG1vYD8weeVyCIoLFqCHNNfQ==
X-Received: by 2002:a17:902:7207:b0:1f4:a392:ac5b with SMTP id d9443c01a7336-1f6d03bc485mr117646565ad.57.1718112111896;
        Tue, 11 Jun 2024 06:21:51 -0700 (PDT)
Received: from localhost.localdomain ([103.14.183.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6e787d08csm73415655ad.80.2024.06.11.06.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 06:21:51 -0700 (PDT)
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
Subject: [PATCH v1] ARM: dts: twl6032: Add DTS file for TWL6032 PMIC
Date: Tue, 11 Jun 2024 18:51:34 +0530
Message-Id: <20240611132134.31269-1-bavishimithil@gmail.com>
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

Regulator values are found from downstream kernel for espresso.

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 arch/arm/boot/dts/ti/omap/twl6032.dtsi | 94 ++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/twl6032.dtsi

diff --git a/arch/arm/boot/dts/ti/omap/twl6032.dtsi b/arch/arm/boot/dts/ti/omap/twl6032.dtsi
new file mode 100644
index 000000000..a48723a24
--- /dev/null
+++ b/arch/arm/boot/dts/ti/omap/twl6032.dtsi
@@ -0,0 +1,95 @@
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
+		regulator-min-microvolt = <2100000>;
+		regulator-max-microvolt = <2100000>;
+		regulator-always-on;
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	ldo1: regulator-ldo1 {
+		compatible = "ti,twl6032-ldo1";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		regulator-always-on;
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	ldo3: regulator-ldo3 {
+		compatible = "ti,twl6032-ldo3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	ldo4: regulator-ldo4 {
+		compatible = "ti,twl6032-ldo4";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		regulator-always-on;
+	};
+
+	ldo5: regulator-ldo5 {
+		compatible = "ti,twl6032-ldo5";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	ldo6: regulator-ldo6 {
+		compatible = "ti,twl6032-ldo6";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	smps4: regulator-smps4 {
+		compatible = "ti,twl6032-smps4";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	ldousb: regulator-ldousb {
+		compatible = "ti,twl6032-ldousb";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
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
+};
-- 
2.34.1


