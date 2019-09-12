Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B38B7B146E
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2019 20:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbfILSav (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Sep 2019 14:30:51 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:46498 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbfILSau (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Sep 2019 14:30:50 -0400
Received: by mail-io1-f65.google.com with SMTP id d17so35222651ios.13;
        Thu, 12 Sep 2019 11:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=mZC7pXGu1qT+F+Mq64PPbUxImuBhl3ZWzMgjPcWRv1I=;
        b=e0WfDTx16CLEoSBy/3fiIR03RqbzvAiglsH52t970LcLPbhe8lqs8+vV7FVCfytT4O
         y1vDYSDLdY0FfCG3msZYM6Qv8q8BVFA6NHtZ8C3RlqMejRiFseSGqpZUxGrMCMTZwjkK
         Y0/sFzpel7WDQlKkQNvOQBw4phT2s10M8mabkO8ieGRVuUfOpYduXhgtlY9j3qipFDuF
         Qk5Q1WBmN23cRHV8pVg/aqmdAvtT5O/GzJKLdG/lJSWTREHZq5sG8KO5DRWhadqWspH3
         iA73OVBHgf63bX8Z9TsIPa0poZlENqHwCOn2j8p4eRnyV1sDq6bxF4d/kwY/8CgfihxO
         dckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mZC7pXGu1qT+F+Mq64PPbUxImuBhl3ZWzMgjPcWRv1I=;
        b=jISrwselFVo81SUwqVfiN5NifMd9wfJFDWdBSTb1r6tjgCwoNFc6cMHGHVVkJquSgE
         QZ/R+AGHXv2SlHZE10OjWvswmzm5WNrV79Wo6BXQuC8GfPkzoS4urP9ysZJUKEkueyDj
         cPb3FJ0LQd0xL8/Ioj2HeKcos2ArSxoP9RObyS5FYogcYz6b0k+B6/pn8vwQc4r3WTjH
         XyHjQ07Dto5ZGSGf19dN0ahNeIChlj7uy/w2D7wolq8AcRInEl2Re3hVGIVEQPv6HZ5m
         vd3UC3Rvr2/3sR0RmYWhlDdzrGxJrxDJrW40uGxUogztF0lLzGfuyCN+YUqrA1jvG35q
         6mYg==
X-Gm-Message-State: APjAAAXVUpbBSnV6QgyEWd7MraJdaJU9VzRQJ5y2scDx90I9TXcF7y0q
        RKhvqTTmZRmOKRuwCOFlq1o/AYZoyq0=
X-Google-Smtp-Source: APXvYqx7lsIdpsP6HV/3/J6qGakWdISq6NhXFQCIREvQL0MvxIArSJRD6Hiy/g14GLaINB5IhSjntQ==
X-Received: by 2002:a5e:c644:: with SMTP id s4mr3382341ioo.36.1568313049479;
        Thu, 12 Sep 2019 11:30:49 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id c4sm20003578ioa.76.2019.09.12.11.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 11:30:48 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     hns@goldelico.com, tony@atomide.com, neolynx@gmail.com,
        letux-kernel@openphoenux.org, linux-kernel@vger.kernel.org,
        andreas@kemnade.info, nm@ti.com, adam.ford@logicpd.com,
        Adam Ford <aford173@gmail.com>
Subject: [RFC] ARM: dts: omap36xx: Enable thermal throttling
Date:   Thu, 12 Sep 2019 13:30:37 -0500
Message-Id: <20190912183037.18449-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The thermal sensor in the omap3 family isn't accurate, but it's
better than nothing.  The various OPP's enabled for the omap3630
support up to OPP1G, however the datasheet for the DM3730 states
that OPP130 and OPP1G are not available above TJ of 90C.

This patch configures the thermal throttling to limit the
operating points of the omap3630 to Only OPP50 and OPP100 if
the thermal sensor reads a value above 90C.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.dtsi
index 4bb4f534afe2..58b9d347019f 100644
--- a/arch/arm/boot/dts/omap36xx.dtsi
+++ b/arch/arm/boot/dts/omap36xx.dtsi
@@ -25,6 +25,7 @@
 
 			vbb-supply = <&abb_mpu_iva>;
 			clock-latency = <300000>; /* From omap-cpufreq driver */
+			#cooling-cells = <2>;
 		};
 	};
 
@@ -195,6 +196,31 @@
 	};
 };
 
+&cpu_thermal {
+	cpu_trips: trips {
+		/* OPP130 and OPP1G are not available above TJ of 90C. */
+		cpu_alert0: cpu_alert {
+			temperature = <90000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "passive";
+		};
+
+		cpu_crit: cpu_crit {
+			temperature = <125000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "critical";
+		};
+	};
+
+	cpu_cooling_maps: cooling-maps {
+		map0 {
+			trip = <&cpu_alert0>;
+			/* Only allow OPP50 and OPP100 */
+			cooling-device = <&cpu 0 1>;
+		};
+	};
+};
+
 /* OMAP3630 needs dss_96m_fck for VENC */
 &venc {
 	clocks = <&dss_tv_fck>, <&dss_96m_fck>;
-- 
2.17.1

