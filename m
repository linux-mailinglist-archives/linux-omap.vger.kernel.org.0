Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44A30246771
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 15:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728399AbgHQNjw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 09:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728388AbgHQNjt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Aug 2020 09:39:49 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E0FCC061389;
        Mon, 17 Aug 2020 06:39:48 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id g13so3344092ioo.9;
        Mon, 17 Aug 2020 06:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=C7tJkw3gpkfOAsh/5PfRMa++rple6ZtJ6apnzTQm920=;
        b=MP82ajQ3AOs5A6p6hOhfYf+4czLAAW5UFKivKIxj8Pt5vKvaB3o+NBQnEWNjR2lSp6
         peh49DfnuH3CbOfIep3O0CaqSS03a9Q7QNhkn+zXBb08uxbAxfy5Ytwd9uWB8VAi/raR
         2LbhqEnpmjcMvnaR1VzW2pgA9/2OYfq9dHSrOu/6Lab23QRkn3OzVE2rhDuCBPhvWJ4R
         tz39j8KfCMSPrAZVI6YxTOwgc5RnxQxOPcT1cokcjJMVv/J2BNjzjtDoFGNfaei5/WF+
         lT/HMbqkEoEBtHYJsBKxf1KZC3FqFKisFf4YAd5TUT8XQda7T2pJM3/aE9TCqjQtLY4g
         2uLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=C7tJkw3gpkfOAsh/5PfRMa++rple6ZtJ6apnzTQm920=;
        b=rj7zru90wbDkNgPrWj8b4BQA0fTm2H8QUNm9t9a6cyS8uR0J56hUbdGuCf7urq1boo
         i44FcaGl0lLFO3JasJEP3dQoUht/f1tjDzFGXhUqftkpl8Sw8qKOKRbYwBuGJW1l/VOj
         06LoYcPtp5kNqiSvYJGA8J2V9amKE77swx0vg9Eszm5z3Gb6xTr45C9DNiz+72HJ28x/
         2HeweANtEP3iLydzGInwV4vpt8GtNfbftn6TFtthlJdF5Ur55ARM8+Npqq2VAU/CNXtC
         CNwk6zR7mx566mabYWn82pK4HZ4UGBMlTSv1eMQfymBMTiU2+YjBPfh32oVLxzzVEGeg
         18EQ==
X-Gm-Message-State: AOAM5337vwUp/KBJO4cqLNDid/FB5NnabSqJ7hnc7q9Xe5SUC83O1W1a
        em5ZPOPXmfiDKeRWbAnJ8fvIa/thELesog==
X-Google-Smtp-Source: ABdhPJygjm12YZVskCQ1Zymqu8sJEUcWaNfBP+uM8JDE4OvUKduWwUtskpDR+692WxEYlnvy8mvzTw==
X-Received: by 2002:a6b:8b10:: with SMTP id n16mr12524442iod.11.1597671582215;
        Mon, 17 Aug 2020 06:39:42 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id f18sm3351271ilj.24.2020.08.17.06.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 06:39:41 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V2] ARM: dts: omap3: Add cpu trips and cooling map for omap34/36 families
Date:   Mon, 17 Aug 2020 08:39:31 -0500
Message-Id: <20200817133931.11785-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The OMAP3530, OMAP3630, and DM3730 all show thresholds of 90C and 105C
depending on commercial or industrial temperature ratings.

This patch expands the thermal information to include the limits of 90
and 105C for alert and critical.  It sets the coolings-cells for the
34xx and 36xx CPU's which both point to omap3-cpu-thermal.dtsi.

For boards who never use industrial temperatures, these can be
changed on their respective device trees with something like:

&cpu_alert0 {
	temperature = <85000>; /* millicelsius */
};

&cpu_crit {
	temperature = <90000>; /* millicelsius */
};

OMAP3_THERMAL will need to be enabled.  It is off by default.

Signed-off-by: Adam Ford <aford173@gmail.com>
Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # on GTA04A5 with dm3730cbp100

---
V2:  Rebase on Linux 5.9-rc1

diff --git a/arch/arm/boot/dts/omap3-cpu-thermal.dtsi b/arch/arm/boot/dts/omap3-cpu-thermal.dtsi
index aee46fa8c055..99858eb0d7f6 100644
--- a/arch/arm/boot/dts/omap3-cpu-thermal.dtsi
+++ b/arch/arm/boot/dts/omap3-cpu-thermal.dtsi
@@ -17,4 +17,25 @@ cpu_thermal: cpu_thermal {
 
 			/* sensor       ID */
 	thermal-sensors = <&bandgap     0>;
+
+	cpu_trips: trips {
+		cpu_alert0: cpu_alert {
+			temperature = <90000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "passive";
+		};
+		cpu_crit: cpu_crit {
+			temperature = <105000>; /* millicelsius */
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

