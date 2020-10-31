Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F02E52A1728
	for <lists+linux-omap@lfdr.de>; Sat, 31 Oct 2020 12:57:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbgJaL5C (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 31 Oct 2020 07:57:02 -0400
Received: from sender11-of-o52.zoho.eu ([31.186.226.238]:21398 "EHLO
        sender11-of-o52.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726935AbgJaL5A (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 31 Oct 2020 07:57:00 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1604145414; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=MZ8pIxrRpLEhCIvwpU17BAGHD3nxKeKfA5vaAQt0/UDiHozfJsSAdk838ZssFKEA18ihK9IoV1jxwaSMnfj3Uk7L/gxEnprfG4ZAzhyZV4UuoPGYXdggHrp2hOtpa3GRYYjohs2wh5ECs1z0Zp5bz8TqZ1Y+5kJK/OA4Mjddzss=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1604145414; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=XDN/oIiMVCuSULfLXzUFSh/8Ne8Qjl+dOZybkI8nzcc=; 
        b=VhF+WtTuankMGEuvW5HE4wxArbjTc0pcomY2heLdyji/qVD4/aJHLu1xdcMCIbrYgbIFnzk7Gw6nNCXKP0PDXVxDQdziwj4LnacI6ClXm25uZAbKbvENf476tEFNkWO2DNtDUP1DP473Jl4Tu62RGSv1ga6D8VCMJdvSZfE4loo=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz> header.from=<philipp@uvos.xyz>
Received: from localhost.localdomain (ip-95-222-213-99.hsi15.unitymediagroup.de [95.222.213.99]) by mx.zoho.eu
        with SMTPS id 1604145411695916.6492190219158; Sat, 31 Oct 2020 12:56:51 +0100 (CET)
Date:   Sat, 31 Oct 2020 12:56:50 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     sre@kernel.org
Cc:     linux-omap@vger.kernel.org
Subject: [PATCH 1/1] power: supply: cpcap-battery: improve handling of 3rd
 party batteries.
Message-Id: <20201031125650.768df90568d54b1dcf3bb10c@uvos.xyz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Adds a module option to ignore a missing temerature sensor. Usefull for
3rd party batteries.

Signed-off-by: Carl Philipp Klemm <carl@uvos.xyz>

---

diff --git a/drivers/power/supply/cpcap-battery.c b/drivers/power/supply/cpcap-battery.c
index 3be76cd7584a..8b7978b065df 100644
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
@@ -558,7 +562,7 @@ static int cpcap_battery_get_property(struct power_supply *psy,
 
 	switch (psp) {
 	case POWER_SUPPLY_PROP_PRESENT:
-		if (latest->temperature > CPCAP_NO_BATTERY)
+		if (latest->temperature > CPCAP_NO_BATTERY || ignore_temperature_probe)
 			val->intval = 1;
 		else
 			val->intval = 0;
@@ -658,6 +662,8 @@ static int cpcap_battery_get_property(struct power_supply *psy,
 		val->intval = POWER_SUPPLY_SCOPE_SYSTEM;
 		break;
 	case POWER_SUPPLY_PROP_TEMP:
+		if (ignore_temperature_probe)
+			return -ENODATA;
 		val->intval = latest->temperature;
 		break;
 	default:

-- 
Carl Philipp Klemm <philipp@uvos.xyz> <carl@uvos.xyz>
