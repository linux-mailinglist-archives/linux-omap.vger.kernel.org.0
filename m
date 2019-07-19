Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4CDE6E08A
	for <lists+linux-omap@lfdr.de>; Fri, 19 Jul 2019 07:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbfGSFWK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 19 Jul 2019 01:22:10 -0400
Received: from muru.com ([72.249.23.125]:55306 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725794AbfGSFWK (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 19 Jul 2019 01:22:10 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D34C8809B;
        Fri, 19 Jul 2019 05:22:33 +0000 (UTC)
Date:   Thu, 18 Jul 2019 22:22:05 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@denx.de>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, johan@kernel.org,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: USB Modem support for Droid 4
Message-ID: <20190719052205.GK5447@atomide.com>
References: <20190718201713.GA25103@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190718201713.GA25103@amd>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Pavel Machek <pavel@denx.de> [190718 20:17]:
> From: Tony Lindgren <tony@atomide.com>
> 
> Droid starts to have useful support in linux-next. Modem is tricky to
> play with, but this is enough to get basic support.

Below is a better patch using option driver adding support for all
the ports. I'll send it out with a proper description after -rc1.

Regards,

Tony

8< ----------------
diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -83,6 +83,12 @@ static void option_instat_callback(struct urb *urb);
 #define HUAWEI_PRODUCT_K4605			0x14C6
 #define HUAWEI_PRODUCT_E173S6			0x1C07
 
+#define MOTOROLA_VENDOR_ID			0x22b8
+#define MOTOROLA_PRODUCT_MDM6600		0x2a70
+#define MOTOROLA_PRODUCT_MDM9600		0x2e0a
+#define MOTOROLA_PRODUCT_MDM_RAM_DL		0x4281
+#define MOTOROLA_PRODUCT_MDM_QC_DL		0x900e
+
 #define QUANTA_VENDOR_ID			0x0408
 #define QUANTA_PRODUCT_Q101			0xEA02
 #define QUANTA_PRODUCT_Q111			0xEA03
@@ -968,6 +974,10 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x7B) },
 	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x7C) },
 
+	{ USB_DEVICE_AND_INTERFACE_INFO(MOTOROLA_VENDOR_ID, MOTOROLA_PRODUCT_MDM6600, 0xff, 0xff, 0xff) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(MOTOROLA_VENDOR_ID, MOTOROLA_PRODUCT_MDM9600, 0xff, 0xff, 0xff) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(MOTOROLA_VENDOR_ID, MOTOROLA_PRODUCT_MDM_RAM_DL, 0x0a, 0x00, 0xfc) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(MOTOROLA_VENDOR_ID, MOTOROLA_PRODUCT_MDM_QC_DL, 0xff, 0xff, 0xff) },
 
 	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_V640) },
 	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_V620) },
