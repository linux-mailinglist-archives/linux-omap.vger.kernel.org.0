Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE7CB2389
	for <lists+linux-omap@lfdr.de>; Fri, 13 Sep 2019 17:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729657AbfIMPh0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Sep 2019 11:37:26 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:35384 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728811AbfIMPh0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Sep 2019 11:37:26 -0400
Received: by mail-io1-f67.google.com with SMTP id f4so62744612ion.2;
        Fri, 13 Sep 2019 08:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=KnU9TUwwhzNXEjbUZxMQhLTgc4VPnMrYLJg6nyxqlf8=;
        b=TBGefjFXWDVSm0D1FGKof5u35eT0zV+Y4fyf07ZX3WrAJG33pn802n4mc3U88WXln5
         VoJCtPGxd3v6hZX9WsOKBIDXMQCELCanw7CiAwjE2ZwCr8Jgo4olo0LUq4aqrDPGHqwp
         bOk7wK4YXxRw9vOgK0E2t29KzleGoTmiuz1lFCihFYK5/SkcPE8a62JNM6qjI/P8hohC
         wmlCBIoydfzzIE1WVF7xYMb6lagw6g5eZIPsTG2lJOZlaUlGfwt+vOpA0rXhfYFV9HEX
         LjY+I2w1SA41U2SUiMSTL9oJ99Wi1DDA3I6DG3HFCMRI0yeBBbgYnd4JFtw6r2H8/CJ2
         y3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KnU9TUwwhzNXEjbUZxMQhLTgc4VPnMrYLJg6nyxqlf8=;
        b=tPZ0pVk3PwAwqZThXzWqVDl4woEVeTkCKE3cszdp/7eYp13LYOL1bF1FbgInPUNH0a
         AnfCQ30bvzzgXngLwKdQvBsDAwHTxOnUAY5LPDYpZrg/GmZ7f9g705EVLbPBmk0EZg7G
         Tny5l3PpWQKs6xYojJjUoeJFTw4taXFOYgh41dgPdqPf2lw9rvmkVs1ZbTPxJMSfmwiu
         xC9B+7Bw9PGdlnsRTuysolX8PCx9BjDhLeXup/NsYud4gceLoKeTGMFgnYXDy5UWZdDl
         pAbIgdOkFAeIEhl/zO0YYeAsqK1izQXIo9HINOC45Qc10eeBBWWzxHtWOzHja/wtTmoD
         NcOQ==
X-Gm-Message-State: APjAAAWJIs9PTpR9LJ+bufib+FoAGOScx5WIvpNiHmzkvnOkOKiSKHLu
        SUkFiIjSN50DCxC8p5EI/nmxtel/
X-Google-Smtp-Source: APXvYqzD+svfpBJFC9ZN3h2V6BmhM2vGF1YX3zsk6VwSM80NBdw14o3fBTEo6atpkK1K+uhn8AXY7A==
X-Received: by 2002:a6b:1682:: with SMTP id 124mr416452iow.99.1568389044786;
        Fri, 13 Sep 2019 08:37:24 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id h3sm19780842iol.73.2019.09.13.08.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 08:37:23 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     adam.ford@logicpd.com, nm@ti.com, hns@goldelico.com,
        Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC v2 1/2] ARM: dts: omap3: Add cpu trips and cooling map for omap3 family
Date:   Fri, 13 Sep 2019 10:37:13 -0500
Message-Id: <20190913153714.30980-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The OMAP3530, AM3517 and DM3730 all show thresholds of 90C and 105C
depending on commercial or industrial temperature ratings.  This
patch expands the thermal information to the limits of 90 and 105
for alert and critical.

For boards who never use industrial temperatures, these can be
changed on their respective device trees with something like:

&cpu_alert0 {
	temperature = <85000>; /* millicelsius */
};

&cpu_crit {
	temperature = <90000>; /* millicelsius */
};

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Change the CPU reference to &cpu instead of &cpu0

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
-- 
2.17.1

