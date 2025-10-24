Return-Path: <linux-omap+bounces-4748-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC37C04E65
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 09:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1715E1AE3136
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 07:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383B62FBDEB;
	Fri, 24 Oct 2025 07:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWkj5yLS"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AD72FB962
	for <linux-omap@vger.kernel.org>; Fri, 24 Oct 2025 07:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761292654; cv=none; b=gvq9m201akkZhy1xnvQWtoCAqwY323TQXWj8i3vD9UuRT4ELh4oNW/nWUYohoQ5mA2AMD7DjJslESzpqV9bdc5noEIkhrDnPRhDlvOjDhgTr2IG2f5VR1bv41nDDOVAZrhDjFr5yi3aqzUMpX4ePd8pqtakM0XaRDXCY6KV9U7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761292654; c=relaxed/simple;
	bh=tW2cZj4A2kild+iwNlrsp24JcLX1QbExyS5VOwDy9+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m2VFtBv5e4u6X4wDj7Qqa89FsHajlq4IyRYtYThJjAXsy+mvZNjtWK/kl//E2tvhBkmDj1xQxqcNjxSlTri7aQTvDe0lR3EjUQp9Cy5sNQ9gzxjD4Rxq0coHiXFID1ynmhS9OQYMG8onhbs1APb08PVqQZ6+kTQ8kXhfA0qLaoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWkj5yLS; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-29490944023so577485ad.3
        for <linux-omap@vger.kernel.org>; Fri, 24 Oct 2025 00:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761292652; x=1761897452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5TBvY2oyqcr2gNkpD6og3lmY61su8Z4ovOoReTCIYGo=;
        b=VWkj5yLSIGc7Ipfh0w7NOws190udmoReo6YlmUf5utnEefAFaPj7PbjLdN6kql58Ez
         JrlAedP60RnM1/blt3kVAmr51g7KaEqlO4K4X4NlK5DxKMXHyYGFSXagamQYdos83voG
         tjKL7CrlPgEXykeqhbE8BPoY85d6jvBsQpTImIsrhpxeBrlj4iP/tjKj7Yl9lUEALxqL
         jxRKrqVk5ylU02vyEk3aLs6XlVKrkxGOhpNsHwagYl3EMEXGzgjz5OZLOZbHOhFK1+Sm
         yplehQFhzRxcNFM9LPUNSl9knsev1a05hoK2CnSxECHSXA51Zj5CcuRBwE3BTc60iur5
         GRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761292652; x=1761897452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TBvY2oyqcr2gNkpD6og3lmY61su8Z4ovOoReTCIYGo=;
        b=TzL1GrGjCIHnFkliHg9Gsz66ZddAH2pAjdzK1yah2mH2yC05nswtxKwz+EjksAUnws
         2tpmrM4j+JJ81xTG6FTv4loHGsqPeZYYi21LAbr5pzxVHtvaIx0/WCZol/GT8hleF4gG
         KCeJwy2wE5yj2dO3+aGNi7j7ZPQASqPh/T+9YUlCuqvgb+BjcQCO+tcZuveKnLUY5rvi
         wx9EhtMFB/noVSSH0/HljQPOwHEJZHCn3gxffMi3Esj1PuDoTE5i76seX6RboicF/ZJ+
         OKwV2Heu5S1P32HY2a19myihJkAfgNZjlYtM3ZuNC90l+FCNG5LJ1Aa0v8Li2Tv/ifH9
         pCsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyYMVj8+MCqb3CmU1zkmXu5LTu3lMfY/2EJH3WTBRcbyWbYnQTMJhQyjYzdZpFPuUcmJutjRvFUpk7@vger.kernel.org
X-Gm-Message-State: AOJu0YzyhGVqmWyOQ+6v1AU4jflQoqhz8NyX+e6WN8103zrGkvFVFDJz
	dcQ6jrEwILYT3exfkTHiHBBbG2VggVivf3d7Gpgo3LqKFD72cGe9GAh0
X-Gm-Gg: ASbGnctOb1U2gZmbrp+CkDKM5JBR7UuVsT2jQbHdN7gvjQTK6sFVnrCj+28w5LsdPK2
	KYnCVZqh3MV7n12sJh1PHFcunADRF4ph3VG6gMG25OL0j38Fv7niTUf4oynSVVJtDKMSEPIoxwU
	C+mi0Or3O/znpqmytjMtURhXTY85bIPsnFBBfxUaedgL8CXqzBofl/ZUCMXopyW8cpuyUI5sji+
	Ew6OgNp+FE7ZTQuUPscrtWqhqYDM/WRZw4eaBZTcDtvbAzh55tA1FGSXl6fsxzrpNhs5YPqCScU
	DYjs7waWctVGwusbSbiono3uC/a2gm2+2noosjlkdBfliUvmp1H8en1PqZBWEw0Qd5YpbXhl9qy
	3pr+y3cLFNWuoG8xeHs1pal4UcLhufl7EaQt16fZ1rGLSo/KiW3wmxnnOaoHm/N+A+/qA0Uy1+p
	B6CT/7/dAjl+5J7+u0Zdch
X-Google-Smtp-Source: AGHT+IHZEWd+WfHYJKNtSpssWxDvxeK3oK6rSiNGaRDKTZSQMyFDu/hsiCkgZP90gC/bvz+hzi0gsw==
X-Received: by 2002:a17:902:d4c8:b0:27e:e96a:4c3 with SMTP id d9443c01a7336-290d14e83b6mr355043595ad.14.1761292652244;
        Fri, 24 Oct 2025 00:57:32 -0700 (PDT)
Received: from Black-Pearl.localdomain ([27.7.191.116])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2946dfd045esm46608205ad.64.2025.10.24.00.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 00:57:31 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Fri, 24 Oct 2025 07:57:10 +0000
Subject: [PATCH v5 3/3] dt-bindings: mmc: ti,omap2430-sdhci: convert to DT
 schema
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-ti-sdhci-omap-v5-3-df5f6f033a38@gmail.com>
References: <20251024-ti-sdhci-omap-v5-0-df5f6f033a38@gmail.com>
In-Reply-To: <20251024-ti-sdhci-omap-v5-0-df5f6f033a38@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Barker <paul.barker@sancloud.com>, 
 Marc Murphy <marc.murphy@sancloud.com>, Tony Lindgren <tony@atomide.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.3

Convert TI OMAP SDHCI Controller binding to YAML format.
Changes during Conversion:
- Define new properties like "clocks", "clock-names",
  "pbias-supply" and "power-domains" to resolve dtb_check errors.
- Remove "pinctrl-names" and "pinctrl-<n>"
  from required as they are not necessary for all DTS files.
- Remove "ti,hwmods" property entirely from the YAML as the
  DTS doesn't contain this property for the given compatibles and the
  text binding is misleading.
- Add "clocks", "clock-names" and "max-frequency" to the required
  properties based on the compatible and the text binding doesn't mention
  these properties as required.
- Add missing strings like "default-rev11", "sdr12-rev11", "sdr25-rev11",
  "hs-rev11", "sdr25-rev11" and "sleep" to pinctrl-names string array
  to resolve errors detected by dtb_check.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../devicetree/bindings/mmc/sdhci-omap.txt         |  43 ------
 .../devicetree/bindings/mmc/ti,omap2430-sdhci.yaml | 169 +++++++++++++++++++++
 2 files changed, 169 insertions(+), 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-omap.txt b/Documentation/devicetree/bindings/mmc/sdhci-omap.txt
deleted file mode 100644
index f91e341e6b36..000000000000
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
index 000000000000..34e288f3ef13
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/ti,omap2430-sdhci.yaml
@@ -0,0 +1,169 @@
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
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: fck
+      - const: mmchsdb_fck
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+  pinctrl-names:
+    minItems: 1
+    maxItems: 14
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
+  power-domains:
+    maxItems: 1
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
+allOf:
+  - $ref: sdhci-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - ti,dra7-sdhci
+              - ti,k2g-sdhci
+    then:
+      required:
+        - max-frequency
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,k2g-sdhci
+    then:
+      required:
+        - clocks
+        - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    mmc@4809c000 {
+        compatible = "ti,dra7-sdhci";
+        reg = <0x4809c000 0x400>;
+        interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+        max-frequency = <192000000>;
+        sdhci-caps-mask = <0x0 0x400000>;
+        bus-width = <4>;
+        vmmc-supply = <&vmmc>; /* phandle to regulator node */
+        dmas = <&sdma 61>, <&sdma 62>;
+        dma-names = "tx", "rx";
+    };
+...

-- 
2.51.1


