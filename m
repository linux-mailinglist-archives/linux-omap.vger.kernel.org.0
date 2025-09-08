Return-Path: <linux-omap+bounces-4609-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58661B494F6
	for <lists+linux-omap@lfdr.de>; Mon,  8 Sep 2025 18:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0523016E194
	for <lists+linux-omap@lfdr.de>; Mon,  8 Sep 2025 16:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D325F30F93C;
	Mon,  8 Sep 2025 16:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MiEBgeAR"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA7D2E1C7C;
	Mon,  8 Sep 2025 16:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757348293; cv=none; b=GksGt5TXuIGdJiExE6jTPPLC4oIyc2D2BVJ+fxyC2xhF32XHr6bAkyke7jGS87jrJWyZfURnmyIT6gRCJepj2HOgwk99Qt9wF7J6aBFAzErmT1+Uluji6NipKT9zUb8SV6Qp0HBQ32X/VveT2ObN4z35szWQf4IXCyLunUTz8ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757348293; c=relaxed/simple;
	bh=0NUSOA/yUnRvSka+F+erNHF8ID79XG6Md4Sp1zxz/MM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WhLkwBAYx+QimoIlXdC02Fy1r+v8P08RYHJgEXGPISnDi1mWJ9Ys21SuUbstKT2aApkyP7O0vViT65qoQIk5POqvDbD1ubTD68zEZ0ibrftYIokS90xxLhmzGayTvFf2t39Uagsbts8fxaURqf5jwwIwJ0+hU6kKNqJtYqgcyyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MiEBgeAR; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76e6cbb991aso3929796b3a.1;
        Mon, 08 Sep 2025 09:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757348291; x=1757953091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1qtec3uyx3zEz0QpxQLk+squlnPusrmyWF7QQ2lWuOc=;
        b=MiEBgeARcD/8rceymSdt3zPWD/fvSjj3bCEbnHVzMpNsAjD9yTW6p7ScuLPK/gwMaT
         nTJrkjIE56VQCK0OaMa6mcuKL/AaDVJuima8O8B9Te31X9JGtoAq2zxQxoTgyJFY1Jnj
         V14wALi+JJFj4ebjJ4zlNuE4qhZeF55i+eoMZhnDz3SzoUd6JqPsyntCANOhJM7NgNNc
         /PxEabvyLg9dFr8uxV1u4dlvswwRCe+dOruHaSaY5//cvhAz0j36yp7cqBmS+bKLQgFw
         aGPQmPXJSz8U6aUu0QlYZectH9LS3Hh0Eog7s+dy/NZvX3e2/CDC7ElIfRbO2PDT/FEm
         EP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757348291; x=1757953091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1qtec3uyx3zEz0QpxQLk+squlnPusrmyWF7QQ2lWuOc=;
        b=aPMOQFMHHkG6j+XuL2uq6mYtZL63eJX2KFzQlUc+vcHoFvAOYj/zmhGJYY9DWG7OBp
         /yo6ryyH8HuI8lt4VNEMSD/F3pLmEU2sCDLjKIwbL4cX6i4VeQ6tNL6osuiitUTaz4My
         lNS3OALM546kUVcc/p0g/nkhOZquWMKFyCzrrDeyJZaR6vn3//t3YjJ9Sxqf215FXqpx
         sVC8brwbVRhxM47Lybt2lmXl1ZF9Of+qGrIV9dB9vMorI1uSD4y+UZpC5sIeCl9Cf9Yk
         cHB+vhxnAY0Mh62P8kS3x8kN//EauvLZuQ50dcvrylGiA+eL8vLiWtF17WE+Q9x5LSD9
         YbEA==
X-Forwarded-Encrypted: i=1; AJvYcCUPKa+aRgOodihgMjd7gGp3GeHTLUN02Ww4tY33IPIl9arT8KhOFfzhBA2TZWJ3xwPTido20ImCa3xLWA==@vger.kernel.org, AJvYcCV+FA8T2BfnuaYwQezHZTN7f7+9BCvWwvMW8zo7p+dsK7g1956Naj0B+z8u9uncFZjJ9UwT5slYZKQq@vger.kernel.org, AJvYcCVxBT+3/qr+DXNYt6yjGj/Etyv8ISt4PM2JKTZzvr7DCjQ4wg/Q48ZgyOLU72TjnHxA+Ih+wn+60HzxFSn9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtgm2oIvSfLFGaT4yEgMUoYS8CFc2/V7xnqcX5ZuAwz8qj1eCQ
	PmiNSKtrN9RKqIT5RmC5rHq4WNulGPOn7guukENSOhV7D47fkCYKfY9Z
X-Gm-Gg: ASbGncsdFZpiPbihJ7ORkW1xlzJdBdWoCtVZHoRKjN8CKZxrlct6nyQvRhRy5JrdVkY
	XMYeNfJJC68Zv/3q3sPLLZU9lVgjxCs0J+uO3Ue3xDhqLj3OXCXVTeoPiAMZ6h+MIVGl9XnSMkA
	6UEA19MZcnO6x8YDj1Dnd/f7U5IzjMXGdkBgBIpawE4VVjKm/z0C97kFrYaL7j322bS+48sQY+q
	H3I7cgMMBnET1oyQJGBCHASvRdvbDIcrzGFhWDpB7QJGyE0lNPtaIsFPwAJb3WueeUR9kNGkc7R
	lMAlRnXyZ7vM7DcjyphXZegmMQRNcgC9RivJSx1FUoBiGs5RfGRl8x1NGZbgm+vsbj0QKHXi0m3
	g3TxnOVDhLoRVmBo9edO08o4Prl3irpbPwRUTCn5jum8iwkHE4rtkZQ==
X-Google-Smtp-Source: AGHT+IEiQJIWMzjG8kO1ml+LQ8B0a1u6nIiZo+4kbDe84EdY9wxCBbj8j+s+Gurd/RLh4EqO7sOtow==
X-Received: by 2002:a05:6a00:882:b0:772:4759:e433 with SMTP id d2e1a72fcca58-7742dd123eemr9937123b3a.2.1757348290796;
        Mon, 08 Sep 2025 09:18:10 -0700 (PDT)
Received: from Black-Pearl.localdomain ([27.7.158.204])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-772608b1b5asm21319074b3a.46.2025.09.08.09.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 09:18:10 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Mon, 08 Sep 2025 16:17:13 +0000
Subject: [PATCH v2 2/2] dt-bindings: mmc: sdhci-omap: convert to DT schema
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ti-sdhci-omap-v2-2-72927890482f@gmail.com>
References: <20250908-ti-sdhci-omap-v2-0-72927890482f@gmail.com>
In-Reply-To: <20250908-ti-sdhci-omap-v2-0-72927890482f@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Barker <paul.barker@sancloud.com>, 
 Marc Murphy <marc.murphy@sancloud.com>, Tony Lindgren <tony@atomide.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.2

Convert TI OMAP SDHCI Controller binding to YAML format.
Changes during Conversion:
- Define new properties like "clock-frequency"
  and "pbias-supply" to resolve errors detected by DTB_CHECK.
- Remove "ti,hwmods", "pinctrl-names" and "pinctrl-<n>"
  from required as they are not necessary for all DTS files and the
  text binding is misleading.
- Add missing strings like "default-rev11", "sdr12-rev11", "sdr25-rev11",
  "hs-rev11", "sdr25-rev11" and "sleep" to pinctrl-names string array.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../devicetree/bindings/mmc/sdhci-omap.txt         |  43 ------
 .../devicetree/bindings/mmc/ti,omap2430-sdhci.yaml | 152 +++++++++++++++++++++
 2 files changed, 152 insertions(+), 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-omap.txt b/Documentation/devicetree/bindings/mmc/sdhci-omap.txt
deleted file mode 100644
index f91e341e6b36c410275e6f993dd08400be3fc1f8..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/mmc/sdhci-omap.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-* TI OMAP SDHCI Controller
-
-Refer to mmc.txt for standard MMC bindings.
-
-For UHS devices which require tuning, the device tree should have a "cpu_thermal" node which maps to the appropriate thermal zone. This is used to get the temperature of the zone during tuning.
-
-Required properties:
-- compatible: Should be "ti,omap2430-sdhci" for omap2430 controllers
-	      Should be "ti,omap3-sdhci" for omap3 controllers
-	      Should be "ti,omap4-sdhci" for omap4 and ti81 controllers
-	      Should be "ti,omap5-sdhci" for omap5 controllers
-	      Should be "ti,dra7-sdhci" for DRA7 and DRA72 controllers
-	      Should be "ti,k2g-sdhci" for K2G
-	      Should be "ti,am335-sdhci" for am335x controllers
-	      Should be "ti,am437-sdhci" for am437x controllers
-- ti,hwmods: Must be "mmc<n>", <n> is controller instance starting 1
-	     (Not required for K2G).
-- pinctrl-names: Should be subset of "default", "hs", "sdr12", "sdr25", "sdr50",
-		 "ddr50-rev11", "sdr104-rev11", "ddr50", "sdr104",
-		 "ddr_1_8v-rev11", "ddr_1_8v" or "ddr_3_3v", "hs200_1_8v-rev11",
-		 "hs200_1_8v",
-- pinctrl-<n> : Pinctrl states as described in bindings/pinctrl/pinctrl-bindings.txt
-
-Optional properties:
-- dmas:		List of DMA specifiers with the controller specific format as described
-		in the generic DMA client binding. A tx and rx specifier is required.
-- dma-names:	List of DMA request names. These strings correspond 1:1 with the
-		DMA specifiers listed in dmas. The string naming is to be "tx"
-		and "rx" for TX and RX DMA requests, respectively.
-
-Deprecated properties:
-- ti,non-removable: Compatible with the generic non-removable property
-
-Example:
-	mmc1: mmc@4809c000 {
-		compatible = "ti,dra7-sdhci";
-		reg = <0x4809c000 0x400>;
-		ti,hwmods = "mmc1";
-		bus-width = <4>;
-		vmmc-supply = <&vmmc>; /* phandle to regulator node */
-		dmas = <&sdma 61 &sdma 62>;
-		dma-names = "tx", "rx";
-	};
diff --git a/Documentation/devicetree/bindings/mmc/ti,omap2430-sdhci.yaml b/Documentation/devicetree/bindings/mmc/ti,omap2430-sdhci.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..2c8be3b0986755579e0f4d3f36554f378af914d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/ti,omap2430-sdhci.yaml
@@ -0,0 +1,152 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/ti,omap2430-sdhci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI OMAP SDHCI Controller
+
+maintainers:
+  - Kishon Vijay Abraham I <kishon@ti.com>
+
+description:
+  For UHS devices which require tuning, the device tree should have a
+  cpu_thermal node which maps to the appropriate thermal zone. This
+  is used to get the temperature of the zone during tuning.
+
+allOf:
+  - $ref: sdhci-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ti,omap2430-sdhci
+      - ti,omap3-sdhci
+      - ti,omap4-sdhci
+      - ti,omap5-sdhci
+      - ti,dra7-sdhci
+      - ti,k2g-sdhci
+      - ti,am335-sdhci
+      - ti,am437-sdhci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  pinctrl-names:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    minItems: 1
+    maxItems: 19
+    items:
+      enum:
+        - default
+        - default-rev11
+        - hs
+        - sdr12
+        - sdr12-rev11
+        - sdr25
+        - sdr25-rev11
+        - sdr50
+        - ddr50-rev11
+        - sdr104-rev11
+        - ddr50
+        - sdr104
+        - ddr_1_8v-rev11
+        - ddr_1_8v
+        - ddr_3_3v
+        - hs-rev11
+        - hs200_1_8v-rev11
+        - hs200_1_8v
+        - sleep
+
+  pinctrl-0:
+    maxItems: 1
+
+  pinctrl-1:
+    maxItems: 1
+
+  pinctrl-2:
+    maxItems: 1
+
+  pinctrl-3:
+    maxItems: 1
+
+  pinctrl-4:
+    maxItems: 1
+
+  pinctrl-5:
+    maxItems: 1
+
+  pinctrl-6:
+    maxItems: 1
+
+  pinctrl-7:
+    maxItems: 1
+
+  pinctrl-8:
+    maxItems: 1
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+  ti,hwmods:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      This field is used to fetch the information such as
+      address range, irq lines, dma lines, interconnect, PRCM register,
+      clock domain, input clocks associated with MMC.
+    pattern: "^mmc[0-9]+$"
+
+  pbias-supply:
+    description:
+      It is used to specify the voltage regulator that provides the bias
+      voltage for certain analog or I/O pads.
+
+  ti,non-removable:
+    description:
+      It indicates that a component is not meant to be easily removed or
+      replaced by the user, such as an embedded battery or a non-removable
+      storage slot like eMMC.
+    type: boolean
+    deprecated: true
+
+  vmmmc-supply:
+    description:
+      It is used to specify the power supply (regulator) for the MMC/SD card's
+      main operating voltage (VCC/VDD).
+
+  clock-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      It represents the speed at which a clock signal associated with a device
+      or bus operates, measured in Hertz (Hz). This value is crucial for configuring
+      hardware components that require a specific clock speed.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    mmc@4809c000 {
+        compatible = "ti,omap2430-sdhci";
+        reg = <0x4809c000 0x400>;
+        interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+        ti,hwmods = "mmc1";
+        bus-width = <4>;
+        vmmc-supply = <&vmmc>; /* phandle to regulator node */
+        dmas = <&sdma 61>, <&sdma 62>;
+        dma-names = "tx", "rx";
+    };
+...

-- 
2.51.0


