Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C9F72D7259
	for <lists+linux-omap@lfdr.de>; Fri, 11 Dec 2020 09:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437195AbgLKIyx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Dec 2020 03:54:53 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9164 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437143AbgLKIyt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Dec 2020 03:54:49 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Csl1m5K8cz15bBF;
        Fri, 11 Dec 2020 16:53:32 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Fri, 11 Dec 2020 16:53:59 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] usb: phy: convert comma to semicolon
Date:   Fri, 11 Dec 2020 16:54:28 +0800
Message-ID: <20201211085428.2871-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Replace a comma between expression statements by a semicolon.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/usb/phy/phy-isp1301-omap.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/phy/phy-isp1301-omap.c b/drivers/usb/phy/phy-isp1301-omap.c
index 4a6462c92ef2..6f4f74e6ba51 100644
--- a/drivers/usb/phy/phy-isp1301-omap.c
+++ b/drivers/usb/phy/phy-isp1301-omap.c
@@ -1566,13 +1566,13 @@ isp1301_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 
 	isp->phy.dev = &i2c->dev;
 	isp->phy.label = DRIVER_NAME;
-	isp->phy.set_power = isp1301_set_power,
+	isp->phy.set_power = isp1301_set_power;
 
 	isp->phy.otg->usb_phy = &isp->phy;
-	isp->phy.otg->set_host = isp1301_set_host,
-	isp->phy.otg->set_peripheral = isp1301_set_peripheral,
-	isp->phy.otg->start_srp = isp1301_start_srp,
-	isp->phy.otg->start_hnp = isp1301_start_hnp,
+	isp->phy.otg->set_host = isp1301_set_host;
+	isp->phy.otg->set_peripheral = isp1301_set_peripheral;
+	isp->phy.otg->start_srp = isp1301_start_srp;
+	isp->phy.otg->start_hnp = isp1301_start_hnp;
 
 	enable_vbus_draw(isp, 0);
 	power_down(isp);
-- 
2.22.0

