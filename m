Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99FE6CEECF
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2019 00:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729527AbfJGWGI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 18:06:08 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:34165 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728422AbfJGWGH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Oct 2019 18:06:07 -0400
Received: by mail-io1-f66.google.com with SMTP id q1so32282798ion.1;
        Mon, 07 Oct 2019 15:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xderkNAd5iCp8HxtFYkNSskrWASJhHRHCkZ3LCYjMzg=;
        b=uAl/TZp7ZkdqN0kHsH6si4mz/kt6foUvrxpy/Hs1hwwYeDdgEuTY2/NX8gN7Z6xarw
         1hIqz1zlPv0f61x76A9KuZPX3ND6xtw+uJwpD9J2GmtwH5MMTXf4rikuKip1Zd6oOfeU
         KCFrY8uiRgAbhFxe9eH46tdvsh+yGE2QR037uytPar3/FjgdxxWuGmruBJFa1/lZ4DFi
         VUFpwudGnJyx287MeZ6YFJ0Kx8R/nsFFuL3x6PkufOhzgMZ05iJ6t+Qwcw1jThz4NCEc
         yijnv5TXxYEgWHpjcY+hnLWFuQe4uUe7e8JNlUeN53aU33oXKOKy+TjaqQIC7E3sUfl1
         smEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xderkNAd5iCp8HxtFYkNSskrWASJhHRHCkZ3LCYjMzg=;
        b=TWFlofanP3rGcVdD29pD0JI+vriahiTYd2UtrBpViBkmMa9OJDbI+RIS+FRisQ5+l/
         jYqQ9AM7roKeX4kXbynZoPGY6dCVX8+WEt5uCFszvIgWE8LTXOz6dvnfYZOsfZF0/Er7
         MvhO8tCTzM+K109l4mqNEA7WLNEmq9fHieWKmaXWfnNGc5jcyfFg/3uD4g7PDjn7cvcM
         g/ejY7s3XVGYEmheWTxyeYtTbm6KYOrcVMzJPnGrNAC4+cbhEU73RG4cdQYyz/JKyqat
         mWM4nqFbtBf/dS2Isp9UXqIdeVgvoIKc2QvOjc/SXZ+ABFMrNdOpoz4CHMZ1tY70tXdx
         3y8w==
X-Gm-Message-State: APjAAAUXQROFZDhwrXFBhw+mCkRpPaFFYBkzbaAqScCpLQKzSQgfus3n
        6n4jOamlm1CYCq8v14P4HH5WDQRs
X-Google-Smtp-Source: APXvYqyjBEBE28A9G2yZBMzh9WFCpy/KQsZ4WTfLgjutm/b0s70ky7JLyIM5zHztc9JPwoU/XJytDQ==
X-Received: by 2002:a5e:c747:: with SMTP id g7mr269134iop.70.1570485966577;
        Mon, 07 Oct 2019 15:06:06 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id m14sm6479874ild.3.2019.10.07.15.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 15:06:05 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     adam.ford@logicpd.com, hns@goldelico.com,
        Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] ARM: dts: omap3: Add cpu trips and cooling map for omap34/36 families
Date:   Mon,  7 Oct 2019 17:05:40 -0500
Message-Id: <20191007220540.30690-2-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007220540.30690-1-aford173@gmail.com>
References: <20191007220540.30690-1-aford173@gmail.com>
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

Signed-off-by: Adam Ford <aford173@gmail.com>
Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # on GTA04A5 with dm3730cbp100

diff --git a/arch/arm/boot/dts/omap3-cpu-thermal.dtsi b/arch/arm/boot/dts/omap3-cpu-thermal.dtsi
index 235ecfd61e2d..dfbd0cb0b00b 100644
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
index 7b09cbee8bb8..99a7161bebb2 100644
--- a/arch/arm/boot/dts/omap34xx.dtsi
+++ b/arch/arm/boot/dts/omap34xx.dtsi
@@ -26,6 +26,7 @@
 				600000  1350000
 			>;
 			clock-latency = <300000>; /* From legacy driver */
+			#cooling-cells = <2>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.dtsi
index 1e552f08f120..8096b6ef0ae1 100644
--- a/arch/arm/boot/dts/omap36xx.dtsi
+++ b/arch/arm/boot/dts/omap36xx.dtsi
@@ -28,6 +28,7 @@
 				800000  1325000
 			>;
 			clock-latency = <300000>; /* From legacy driver */
+			#cooling-cells = <2>;
 		};
 	};
 
-- 
2.17.1

