Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 151DE2C2670
	for <lists+linux-omap@lfdr.de>; Tue, 24 Nov 2020 13:49:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387713AbgKXMsr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Nov 2020 07:48:47 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55634 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732709AbgKXMsr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Nov 2020 07:48:47 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCmfem123955;
        Tue, 24 Nov 2020 06:48:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606222121;
        bh=6pxAuwh2rEUpMWHQpRYHq3mchGyYZZkbH3pFsYg68iQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=d7A+uycajV+0QZIxRNzwuBfyjH3oyp09ludMYnfxlGkXKtFa7tpiAz42MauYTBcgI
         OKqg3yhkjrST2H7ViZHQaimavYKLuqNL0hJ7KF2q62y2CUcuYg/wK1EbCkvj5Dx4Hz
         ycF2eTE3WwPT7shdIwjKxIaMhc5OFVlL0v55a0rs=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCmfbo109449
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Nov 2020 06:48:41 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:48:41 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:48:41 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmpx040922;
        Tue, 24 Nov 2020 06:48:39 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v4 70/80] drm/panel: panel-dsi-cm: drop unneeded includes
Date:   Tue, 24 Nov 2020 14:45:28 +0200
Message-ID: <20201124124538.660710-71-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124124538.660710-1-tomi.valkeinen@ti.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Drop unneeded includes.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/panel/panel-dsi-cm.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
index ec87b785871f..91ed8237a1c2 100644
--- a/drivers/gpu/drm/panel/panel-dsi-cm.c
+++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
@@ -9,12 +9,7 @@
 #include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
-#include <linux/interrupt.h>
 #include <linux/jiffies.h>
-#include <linux/module.h>
-#include <linux/sched/signal.h>
-#include <linux/slab.h>
-#include <linux/of_device.h>
 #include <linux/regulator/consumer.h>
 
 #include <drm/drm_connector.h>
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

