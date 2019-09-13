Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85D56B22F1
	for <lists+linux-omap@lfdr.de>; Fri, 13 Sep 2019 17:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390365AbfIMPEm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Sep 2019 11:04:42 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:33703 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390776AbfIMPEl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Sep 2019 11:04:41 -0400
Received: by mail-io1-f66.google.com with SMTP id m11so63232807ioo.0;
        Fri, 13 Sep 2019 08:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9ZP/Cjz5nuXxOg1voLEZxP2+QDCNebXAWsZl8UUvuq4=;
        b=AfilKKGA48bLBjgGL6hLXwP8zdvJamJtbYFPFD7Zk4/S4aPKwslFF6KPQZJ/MXDF4A
         YTK+g90ufqv2o8ZvAfAZ1HYJp8Um9fl1EMoZFTbcStI3mKFYQNanTs5TLnJRnCV52yls
         69432gv/VwZfHcDVAWIcWGEsybpNXGdDirWZ7Tr5YeV4dPblQeCGLYvnMdudP6mxedE1
         0Q2TD6RavpUCzHqdAL5QyCuLFSORiWxjA6I7bcMUgJ39epmk0pkixwSslXEVmbP5kI1V
         dBh5NDnmIKjyt9i0qNmfmryt5IaZvd23up9Lh0fBpRXP+fBjuSeoRLIfrTJlXZpR35uk
         zEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9ZP/Cjz5nuXxOg1voLEZxP2+QDCNebXAWsZl8UUvuq4=;
        b=THCLpI21ewb94PRECciMyeznOR2XxlrfxgGFJj8oCqlVQRz3HnJzCUqbagJgMAcqmB
         eChQhJcGjOkRDVXacRMEINTD2Q/tte9SciwVwuWk/IeOhMOATjvjEr+rlPvcvFXp4ZB3
         RzPOzQki0SdnlhRBVt0jfzB1FLeeGres+aiTPS1AsoQ+lv51gTq31+I8oj6DcpEwULaF
         Wrr2LSYV4gCr2itH6NEpUfG0ScEfW90bFyoBZKrFuTuuq/34mqjySQMwedilIwRE2S2D
         TmSS9xfGWOhKTpubWsJsR9CPM3K6YjK9WV/18SYrNYpiHDcg5j1ngk2T6lj4cJlyVE13
         492Q==
X-Gm-Message-State: APjAAAVF+j+ZdASXruq4fFzbz6NLQ2SQT6ICagf4F/2jwxkQrQRiVjV7
        lY7UBcr0NrPufvSBZL8lI0v6B0yA
X-Google-Smtp-Source: APXvYqy8J968bNlINj+k8YEhHWGW+EfTEOM4VvtYx9iZxuxBczTobmD2/pDShQeU2ujiC9gOZrX2/g==
X-Received: by 2002:a6b:e501:: with SMTP id y1mr284295ioc.127.1568387080238;
        Fri, 13 Sep 2019 08:04:40 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id q8sm19169414ion.82.2019.09.13.08.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 08:04:39 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     adam.ford@logicpd.com, nm@ti.com, hns@goldelico.com,
        Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC 2/2] ARM: omap3: Consolidate thermal references to common omap3
Date:   Fri, 13 Sep 2019 10:04:09 -0500
Message-Id: <20190913150410.27391-2-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190913150410.27391-1-aford173@gmail.com>
References: <20190913150410.27391-1-aford173@gmail.com>
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

diff --git a/arch/arm/boot/dts/omap3.dtsi b/arch/arm/boot/dts/omap3.dtsi
index 4043ecb38016..db9cafddbe69 100644
--- a/arch/arm/boot/dts/omap3.dtsi
+++ b/arch/arm/boot/dts/omap3.dtsi
@@ -44,6 +44,10 @@
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

