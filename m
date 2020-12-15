Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55FDC2DADB3
	for <lists+linux-omap@lfdr.de>; Tue, 15 Dec 2020 14:08:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728701AbgLONGr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 15 Dec 2020 08:06:47 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:60670 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729385AbgLONGp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 15 Dec 2020 08:06:45 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFD4GFF053267;
        Tue, 15 Dec 2020 07:04:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1608037456;
        bh=g5hfBmYSZ8Ze0r6Z6Oo1TRt7JEjW9VDWbA/XiqpERKQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=vQkp89D5LJrJ6MreL1xb6UFgCsdWAbBV908vl1vaESMQ2BvHuzyXgtOKHxCuejkLH
         lQ17atqT5z9OHbhUwfT/kfyLYfLKqfZBbWOSJ5aC/DlHAf7ypy3VG7BmsgyG3210HH
         AqDEMQDzy65ZHeL2m3X9ThfINE1KokRczdKkJePA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFD4Gqf035477
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 15 Dec 2020 07:04:16 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 07:04:15 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 07:04:15 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFD49vL024224;
        Tue, 15 Dec 2020 07:04:13 -0600
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <jarkko.nikula@bitmer.com>, <robh+dt@kernel.org>
CC:     <alsa-devel@alsa-project.org>, <perex@perex.cz>, <tiwai@suse.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jsarha@ti.com>
Subject: [PATCH 1/2] MAINTAINERS: Update email address for TI ASoC and twl4030 codec drivers
Date:   Tue, 15 Dec 2020 15:05:11 +0200
Message-ID: <20201215130512.8753-2-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215130512.8753-1-peter.ujfalusi@ti.com>
References: <20201215130512.8753-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

My employment with TI is coming to an end, it is my intention to look after
the drivers I have worked with over the years.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f6e7162241eb..a091f183b27f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12862,7 +12862,7 @@ F:	include/misc/ocxl*
 F:	include/uapi/misc/ocxl.h
 
 OMAP AUDIO SUPPORT
-M:	Peter Ujfalusi <peter.ujfalusi@ti.com>
+M:	Peter Ujfalusi <peter.ujfalusi@gmail.com>
 M:	Jarkko Nikula <jarkko.nikula@bitmer.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 L:	linux-omap@vger.kernel.org
@@ -17537,7 +17537,7 @@ F:	arch/xtensa/
 F:	drivers/irqchip/irq-xtensa-*
 
 TEXAS INSTRUMENTS ASoC DRIVERS
-M:	Peter Ujfalusi <peter.ujfalusi@ti.com>
+M:	Peter Ujfalusi <peter.ujfalusi@gmail.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Maintained
 F:	sound/soc/ti/
@@ -17847,7 +17847,7 @@ F:	Documentation/devicetree/bindings/net/nfc/trf7970a.txt
 F:	drivers/nfc/trf7970a.c
 
 TI TWL4030 SERIES SOC CODEC DRIVER
-M:	Peter Ujfalusi <peter.ujfalusi@ti.com>
+M:	Peter Ujfalusi <peter.ujfalusi@gmail.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Maintained
 F:	sound/soc/codecs/twl4030*
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

