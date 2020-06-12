Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A7781F7828
	for <lists+linux-omap@lfdr.de>; Fri, 12 Jun 2020 14:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbgFLMxd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 12 Jun 2020 08:53:33 -0400
Received: from a80-127-99-228.adsl.xs4all.nl ([80.127.99.228]:52328 "EHLO
        hetgrotebos.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726085AbgFLMxd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 12 Jun 2020 08:53:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
         s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=88k7VznXwntBsfIcECn4Bn66c20yCtluMZj15PpGTT0=; b=n9xCzWBIjUliFxUGk9LFXu+0OI
        YO+hTAV3pbeJOqx1E/J+t+QR/aWWrM53GxZxn3vwpM++pNQs5gCRAFEfTujU2Y4TEjWU97pC7g8U3
        75yXadbinIQ1SPyWdfFvnsDoU7SHKI4+HjsjwBPWwjvW1PVxj5eX7drsIz9HnNqrpE110LacAH23M
        rrfrO8QhRQZmJC8zk2Kq63OHtFJpT8Ve7QOgmmFVcpIjOAncP1IYqEbinpBoGpLtCkl8NuJvs6o+T
        8oegnvJ0UHmAT7+g+R4GWPxAkrQYv35/vtiZr5/NzhQDM2DGyxT/+3DCSl/sPI2Fp4sTy5KVwmFEP
        aQLgaIVA==;
Received: from kgpe-d16.fritz.box ([192.168.178.62])
        by hetgrotebos.org with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <merlijn@wizzup.org>)
        id 1jjjBF-0007uZ-7z; Fri, 12 Jun 2020 12:53:09 +0000
From:   Merlijn Wajer <merlijn@wizzup.org>
Cc:     pavel@ucw.cz, Merlijn Wajer <merlijn@wizzup.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tony Lindgren <tony@atomide.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Borislav Petkov <bp@suse.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mattias Jacobsson <2pi@mok.nu>,
        Mark Gross <mgross@linux.intel.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        linux-omap@vger.kernel.org (open list:OMAP DEVICE TREE SUPPORT),
        devicetree@vger.kernel.org (open list:OMAP DEVICE TREE SUPPORT),
        linux-kernel@vger.kernel.org (open list),
        linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK
        , TOUCHSCREEN)...)
Subject: [PATCH 1/2] Input: add `SW_MACHINE_COVER`
Date:   Fri, 12 Jun 2020 14:53:58 +0200
Message-Id: <20200612125402.18393-2-merlijn@wizzup.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200612125402.18393-1-merlijn@wizzup.org>
References: <20200612125402.18393-1-merlijn@wizzup.org>
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
Acked-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Merlijn Wajer <merlijn@wizzup.org>
---
 include/linux/mod_devicetable.h        | 2 +-
 include/uapi/linux/input-event-codes.h | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 0754b8d71262..8a84f11bf124 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -318,7 +318,7 @@ struct pcmcia_device_id {
 #define INPUT_DEVICE_ID_LED_MAX		0x0f
 #define INPUT_DEVICE_ID_SND_MAX		0x07
 #define INPUT_DEVICE_ID_FF_MAX		0x7f
-#define INPUT_DEVICE_ID_SW_MAX		0x0f
+#define INPUT_DEVICE_ID_SW_MAX		0x10
 #define INPUT_DEVICE_ID_PROP_MAX	0x1f
 
 #define INPUT_DEVICE_ID_MATCH_BUS	1
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index b6a835d37826..0c2e27d28e0a 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -888,7 +888,8 @@
 #define SW_LINEIN_INSERT	0x0d  /* set = inserted */
 #define SW_MUTE_DEVICE		0x0e  /* set = device disabled */
 #define SW_PEN_INSERTED		0x0f  /* set = pen inserted */
-#define SW_MAX			0x0f
+#define SW_MACHINE_COVER	0x10  /* set = cover closed */
+#define SW_MAX			0x10
 #define SW_CNT			(SW_MAX+1)
 
 /*
-- 
2.24.1

