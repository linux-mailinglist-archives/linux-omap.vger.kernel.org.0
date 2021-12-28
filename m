Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE64F480C67
	for <lists+linux-omap@lfdr.de>; Tue, 28 Dec 2021 19:15:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233875AbhL1SPq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Dec 2021 13:15:46 -0500
Received: from sender11-of-o51.zoho.eu ([31.186.226.237]:21048 "EHLO
        sender11-of-o51.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233411AbhL1SPp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Dec 2021 13:15:45 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1640714432; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=CfF3y5GY5iGOnX8rAz8cHjqqFlU4nJmLqfd3E3S4+w2yLG0JxqgfbeiJqJ6G8WcWV4GG7QJIxXzoY2qbJdROwoaoSuxmXju4PLcm1EOWgsAIXnAN3YGmS5VagKy7ozSznQtdTIPzPBA1H8r/gkSi5yivcqI+Uj3MF1kayf75K3Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1640714432; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=NUzzWyBrbzSHi4hjKohyJTjH8OPFCaSfLbCHp8zeep8=; 
        b=TkGBmnugGf1wkhs/B6ecGE3eh5n1kn8zZzHFdhbIU39HQJc0fcAnuTKtd3iDo4Ca6Llfq/GJKV5Ib4rizPdcbNgbmQhum0l83V8VWKt4lZn/XP++Z9TEFIv/FUXJJXpq5FZ08MjKq/HJyaHb/J4eRz/jkKYmY6cvj1Zo9K6puh4=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz>
Received: from UVOSLinux (aftr-37-201-192-113.unity-media.net [37.201.192.113]) by mx.zoho.eu
        with SMTPS id 1640714429826914.8390073117779; Tue, 28 Dec 2021 19:00:29 +0100 (CET)
Date:   Tue, 28 Dec 2021 19:00:29 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     sre@kernel.org
Cc:     tony@atomide.com, merlijn@wizzup.org, linux-omap@vger.kernel.org
Subject: [RFC PATCH] power: supply: cpcap-charger ramp up charge current
 slowly
Message-Id: <20211228190029.5a58776acce1352e4aac3e9c@uvos.xyz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Even after "power: supply: cpcap-charger: Add usleep to cpcap charger
to avoid usb plug bounce" several usb host port and cable combinations,
especially when combined with usb hubs can cause cpcap-charger to fail
to activate charging even when vbus is seemingly fine. Using a scope
this has been tracked down to vbus still dropping quite considerably
(around 1.5V) for severl us when charging is enabled in these
problematic port-hub-cable combinations. this is probubly due to line
inductivity.

To avoid this, after this patch, cpcap-charger will ramp up charge
current slowly until it hits set current. This makes vbus mutch
cleaner on the scope and avoids the problem of charging being disabled
due to under-voltage. As this ramping causes innate delay the dealy
previously added to combat the related but independent problem of the
usb plug pins bouncing has been made obsolete.

Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
---
 drivers/power/supply/cpcap-charger.c | 85 +++++++++++++++++++++-------
 1 file changed, 65 insertions(+), 20 deletions(-)

diff --git a/drivers/power/supply/cpcap-charger.c b/drivers/power/supply/cpcap-charger.c
index 60e0ce105a29..1ae252d84685 100644
--- a/drivers/power/supply/cpcap-charger.c
+++ b/drivers/power/supply/cpcap-charger.c
@@ -22,6 +22,7 @@
 #include <linux/platform_device.h>
 #include <linux/power_supply.h>
 #include <linux/regmap.h>
+#include <linux/sched.h>
 
 #include <linux/gpio/consumer.h>
 #include <linux/usb/phy_companion.h>
@@ -128,6 +129,7 @@ struct cpcap_charger_ddata {
 	struct list_head irq_list;
 	struct delayed_work detect_work;
 	struct delayed_work vbus_work;
+	struct delayed_work ramp_work;
 	struct gpio_desc *gpio[2];		/* gpio_reven0 & 1 */
 
 	struct iio_channel *channels[CPCAP_CHARGER_IIO_NR];
@@ -142,6 +144,7 @@ struct cpcap_charger_ddata {
 	int status;
 	int voltage;
 	int limit_current;
+	int set_current;
 };
 
 struct cpcap_interrupt_desc {
@@ -440,6 +443,21 @@ static int cpcap_charger_enable(struct cpcap_charger_ddata *ddata,
 	return error;
 }
 
+static int cpcap_charger_get_charge_current_reg(struct cpcap_charger_ddata *ddata)
+{
+	int error;
+	unsigned int val;
+
+	error = regmap_read(ddata->reg, CPCAP_REG_CRM, &val);
+
+	if (error) {
+		dev_err(ddata->dev, "%s failed with %i\n", __func__, error);
+		return -1;
+	}
+
+	return val & 0xf;
+}
+
 static bool cpcap_charger_vbus_valid(struct cpcap_charger_ddata *ddata)
 {
 	int error, value = 0;
@@ -607,6 +625,9 @@ static void cpcap_charger_disconnect(struct cpcap_charger_ddata *ddata,
 		break;
 	}
 
+	cancel_delayed_work_sync(&ddata->ramp_work);
+	ddata->set_current = 0;
+
 	error = cpcap_charger_disable(ddata);
 	if (error) {
 		cpcap_charger_update_state(ddata, POWER_SUPPLY_STATUS_UNKNOWN);
@@ -618,6 +639,40 @@ static void cpcap_charger_disconnect(struct cpcap_charger_ddata *ddata,
 	schedule_delayed_work(&ddata->detect_work, delay);
 }
 
+static void cpcap_charger_ramp_work(struct work_struct *work)
+{
+	struct cpcap_charger_ddata *ddata;
+	int ichrg;
+	int vchrg;
+	int ichrg_current;
+	int error;
+
+	ddata = container_of(work, struct cpcap_charger_ddata,
+		     ramp_work.work);
+
+	ichrg_current = cpcap_charger_get_charge_current_reg(ddata);
+	ichrg = cpcap_charger_current_to_regval(ddata->set_current);
+	vchrg = cpcap_charger_voltage_to_regval(ddata->voltage);
+	if (ichrg_current < ichrg)
+		++ichrg_current;
+	else if (ichrg_current > ichrg)
+		ichrg_current = ichrg;
+	else
+		return;
+
+	error = cpcap_charger_enable(ddata,
+					CPCAP_REG_CRM_VCHRG(vchrg),
+					ichrg_current, 0);
+	if (error) {
+		dev_err(ddata->dev, "cpcap_charger_enable failed with %i\n", error);
+		cpcap_charger_update_state(ddata, POWER_SUPPLY_STATUS_UNKNOWN);
+	} else {
+		if (ichrg_current == ichrg && ddata->status != POWER_SUPPLY_STATUS_CHARGING)
+			cpcap_charger_update_state(ddata, POWER_SUPPLY_STATUS_CHARGING);
+		schedule_delayed_work(&ddata->ramp_work, HZ/20);
+	}
+}
+
 static void cpcap_usb_detect(struct work_struct *work)
 {
 	struct cpcap_charger_ddata *ddata;
@@ -651,13 +706,10 @@ static void cpcap_usb_detect(struct work_struct *work)
 		return;
 	}
 
-	/* Delay for 80ms to avoid vbus bouncing when usb cable is plugged in */
-	usleep_range(80000, 120000);
-
 	/* Throttle chrgcurr2 interrupt for charger done and retry */
 	switch (ddata->status) {
 	case POWER_SUPPLY_STATUS_CHARGING:
-		if (s.chrgcurr2)
+		if (s.chrgcurr2 || delayed_work_pending(&ddata->ramp_work))
 			break;
 		new_state = POWER_SUPPLY_STATUS_FULL;
 
@@ -683,8 +735,6 @@ static void cpcap_usb_detect(struct work_struct *work)
 
 	if (!ddata->feeding_vbus && cpcap_charger_vbus_valid(ddata) &&
 	    s.chrgcurr1) {
-		int max_current;
-		int vchrg, ichrg;
 		union power_supply_propval val;
 		struct power_supply *battery;
 
@@ -701,25 +751,18 @@ static void cpcap_usb_detect(struct work_struct *work)
 			goto out_err;
 
 		if (val.intval) {
-			max_current = 1596000;
+			ddata->set_current = 1596000;
 		} else {
 			dev_info(ddata->dev, "battery not inserted, charging disabled\n");
-			max_current = 0;
+			ddata->set_current = 0;
 		}
 
-		if (max_current > ddata->limit_current)
-			max_current = ddata->limit_current;
-
-		ichrg = cpcap_charger_current_to_regval(max_current);
-		vchrg = cpcap_charger_voltage_to_regval(ddata->voltage);
-		error = cpcap_charger_enable(ddata,
-					     CPCAP_REG_CRM_VCHRG(vchrg),
-					     ichrg, 0);
-		if (error)
-			goto out_err;
-		cpcap_charger_update_state(ddata,
-					   POWER_SUPPLY_STATUS_CHARGING);
+		if (ddata->set_current > ddata->limit_current)
+			ddata->set_current = ddata->limit_current;
+		if (!delayed_work_pending(&ddata->ramp_work))
+			schedule_delayed_work(&ddata->ramp_work, HZ/20);
 	} else {
+		ddata->set_current = 0;
 		error = cpcap_charger_disable(ddata);
 		if (error)
 			goto out_err;
@@ -902,6 +945,7 @@ static int cpcap_charger_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&ddata->irq_list);
 	INIT_DELAYED_WORK(&ddata->detect_work, cpcap_usb_detect);
 	INIT_DELAYED_WORK(&ddata->vbus_work, cpcap_charger_vbus_work);
+	INIT_DELAYED_WORK(&ddata->ramp_work, cpcap_charger_ramp_work);
 	platform_set_drvdata(pdev, ddata);
 
 	error = cpcap_charger_init_iio(ddata);
@@ -964,6 +1008,7 @@ static void cpcap_charger_shutdown(struct platform_device *pdev)
 	cpcap_charger_update_state(ddata, POWER_SUPPLY_STATUS_DISCHARGING);
 	cancel_delayed_work_sync(&ddata->vbus_work);
 	cancel_delayed_work_sync(&ddata->detect_work);
+	cancel_delayed_work_sync(&ddata->ramp_work);
 }
 
 static int cpcap_charger_remove(struct platform_device *pdev)
-- 
2.34.1
