Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80865B2387
	for <lists+linux-omap@lfdr.de>; Fri, 13 Sep 2019 17:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730198AbfIMPh3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Sep 2019 11:37:29 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:44816 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728811AbfIMPh2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Sep 2019 11:37:28 -0400
Received: by mail-io1-f65.google.com with SMTP id j4so63445696iog.11;
        Fri, 13 Sep 2019 08:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zmHEq/Xr17AzVU8XIpJ00tKT+crE7NuUO+gN/6eqT+0=;
        b=cEXFv8y65yzIrZm/GmQ+NP3gY53BT6jJwwBKpSyMypfRrP3iji32Vny4+VInRdlbBP
         mcMDrQIUXx4MCEJS/MkEdahpEhYpq/DiAAp0MG99cb4jdzw9pZWcyhcibNQ3CdlbT5j8
         +d768wH9oVDCx0TztVRZP1yFT6WUSAxvRNSGDgMixzav/GeIKgBx6s1Y7JANwnJrnxus
         5BXp1bAHObXvsXl/Wj23aZZ0YTOr94mU/Zwv5ME2cA+0P38M+qZtgPH5lKiOonEPbBij
         m5fgN4KfSvTCFOdG/N8MkOUoBqUOveTSZRLHfoEJSpf1ahdwTTiMPxEQK6tyW71/2gHF
         /ZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zmHEq/Xr17AzVU8XIpJ00tKT+crE7NuUO+gN/6eqT+0=;
        b=U+6tnMm+TL6kgy42L6zxU68kWUB0Qra47xZ9ABqFKCjkl5YKi4t+tSmP4cDZPygJyO
         b+SvmovBg+V9BO6wD+XzOSf3lBK1qwTpOTLzUi5Bx7P3PN8EEY1FGc+2DARWiDTkg1OG
         nS2o4Nv8hBCYHwbRtWSyOM3qUaOuBNORH0q3Eh1TRmGq4Xm/sKBUIfSoW00a9M8pySBg
         nDfkQzOcsCjDRayewEMT3Zb8y8ypaIGzVay7bRhcQJtVKmOoNEMbuLheRT3MXSr30kLF
         5dcg309WVlkS7sV4FCHgbwo0X4Os6+F2TdJO2L1nrgeuIAzOhJte6K7CZBgQLvV+dA5C
         Vbcw==
X-Gm-Message-State: APjAAAWH4mJhex7KrbtU+ZOBo7vFSTWHjZNK1XwSZ5KnP17aXReyIrxS
        GevbeC1/S8soYQO9Ug/DIBEE7i8I
X-Google-Smtp-Source: APXvYqxrC3PIiczCEPVZ3vsBJoXPRhPq3XFNf/S+t0qlksJvZ3MVmbhDf7cJDiuQ7qJHaqdYQi+ohw==
X-Received: by 2002:a05:6602:c7:: with SMTP id z7mr275670ioe.130.1568389046172;
        Fri, 13 Sep 2019 08:37:26 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id h3sm19780842iol.73.2019.09.13.08.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 08:37:25 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     adam.ford@logicpd.com, nm@ti.com, hns@goldelico.com,
        Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC v2 2/2] ARM: omap3: Consolidate thermal references to common omap3
Date:   Fri, 13 Sep 2019 10:37:14 -0500
Message-Id: <20190913153714.30980-2-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190913153714.30980-1-aford173@gmail.com>
References: <20190913153714.30980-1-aford173@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Because the omap34xx, omap36xx and am3517 SoC's have the same
thermal junction limits, there is no need to duplicate the entry
multiple times.

This patch removes the thermal references from omap36xx and
omap34xx and pushes it into the common omap3.dtsi file with
the added benefit of enabling the thermal info on the AM3517.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:	Add node name for cpu and add cooling-cells entry

diff --git a/arch/arm/boot/dts/omap3.dtsi b/arch/arm/boot/dts/omap3.dtsi
index 4043ecb38016..84704eb3b604 100644
--- a/arch/arm/boot/dts/omap3.dtsi
+++ b/arch/arm/boot/dts/omap3.dtsi
@@ -32,7 +32,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		cpu: cpu@0 {
 			compatible = "arm,cortex-a8";
 			device_type = "cpu";
 			reg = <0x0>;
@@ -41,9 +41,14 @@
 			clock-names = "cpu";
 
 			clock-latency = <300000>; /* From omap-cpufreq driver */
+			#cooling-cells = <2>;
 		};
 	};
 
+	thermal_zones: thermal-zones {
+		#include "omap3-cpu-thermal.dtsi"
+	};
+
 	pmu@54000000 {
 		compatible = "arm,cortex-a8-pmu";
 		reg = <0x54000000 0x800000>;
diff --git a/arch/arm/boot/dts/omap34xx.dtsi b/arch/arm/boot/dts/omap34xx.dtsi
index f572a477f74c..b80378d6e5c1 100644
--- a/arch/arm/boot/dts/omap34xx.dtsi
+++ b/arch/arm/boot/dts/omap34xx.dtsi
@@ -101,10 +101,6 @@
 			};
 		};
 	};
-
-	thermal_zones: thermal-zones {
-		#include "omap3-cpu-thermal.dtsi"
-	};
 };
 
 &ssi {
diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.dtsi
index 6fb23ada1f64..ff2dca63a04e 100644
--- a/arch/arm/boot/dts/omap36xx.dtsi
+++ b/arch/arm/boot/dts/omap36xx.dtsi
@@ -140,10 +140,6 @@
 			};
 		};
 	};
-
-	thermal_zones: thermal-zones {
-		#include "omap3-cpu-thermal.dtsi"
-	};
 };
 
 /* OMAP3630 needs dss_96m_fck for VENC */
-- 
2.17.1

