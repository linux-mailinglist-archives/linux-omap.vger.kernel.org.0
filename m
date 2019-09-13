Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC361B2462
	for <lists+linux-omap@lfdr.de>; Fri, 13 Sep 2019 18:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730421AbfIMQte (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Sep 2019 12:49:34 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:45658 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729293AbfIMQte (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Sep 2019 12:49:34 -0400
Received: by mail-io1-f68.google.com with SMTP id f12so63941884iog.12;
        Fri, 13 Sep 2019 09:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=P/0+gdjpplcC13gJqGlr19O2NEwJcpegNILvvw0PWSI=;
        b=hvAK0gk9/rsGf1DZtkSiqnWGDR7A2QJf2jrTq2owenTp5ZPxSGNIueBPldEXz/hRIQ
         sXlLgmr7WsCjqsec4IcHQBPWS1Q9Oz2m50eh7ex6a0zDRZLyoNV9ltpPhdf65YgSA4Xz
         m6IjToc2hi/9hTtDOXksQBbqNMQ2iCVf6jz1I7ODQlKFg+NlgoXO7TND3IZHVC+uBBj3
         dHttUaP07K5kHi9V8muG5i6CWR2yXSPRyf/DUPIoUDAzPny//YpWKvBpobLXkCIfxYFw
         KyFpXm+WPS25yj0g287w44o1RAKtMDzk/Hya89wZxdgecqUVcx4C16oBpVHC6n09pHeX
         B5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=P/0+gdjpplcC13gJqGlr19O2NEwJcpegNILvvw0PWSI=;
        b=H22Dvr9h94DnWA6D+3zJbOryphgZIDiF5suEHXbQ6zWxPzT2fmlqNYPktEREu9XShF
         ZQJObJz+6oFJXD7tbCTAtT8rvuauORy5r/vqEAnvdqnSnU7KiI3CfufihXNN84+I0d9D
         YpL/wX9g7m/WS8EE1utaNzEorOTNq9RHo1BZWHCMBubtXwJaZ6/4NENX7ohOolgbfkjF
         IUj7UQETazj/JgcNnXz5W7NNuR0Q1Zjt3Ai8sGqeupoRI8zVx9lmzEO0qvG/XjU78k7E
         D8o68sta129Is2QL6LbWPlhte/qCIrtkwmka1uFEICQO6pdlDGVvKc78LpV0HdFOwyM4
         zohw==
X-Gm-Message-State: APjAAAVsusLVdfe8V3HtGeQ+84p1+lfVQHnA18qhenE69TMo7egoa05M
        Xkh3whFiYMw8alY+PVnLQMFkl21t2yM=
X-Google-Smtp-Source: APXvYqwQx/NLDa1Er/iMTPGAPeXawmGOw4E621+bliLv5p9UywKvec+7Ct+VllG/pQZTKrQeNwmZ3A==
X-Received: by 2002:a6b:b445:: with SMTP id d66mr885791iof.269.1568393372754;
        Fri, 13 Sep 2019 09:49:32 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id y17sm22487252ioa.52.2019.09.13.09.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 09:49:32 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     neolynx@gmail.com, letux-kernel@openphoenux.org,
        andreas@kemnade.info, tony@atomide.com, adam.ford@logicpd.com,
        hns@goldelico.com, Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC v2] ARM: dts: omap36xx: Enable thermal throttling
Date:   Fri, 13 Sep 2019 11:49:19 -0500
Message-Id: <20190913164919.4565-1-aford173@gmail.com>
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

When forcing the high-temperature state, the scaling_max_freq
returns a value that corresponds to OPP100 showing that
OPP130 and OPP1G are not available.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Rebase after moving thermal info into a common omap3.
     This now only changes the cooling-device reference to remove the fastest
     two OPP's
     
diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.dtsi
index 77e9fcf60ba7..d8ba513f3deb 100644
--- a/arch/arm/boot/dts/omap36xx.dtsi
+++ b/arch/arm/boot/dts/omap36xx.dtsi
@@ -219,6 +219,13 @@
 	};
 };
 
+&cpu_cooling_maps {
+	map0 {
+		/* OPP130 and OPP1G are not available above 90C */
+		cooling-device = <&cpu 1 2>;
+	};
+};
+
 /* OMAP3630 needs dss_96m_fck for VENC */
 &venc {
 	clocks = <&dss_tv_fck>, <&dss_96m_fck>;
-- 
2.17.1

