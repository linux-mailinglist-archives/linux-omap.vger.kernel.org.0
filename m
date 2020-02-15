Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BB4B15FF62
	for <lists+linux-omap@lfdr.de>; Sat, 15 Feb 2020 18:01:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbgBORAe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 15 Feb 2020 12:00:34 -0500
Received: from a80-127-99-228.adsl.xs4all.nl ([80.127.99.228]:45178 "EHLO
        hetgrotebos.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726209AbgBORAe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 15 Feb 2020 12:00:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
         s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=xuSqKQckl8muEwKshU/FzUtts9aWAxkpxm3IlAs7oE0=; b=i3pOjcr07cSYOV1hufyJQR5jBO
        qSSk62inBHZ1/2kXDe1fQDwqRaFLJjuecxX/PR5NaaEraMc2KcGTiHKfYc6ORw4xPDTZv0pBSawnl
        mETCSN56iH0aKVUguFcI6+T3Vc+wNqGOFU+AI1K3x96M43uX7lhy5zrQ0f2sEa6wufOQnYu5mUbXg
        x6/gZVYOlsk/UJhlhaf9uYuwRujJGr01+IK4EAfJnpBKc8I4Azziy94WRtNY0ACljEkHOU5jox/uK
        CTJyfb1evVRnV95CeRflGw02/rglMf2Q+NZuqjKmu6hu4yTrxVg+EAf8Og+o9SbgvBlOW+CctTOUP
        7LB2oAjw==;
Received: from kgpe-d16.fritz.box ([192.168.178.22])
        by hetgrotebos.org with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <merlijn@wizzup.org>)
        id 1j30ni-00037p-CU; Sat, 15 Feb 2020 17:00:18 +0000
From:   Merlijn Wajer <merlijn@wizzup.org>
Cc:     Merlijn Wajer <merlijn@wizzup.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Darren Hart (VMware)" <dvhart@infradead.org>,
        Mattias Jacobsson <2pi@mok.nu>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH 1/2] Input: add `SW_MACHINE_COVER`
Date:   Sat, 15 Feb 2020 18:02:14 +0100
Message-Id: <20200215170216.14397-2-merlijn@wizzup.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200215170216.14397-1-merlijn@wizzup.org>
References: <20200215170216.14397-1-merlijn@wizzup.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This event code represents the state of a removable cover of a device.
Value 0 means that the cover is open or removed, value 1 means that the
cover is closed.

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Merlijn Wajer <merlijn@wizzup.org>
---
 include/linux/mod_devicetable.h        | 2 +-
 include/uapi/linux/input-event-codes.h | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 448621c32e4d..4c692cb3cc1d 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -299,7 +299,7 @@ struct pcmcia_device_id {
 #define INPUT_DEVICE_ID_LED_MAX		0x0f
 #define INPUT_DEVICE_ID_SND_MAX		0x07
 #define INPUT_DEVICE_ID_FF_MAX		0x7f
-#define INPUT_DEVICE_ID_SW_MAX		0x0f
+#define INPUT_DEVICE_ID_SW_MAX		0x10
 #define INPUT_DEVICE_ID_PROP_MAX	0x1f
 
 #define INPUT_DEVICE_ID_MATCH_BUS	1
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 64cee116928e..68f8ad8377a1 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -807,7 +807,8 @@
 #define SW_LINEIN_INSERT	0x0d  /* set = inserted */
 #define SW_MUTE_DEVICE		0x0e  /* set = device disabled */
 #define SW_PEN_INSERTED		0x0f  /* set = pen inserted */
-#define SW_MAX			0x0f
+#define SW_MACHINE_COVER	0x10 /* set = cover closed */
+#define SW_MAX			0x10
 #define SW_CNT			(SW_MAX+1)
 
 /*
-- 
2.23.0

