Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 018CB24857C
	for <lists+linux-omap@lfdr.de>; Tue, 18 Aug 2020 14:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbgHRM5k (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 Aug 2020 08:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbgHRM5h (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 18 Aug 2020 08:57:37 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEC34C061389;
        Tue, 18 Aug 2020 05:57:36 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id b16so21065741ioj.4;
        Tue, 18 Aug 2020 05:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=RB/3h7KN5cdaLp36Iw4y0LY9Nbz/euP4xAyUVQnD3nM=;
        b=CgsVAVulFxrhRCO1I0jrHoJ7iDLXApX1PTer/TUfl9fyQHwXYWIT1qNSJAgTIapCyf
         R5qN1yoq+nMOpOTmN2kLChAVyxpumejn3TZjtZktbw5TlRIhzDiqqYFNm+R8biDXR1tC
         qzetEpdmjpHqLZreRrYa4PlddR91xJkavbUwbOEBWhZLnJ5Vk/UcLC35A8Jy7dt+CRQW
         qEaEtOvuN2e0TvqC6AIQDxmEtnb4SF7UScg7VraWeUVePImdLk8F8W9KRHIlyfMWzjwH
         7S4afyM2O7wzpk5Z3NWflhhNZPkAVN3CXsbmzBVBSeiTxrvMI2TFBgmlVlunSEtRnDHi
         SwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=RB/3h7KN5cdaLp36Iw4y0LY9Nbz/euP4xAyUVQnD3nM=;
        b=oUyvpbF0PvYldMZDKuZ2PuqaHmqUXsyPF6AGXqH/VpyL9yvrRetCMt4V0/djJxALci
         DzR+5xqW6ydZeJREuHQroOgIJ3TCgh3i8LFzh8MS9XTqNl4yalKJwxiaZ3fkqOBRQ3sF
         pHcPBVlRfPxJd0emttiKw2fRugezd9+YXpxizRYXfJIs29rMza2deV6JK3BdogBQBRBt
         iJBskj3hR4W17BlqtfSze3XGUBuoj8H5jyINsn2gln50+/obLATwz7IUMtB+jilqT2Cf
         AIBlZ47aQ9Q2Xpfg/I2ttLqUkT+HGJul3APV/+KOZokfhMcGkWMiobqaCpRT+bja+V/m
         xG/Q==
X-Gm-Message-State: AOAM531jrILqgEEITo7b8XGC51Y93+eX0aL+b4sAtwbTDVtU4xH9yXio
        ys744kP/0KpjgDBmMdW1T4DI5Ev33+p43Q==
X-Google-Smtp-Source: ABdhPJzi5l8EKyFs57dY5mvktaLcED8bT3fejXKQgEeocUnOFAlBKNLa9f1XDlX+9FVyPoFBrqlGLA==
X-Received: by 2002:a02:b106:: with SMTP id r6mr19533952jah.9.1597755455663;
        Tue, 18 Aug 2020 05:57:35 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id p7sm7441627ilj.56.2020.08.18.05.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 05:57:34 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V3] ARM: dts: omap3: Add cpu trips and cooling map for omap34/36 families
Date:   Tue, 18 Aug 2020 07:57:20 -0500
Message-Id: <20200818125720.10424-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Currently, OMAP3_THERMAL is disabled by default, so the bandgap sensor
is unavailable, and enabling it will somewhat increase power consumption.
However for boards which operate near their thermal limit, OMAP3_THERMAL
can be enabled and monitored to keep the processor from either running
too fast, or shutdown when it's deemed to be operating at an unsafe
thermal limit at the expense of increased power consumption.

The OMAP3530, OMAP3630, and DM3730 all show thresholds of 90C and 105C
depending on commercial or extended temperature ratings.

This patch expands the thermal information to include the limits of
80C for alert and 90C critical based on commercial temperature rating.
It sets the coolings-cells for the 34xx and 36xx CPU's which will start
to throttle back their maximum frequency when the bangap sensor reads
above the alert temerature of 80C.

For boards who which to increase the temperatures for extended
temperature ratings, these can be changed on their respective
device trees with something like:

&cpu_alert0 {
	temperature = <90000>; /* millicelsius */
};

&cpu_crit {
	temperature = <105000>; /* millicelsius */
};

Signed-off-by: Adam Ford <aford173@gmail.com>
Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # on GTA04A5 with dm3730cbp100

---
V3:  Make commercial temperature the default instead of extended temp
     Add notes about power consumption and OMAP3_THERMAL and the
     dependency of this patch to OMAP3_THERMAL.

V2:  Rebase on Linux 5.9-rc1

diff --git a/arch/arm/boot/dts/omap3-cpu-thermal.dtsi b/arch/arm/boot/dts/omap3-cpu-thermal.dtsi
index aee46fa8c055..1ed837859374 100644
--- a/arch/arm/boot/dts/omap3-cpu-thermal.dtsi
+++ b/arch/arm/boot/dts/omap3-cpu-thermal.dtsi
@@ -17,4 +17,25 @@ cpu_thermal: cpu_thermal {
 
 			/* sensor       ID */
 	thermal-sensors = <&bandgap     0>;
+
+	cpu_trips: trips {
+		cpu_alert0: cpu_alert {
+			temperature = <80000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "passive";
+		};
+		cpu_crit: cpu_crit {
+			temperature = <90000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "critical";
+		};
+	};
+
+	cpu_cooling_maps: cooling-maps {
+		map0 {
+			trip = <&cpu_alert0>;
+			cooling-device =
+				<&cpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
 };
diff --git a/arch/arm/boot/dts/omap34xx.dtsi b/arch/arm/boot/dts/omap34xx.dtsi
index 9c3ee4ac8165..c0dcc75833a8 100644
--- a/arch/arm/boot/dts/omap34xx.dtsi
+++ b/arch/arm/boot/dts/omap34xx.dtsi
@@ -20,6 +20,7 @@
 			operating-points-v2 = <&cpu0_opp_table>;
 
 			clock-latency = <300000>; /* From legacy driver */
+			#cooling-cells = <2>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.dtsi
index 9c3beefc0fe0..fadbf308feff 100644
--- a/arch/arm/boot/dts/omap36xx.dtsi
+++ b/arch/arm/boot/dts/omap36xx.dtsi
@@ -25,6 +25,7 @@
 
 			vbb-supply = <&abb_mpu_iva>;
 			clock-latency = <300000>; /* From omap-cpufreq driver */
+			#cooling-cells = <2>;
 		};
 	};
 
-- 
2.17.1

