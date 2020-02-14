Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C01F15D7DE
	for <lists+linux-omap@lfdr.de>; Fri, 14 Feb 2020 14:01:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728895AbgBNNBG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 14 Feb 2020 08:01:06 -0500
Received: from a80-127-99-228.adsl.xs4all.nl ([80.127.99.228]:59470 "EHLO
        hetgrotebos.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728036AbgBNNBF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 14 Feb 2020 08:01:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
         s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=J/V7zkHQUUcwpBuxtuCDV4YxrtNB7KF4oGNQiKpJiEw=; b=nQGPPlyKanYjWB0RIjUWLuigHo
        dAooLceMvbxlBtLfNCvFCN6J5Pf79Wdb+eF/QgO+SpITbvqY8a6OIF02ie3nIrV9BJcDwPJ8kXQCx
        IC9lpsCXixEfELHoxeHHhxL2CgMB9d3StJKTNFGLF8LRsyhka8S+REvV/xJBobBh3NiTEc4gnybOS
        gUbZuBkL7qLPuxoL1V5qVCw3e+wIL/PfWkDcSBH12QYFz4wl8o3CNTvAkSluwIKP7o3b8d9Itieve
        m94MBywHCUiNv0ybq0pKJjsj6Zh4VkPV/vf9fx/UIkZObc7wvYgGsBpPk0k1m5gnC7KvFZoZDjT8A
        hI3gnZzQ==;
Received: from kgpe-d16.fritz.box ([192.168.178.22])
        by hetgrotebos.org with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <merlijn@wizzup.org>)
        id 1j2aaY-0002df-8z; Fri, 14 Feb 2020 13:00:58 +0000
From:   Merlijn Wajer <merlijn@wizzup.org>
To:     merlijn@wizzup.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mattias Jacobsson <2pi@mok.nu>,
        "Darren Hart (VMware)" <dvhart@infradead.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [RFC PATCH 1/2] Input: add `SW_MACHINE_COVER`
Date:   Fri, 14 Feb 2020 14:02:47 +0100
Message-Id: <20200214130249.6845-2-merlijn@wizzup.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200214130249.6845-1-merlijn@wizzup.org>
References: <20200214130249.6845-1-merlijn@wizzup.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This event code represents the state of a removable cover of a device.
Value 1 means that the cover is open or removed, value 0 means that the
cover is closed.

This can be used to preempt users removing a removable mmc card or even
the battery, allowing userspace to attempt to safely unmount a card.
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
index 64cee116928e..318a6387cdfb 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -807,7 +807,8 @@
 #define SW_LINEIN_INSERT	0x0d  /* set = inserted */
 #define SW_MUTE_DEVICE		0x0e  /* set = device disabled */
 #define SW_PEN_INSERTED		0x0f  /* set = pen inserted */
-#define SW_MAX			0x0f
+#define SW_MACHINE_COVER	 0x10 /* set = cover closed */
+#define SW_MAX			0x10
 #define SW_CNT			(SW_MAX+1)
 
 /*
-- 
2.23.0

