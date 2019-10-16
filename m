Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85D32D9306
	for <lists+linux-omap@lfdr.de>; Wed, 16 Oct 2019 15:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405606AbfJPNwU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Oct 2019 09:52:20 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:38345 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405597AbfJPNwS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 16 Oct 2019 09:52:18 -0400
Received: by mail-il1-f194.google.com with SMTP id y5so2670429ilb.5;
        Wed, 16 Oct 2019 06:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tddk5aNBbKCrf3Fe8pk7EXB/w7qFIAJSPZblsSzkzAM=;
        b=kTcMabWGqmRCfYcYJhOVUHGGartS+59ZQ56ld4laMvfK65ghicCYqQEvJ+MdfNZFKt
         y6MSu97f9Fj6D3ZqFoqpOn13J+olCrcN4xcPwIZrRnHAs5pP5JtNtpBTAl0609P/63Z3
         AiMvkCNmszBXcI5rPr56HjpXCVKKzPDSD0R3lSXcw0E5ogDMhERdt/QqGXiZ3GKsK9Ed
         j+QDu017oT1mSDeo50Yb947NFuBW1MiB/n5ed3UqI3kbEzyqdZtVkAhavahAEDohgPDm
         MLCUEu2iHWwEMp1QrZwHONybXqpAhfqYve8ZJvDseafG5u3CeLDsDC9hujkteBCDur6N
         pOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tddk5aNBbKCrf3Fe8pk7EXB/w7qFIAJSPZblsSzkzAM=;
        b=LMkn9HMqexsuVkqh/8Tcqe2BeWHx+DKPjOxYI09t04RUOVL7H8Oa94A7L0yxA5i+uq
         vwBYzAnTm8pZhBws6Nmf01cLmBkUvrzstS+uC+BkYHICS6dGka3T8oRcCA+rP3z2q/Gs
         JnFMqbFLNFMi/DN5YSiRbAsQFWDjoeSGw/GU/VzV44ztoLgGfjmwlcfAgsPXolM3YIZk
         E4DD2X1DJH/zbK4i2CgRsEHZ4O+WxuhNCsJBSE3hI06J2fxO8/y4V+7oqbomVlZaBXI6
         W6uF5JiEg1sRRsXWuE+7DvpETqZ68ktPoWshsUqo8lzBULGX25ab1ACBFJ+QmZlIbGyM
         X4mg==
X-Gm-Message-State: APjAAAVXb7pHe3MEqBO2G115zu4OR/9SUeM+ty9kNP8tP3JiOeT5uN3S
        61co8e2iWQY02Qe7T9j6Vp8=
X-Google-Smtp-Source: APXvYqxfffYQGm7jczNh9MwYJUxP6Nn83rdo7ZuYmUEPfLGieQVEeLob/zjOrNMikp4xn1sZnO/d0g==
X-Received: by 2002:a92:5f4c:: with SMTP id t73mr11861707ilb.220.1571233936326;
        Wed, 16 Oct 2019 06:52:16 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id e139sm17227545iof.60.2019.10.16.06.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2019 06:52:15 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-omap@vger.kernel.org, Adam Ford <aford173@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V5 3/3] ARM: logicpd-torpedo-37xx-devkit-28: Reference new DRM panel
Date:   Wed, 16 Oct 2019 08:51:47 -0500
Message-Id: <20191016135147.7743-3-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191016135147.7743-1-aford173@gmail.com>
References: <20191016135147.7743-1-aford173@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

With the removal of the panel-dpi from the omap drivers, the
LCD no longer works.  This patch points the device tree to
a newly created panel named "logicpd,type28"

Fixes: 8bf4b1621178 ("drm/omap: Remove panel-dpi driver")

Signed-off-by: Adam Ford <aford173@gmail.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
V5:  No Change
V4:  No Change
V3:  No change
V2:  Remove legacy 'label' from binding

diff --git a/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit-28.dts b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit-28.dts
index 07ac99b9cda6..cdb89b3e2a9b 100644
--- a/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit-28.dts
+++ b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit-28.dts
@@ -11,22 +11,6 @@
 #include "logicpd-torpedo-37xx-devkit.dts"
 
 &lcd0 {
-
-	label = "28";
-
-	panel-timing {
-		clock-frequency = <9000000>;
-		hactive = <480>;
-		vactive = <272>;
-		hfront-porch = <3>;
-		hback-porch = <2>;
-		hsync-len = <42>;
-		vback-porch = <3>;
-		vfront-porch = <2>;
-		vsync-len = <11>;
-		hsync-active = <1>;
-		vsync-active = <1>;
-		de-active = <1>;
-		pixelclk-active = <0>;
-	};
+	/* To make it work, set CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=4 */
+	compatible = "logicpd,type28";
 };
-- 
2.17.1

