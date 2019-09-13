Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B45A1B22ED
	for <lists+linux-omap@lfdr.de>; Fri, 13 Sep 2019 17:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390552AbfIMPEl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Sep 2019 11:04:41 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:44741 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390365AbfIMPEk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Sep 2019 11:04:40 -0400
Received: by mail-io1-f65.google.com with SMTP id j4so63191644iog.11;
        Fri, 13 Sep 2019 08:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=pxzm0Da2RMICbYeB3ji5PIHGS0/dwIlS+lqwiNEvwqk=;
        b=mZ5Y2T4kUU6YtTmXJmEe0RSeHEYEsHWkf2QZgVBonzWm/eI6fTGnhyk6uqKiwQVJBZ
         wx1XUa4SB4I3pJ+7XEfiJRUmc1kj0NPtKRvzqz7cRLKAob1TDKAqlXby0IlO7jXnZBaE
         xoWXKinpKxOVYW4rm3gZ/r/bDTHmZRaU/FzD6PJ7ME+yQtSR1qYuM44EkBb8S0Gsisky
         7i/JcdJUADKlzUeddV7gKns/eWg9JJZYkogYQbQDC/0DUcHCQMZqNlfNpXe3BfqTsnZ2
         0eMakF/aZmqde2d8mZnekHjWpn9QYwh7fF2whvYQvRmBHvPyiLSWLlm208kAGESC0qX/
         NKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=pxzm0Da2RMICbYeB3ji5PIHGS0/dwIlS+lqwiNEvwqk=;
        b=EMUZoUsA3jR4Jexlpdfm6+Dy3m7XwfhA/cBl3kCDWkaKUx6pSJ38JImJrTbcY+S43r
         nmWEEVQfr9lvScg2aENVXXrwiJjziU+sbq3Nxv8kiki96M3pLU0k0QawfdOCxEhklIan
         XHinHJTdwvqgpxsk2Ydqy72MC54pddvpmN6RatzAiLkkgDFLYc7pkpdEjDlmeGrfcrmj
         xD5tN46VwcXzH+FrOgD3pVFl6DvE+6NWgGC3yixDkwKv/qv9e7YxdIPuRFatc6UYDs6g
         yqd7uEH6aZ1IA+oRIOqI/47EmZSdmP0+H1HebpzCxWDyA98KVZcR0qLBf/L+4VksIQGi
         sBBA==
X-Gm-Message-State: APjAAAUXevT6Snd9WRTF4OwTeyOYahNWR10CCNDApNKNyNuNCpt3Seh1
        KvJGkqBuS+qSQd/Rqwv5QF3ShLZg
X-Google-Smtp-Source: APXvYqyvnUxMPxTaMhLG0wey5/qLTAyik7SBioh2C0zRMy7EmsX+0kPiTQ9ClGLu405lwitix1JYtg==
X-Received: by 2002:a6b:5f11:: with SMTP id t17mr305475iob.169.1568387078505;
        Fri, 13 Sep 2019 08:04:38 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id q8sm19169414ion.82.2019.09.13.08.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 08:04:37 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     adam.ford@logicpd.com, nm@ti.com, hns@goldelico.com,
        Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC 1/2] ARM: dts: omap3: Add cpu trips and cooling map for omap3 family
Date:   Fri, 13 Sep 2019 10:04:08 -0500
Message-Id: <20190913150410.27391-1-aford173@gmail.com>
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

diff --git a/arch/arm/boot/dts/omap3-cpu-thermal.dtsi b/arch/arm/boot/dts/omap3-cpu-thermal.dtsi
index 235ecfd61e2d..11452590ea85 100644
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
+				<&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
 };
-- 
2.17.1

