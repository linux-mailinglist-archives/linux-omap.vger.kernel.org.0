Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFA6B29443B
	for <lists+linux-omap@lfdr.de>; Tue, 20 Oct 2020 23:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438633AbgJTVI0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Oct 2020 17:08:26 -0400
Received: from sender11-of-o52.zoho.eu ([31.186.226.238]:21604 "EHLO
        sender11-of-o52.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438622AbgJTVIZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Oct 2020 17:08:25 -0400
X-Greylist: delayed 903 seconds by postgrey-1.27 at vger.kernel.org; Tue, 20 Oct 2020 17:08:23 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1603227194; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=J/M3eDQUJr1/yVqRDzsC2tfas+VuVUiYObXXGxXP2ydkU2Z901C8f+1RrJVC/elmDmSEjhbysLrMDrULF2gKI7SnCAMGrDeBjwuHQDUcF1FfM+ApLRVq21vxF+NWp+7bhoGDcCbEHy9A/anyqHqiWvmr1IwSlSn1S153p2y0ukM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1603227194; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=7uyVjFxfK3uc3NGBGcthVscK5i2bZ9YGItRXAu8MjL8=; 
        b=Nf1fcqokNDfovu0ZuZu5kjltTJKSqNN4WBIgRTV88WbtUJlFMfYNtKDoMFFDrbrrtU7frLV3fHvkq8RVAleeJDtPEFI28XVFydCWTiyiZt2+dXZfbQWa1TREqQ4knKcALtw9ydJ65n6sjeDVPRTrPnA9H8jeOvYwwmZ65x8rI9Q=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=devnull@uvos.xyz;
        dmarc=pass header.from=<devnull@uvos.xyz> header.from=<devnull@uvos.xyz>
Received: from localhost.localdomain (ip-95-222-213-19.hsi15.unitymediagroup.de [95.222.213.19]) by mx.zoho.eu
        with SMTPS id 1603227193183311.1218298065007; Tue, 20 Oct 2020 22:53:13 +0200 (CEST)
Date:   Tue, 20 Oct 2020 22:53:12 +0200
From:   Dev Null <devnull@uvos.xyz>
To:     sre@kernel.org
Cc:     linux-omap@vger.kernel.org
Subject: [PATCH 1/1] power: supply: cpcap-battery: improve handling of 3rd
 party and XT875 batteries.
Message-Id: <20201020225312.b4ea29c9dc3ae00f23e39280@uvos.xyz>
Organization: UVOS Organization
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Adds a module option to ignore a missing temerature sensor.
Invalidates empty->counter_uah and charge_full when charge_now indicates that they are grossly wrong
Makes charge_full_design writeable, so that different/custom batteries can be used.
This is especially usfull on XTT875 where both HW4X and BW8X exsist.

diff --git a/drivers/power/supply/cpcap-battery.c b/drivers/power/supply/cpcap-battery.c
index 3be76cd7584a..ffa70c31c1cb 100644
--- a/drivers/power/supply/cpcap-battery.c
+++ b/drivers/power/supply/cpcap-battery.c
@@ -28,6 +28,7 @@
 #include <linux/power_supply.h>
 #include <linux/reboot.h>
 #include <linux/regmap.h>
+#include <linux/moduleparam.h>
 
 #include <linux/iio/consumer.h>
 #include <linux/iio/types.h>
@@ -162,6 +163,9 @@ static const struct cpcap_battery_capacity cpcap_battery_cap[] = {
 
 #define CPCAP_NO_BATTERY	-400
 
+static bool ignore_temperature_probe;
+module_param(ignore_temperature_probe, bool, 0660);
+
 static struct cpcap_battery_state_data *
 cpcap_battery_get_state(struct cpcap_battery_ddata *ddata,
 			enum cpcap_battery_state state)
@@ -205,7 +209,8 @@ static int cpcap_charger_battery_temperature(struct cpcap_battery_ddata *ddata,
 	channel = ddata->channels[CPCAP_BATTERY_IIO_BATTDET];
 	error = iio_read_channel_processed(channel, value);
 	if (error < 0) {
-		dev_warn(ddata->dev, "%s failed: %i\n", __func__, error);
+		if (!ignore_temperature_probe)
+			dev_warn(ddata->dev, "%s failed: %i\n", __func__, error);
 		*value = CPCAP_NO_BATTERY;
 
 		return error;
@@ -558,7 +563,7 @@ static int cpcap_battery_get_property(struct power_supply *psy,
 
 	switch (psp) {
 	case POWER_SUPPLY_PROP_PRESENT:
-		if (latest->temperature > CPCAP_NO_BATTERY)
+		if (latest->temperature > CPCAP_NO_BATTERY || ignore_temperature_probe)
 			val->intval = 1;
 		else
 			val->intval = 0;
@@ -641,10 +646,22 @@ static int cpcap_battery_get_property(struct power_supply *psy,
 		if (!empty->voltage)
 			return -ENODATA;
 		val->intval = empty->counter_uah - latest->counter_uah;
-		if (val->intval < 0)
+		if (val->intval < 0) {
+			if (ddata->charge_full && abs(val->intval) > ddata->charge_full/5) {
+				empty->voltage = 0;
+				ddata->charge_full = 0;
+				return -ENODATA;
+			}
 			val->intval = 0;
-		else if (ddata->charge_full && ddata->charge_full < val->intval)
+		}
+		else if (ddata->charge_full && ddata->charge_full < val->intval) {
+			if (val->intval > (6*ddata->charge_full)/5) {
+				empty->voltage = 0;
+				ddata->charge_full = 0;
+				return -ENODATA;
+			}
 			val->intval = ddata->charge_full;
+		}
 		break;
 	case POWER_SUPPLY_PROP_CHARGE_FULL:
 		if (!ddata->charge_full)
@@ -658,6 +675,8 @@ static int cpcap_battery_get_property(struct power_supply *psy,
 		val->intval = POWER_SUPPLY_SCOPE_SYSTEM;
 		break;
 	case POWER_SUPPLY_PROP_TEMP:
+		if (ignore_temperature_probe)
+			return -ENODATA;
 		val->intval = latest->temperature;
 		break;
 	default:
@@ -715,11 +734,18 @@ static int cpcap_battery_set_property(struct power_supply *psy,
 	case POWER_SUPPLY_PROP_CHARGE_FULL:
 		if (val->intval < 0)
 			return -EINVAL;
-		if (val->intval > ddata->config.info.charge_full_design)
+		if (val->intval > (6*ddata->config.info.charge_full_design)/5)
 			return -EINVAL;
 
 		ddata->charge_full = val->intval;
 
+		return 0;
+	case POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN:
+		if (val->intval < 0)
+			return -EINVAL;
+
+		ddata->config.info.charge_full_design = val->intval;
+
 		return 0;
 	default:
 		return -EINVAL;
@@ -734,6 +760,7 @@ static int cpcap_battery_property_is_writeable(struct power_supply *psy,
 	switch (psp) {
 	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE:
 	case POWER_SUPPLY_PROP_CHARGE_FULL:
+	case POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN:
 		return 1;
 	default:
 		return 0;

-- 
Dev Null <devnull@uvos.xyz>
