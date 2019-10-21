Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F552DF742
	for <lists+linux-omap@lfdr.de>; Mon, 21 Oct 2019 23:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729869AbfJUVFq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Oct 2019 17:05:46 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:38819 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727264AbfJUVFq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 21 Oct 2019 17:05:46 -0400
Received: by mail-io1-f67.google.com with SMTP id u8so17692800iom.5
        for <linux-omap@vger.kernel.org>; Mon, 21 Oct 2019 14:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=imduOihtXsd/jXJ4KplV3KvTOJ6++Qe48vgO694uNsI=;
        b=ln0g/ofbxyxYFmuZdVHno6F0BTMoGtmh3jvg/46Ljmz/cGcMEpGpPOstCYSJ8yQHl8
         FGARAM/S3Ow4QfajTvp2F0mOzhwUllkskvZ5dAz6bvRxzBhL8dg8RKWB9VK8EC/ILBl/
         5UrtYiwwzfk4u9GumgnJn61ND7lg4Ga/zDCmr91KAwBC0FrXqz6Y71k/JsuLibi6q9DD
         nfiMdglp8Yop2VtTBTxk8mQ4QbiODEsHzQLmn99b7TBVM4P+UWow7ZWE9ubxiDx7zkgm
         7RQzF59n3BDYX2G2Nto7ZU8yUUrJhPQotP7h1nyR7CBt4v4Gm0hBH5tSYVPhM2zQXwfa
         KWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=imduOihtXsd/jXJ4KplV3KvTOJ6++Qe48vgO694uNsI=;
        b=U805kuw0fgnIxg2aVk8SV8ekVJtPvOTn1/Y+o9UY/G057/BYJJZ07NbRF74AMmXVed
         inXL6F+hOAE6n0/bgG0GmXeAl+9xzsUbQuysg882zkj8pqDjzEdFQoPUe90ADmlvPmUL
         t3N8EWOF/u3tnM7+GWiAduDA9d+d33R7Njal5V0im3H/ZPIsYiHb67DMBC4yQgRDMqik
         C468hSrDEpr+ogD0HAuvcXA5gAI6XiC/NLZoHWL6doHDUe2N0Jb2LkA3P6SiAm/DzY1c
         9luGaodrlxV6ZctJZGzIWdrDVw4Rgy/naiU0hqOoP4hoC/l3jvdaUQzsZHqfaHKKQa+D
         bBMg==
X-Gm-Message-State: APjAAAX5q1BvhvdyxCGvx15OEw7NTdxsnFR9ZgX5VGQZm2iFQhvyq0Cv
        TI3IWCLOPSo0+nGKFprmlLb697MD
X-Google-Smtp-Source: APXvYqyRJ8kh/hdcgVGTib1PY3sK6cXssfHkZZvpm+G5d8tpVlhVPJdeL0hEfg8Gc30gCp+GAPz1sg==
X-Received: by 2002:a05:6638:60f:: with SMTP id g15mr324117jar.21.1571691944847;
        Mon, 21 Oct 2019 14:05:44 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id p19sm1006482ili.56.2019.10.21.14.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 14:05:44 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     adam.ford@logicpd.com, Adam Ford <aford173@gmail.com>
Subject: [PATCH] ARM: dts: logicpd-torpedo-37xx-devkit: Increase camera pixel clock
Date:   Mon, 21 Oct 2019 16:05:32 -0500
Message-Id: <20191021210532.1590-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The default settings used on the baseboard are good for the
OMAP3530 and are compatible with the DM3730.  However, the
DM3730 has a faster L3 clock which means the camera pixel clock
can also be pushed faster as well.

This patch increase the Pixel clock to 90MHz which is the
maximum the current ISP driver permits for an L3 clock
of 200MHz.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts
index 18c27e85051f..fc33c76498b3 100644
--- a/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts
+++ b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts
@@ -50,6 +50,11 @@
 	};
 };
 
+/* The DM3730 has a faster L3 than OMAP35, so increase pixel clock */
+&mt9p031_out {
+	pixel-clock-frequency = <90000000>;
+};
+
 &omap3_pmx_core {
 	mmc3_pins: pinmux_mm3_pins {
 		pinctrl-single,pins = <
-- 
2.17.1

