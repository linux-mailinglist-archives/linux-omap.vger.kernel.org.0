Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6A3F54B47E
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jun 2022 17:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241025AbiFNPV6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Jun 2022 11:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231856AbiFNPV5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 14 Jun 2022 11:21:57 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA7AF3A1AB
        for <linux-omap@vger.kernel.org>; Tue, 14 Jun 2022 08:21:55 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1o18Ma-0005s7-ND; Tue, 14 Jun 2022 17:21:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o18MX-000VyN-5k; Tue, 14 Jun 2022 17:21:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o18MX-00GGiS-QV; Tue, 14 Jun 2022 17:21:49 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>
Cc:     linux-omap@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] mfd: twl: Remove platform data support
Date:   Tue, 14 Jun 2022 17:21:48 +0200
Message-Id: <20220614152148.252820-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=14328; h=from:subject; bh=N/AEYunkCP1hposkVOstfforjwHFqFvC+ENyGSBgPmg=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiqKeIfe3zLFBr79G6zzr60qw01sGY7Y2wscCuJVCa MOT47TyJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYqiniAAKCRDB/BR4rcrsCQX6CA CabekRClaAfRGP2+0g3NggIKAhHI3coZMEJVJqMxN4ympLAfuWoDuDSKmxVDBpp8fqxIcvq430Pt5q Ad9cAsPMxD2rkJB1P21zCnwgrxmU3PcC0nz++zTLiadjSQZiEbKnFmG8ZNd1PrOoFQ5+kn6KgZK6za hhwqbOHKLKx7Lknu/vxUmm4O6/7R/Tke8dsJZF0vsMtQ0yQbBvUJJbO64SlX8ud8gkqn1UuY/4nccJ 8yEY6d3C09NB7lPkg4adZfjYzPIDLZOG0BwzFuBZN2afCHDnvwol/qJyBHXgV//YDMFv+ljNkvSh0q JzKG+DXPM6Qz3GPAMyzTp75KZxaHCM
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-omap@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

There is no in-tree machine that provides a struct twl4030_platform_data
since commit e92fc4f04a34 ("ARM: OMAP2+: Drop legacy board file for
LDP"). So assume dev_get_platdata() returns NULL in twl_probe() and
simplify accordingly.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/mfd/twl-core.c  | 323 +---------------------------------------
 include/linux/mfd/twl.h |  55 -------
 2 files changed, 5 insertions(+), 373 deletions(-)

diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
index bd6659cf3bc0..2cb9326f3e61 100644
--- a/drivers/mfd/twl-core.c
+++ b/drivers/mfd/twl-core.c
@@ -656,309 +656,6 @@ static inline struct device *add_child(unsigned mod_no, const char *name,
 		can_wakeup, irq0, irq1);
 }
 
-static struct device *
-add_regulator_linked(int num, struct regulator_init_data *pdata,
-		struct regulator_consumer_supply *consumers,
-		unsigned num_consumers, unsigned long features)
-{
-	struct twl_regulator_driver_data drv_data;
-
-	/* regulator framework demands init_data ... */
-	if (!pdata)
-		return NULL;
-
-	if (consumers) {
-		pdata->consumer_supplies = consumers;
-		pdata->num_consumer_supplies = num_consumers;
-	}
-
-	if (pdata->driver_data) {
-		/* If we have existing drv_data, just add the flags */
-		struct twl_regulator_driver_data *tmp;
-		tmp = pdata->driver_data;
-		tmp->features |= features;
-	} else {
-		/* add new driver data struct, used only during init */
-		drv_data.features = features;
-		drv_data.set_voltage = NULL;
-		drv_data.get_voltage = NULL;
-		drv_data.data = NULL;
-		pdata->driver_data = &drv_data;
-	}
-
-	/* NOTE:  we currently ignore regulator IRQs, e.g. for short circuits */
-	return add_numbered_child(TWL_MODULE_PM_MASTER, "twl_reg", num,
-		pdata, sizeof(*pdata), false, 0, 0);
-}
-
-static struct device *
-add_regulator(int num, struct regulator_init_data *pdata,
-		unsigned long features)
-{
-	return add_regulator_linked(num, pdata, NULL, 0, features);
-}
-
-/*
- * NOTE:  We know the first 8 IRQs after pdata->base_irq are
- * for the PIH, and the next are for the PWR_INT SIH, since
- * that's how twl_init_irq() sets things up.
- */
-
-static int
-add_children(struct twl4030_platform_data *pdata, unsigned irq_base,
-		unsigned long features)
-{
-	struct device	*child;
-
-	if (IS_ENABLED(CONFIG_GPIO_TWL4030) && pdata->gpio) {
-		child = add_child(TWL4030_MODULE_GPIO, "twl4030_gpio",
-				pdata->gpio, sizeof(*pdata->gpio),
-				false, irq_base + GPIO_INTR_OFFSET, 0);
-		if (IS_ERR(child))
-			return PTR_ERR(child);
-	}
-
-	if (IS_ENABLED(CONFIG_KEYBOARD_TWL4030) && pdata->keypad) {
-		child = add_child(TWL4030_MODULE_KEYPAD, "twl4030_keypad",
-				pdata->keypad, sizeof(*pdata->keypad),
-				true, irq_base + KEYPAD_INTR_OFFSET, 0);
-		if (IS_ERR(child))
-			return PTR_ERR(child);
-	}
-
-	if (IS_ENABLED(CONFIG_TWL4030_MADC) && pdata->madc &&
-	    twl_class_is_4030()) {
-		child = add_child(TWL4030_MODULE_MADC, "twl4030_madc",
-				pdata->madc, sizeof(*pdata->madc),
-				true, irq_base + MADC_INTR_OFFSET, 0);
-		if (IS_ERR(child))
-			return PTR_ERR(child);
-	}
-
-	if (IS_ENABLED(CONFIG_RTC_DRV_TWL4030)) {
-		/*
-		 * REVISIT platform_data here currently might expose the
-		 * "msecure" line ... but for now we just expect board
-		 * setup to tell the chip "it's always ok to SET_TIME".
-		 * Eventually, Linux might become more aware of such
-		 * HW security concerns, and "least privilege".
-		 */
-		child = add_child(TWL_MODULE_RTC, "twl_rtc", NULL, 0,
-				true, irq_base + RTC_INTR_OFFSET, 0);
-		if (IS_ERR(child))
-			return PTR_ERR(child);
-	}
-
-	if (IS_ENABLED(CONFIG_PWM_TWL)) {
-		child = add_child(TWL_MODULE_PWM, "twl-pwm", NULL, 0,
-				  false, 0, 0);
-		if (IS_ERR(child))
-			return PTR_ERR(child);
-	}
-
-	if (IS_ENABLED(CONFIG_PWM_TWL_LED)) {
-		child = add_child(TWL_MODULE_LED, "twl-pwmled", NULL, 0,
-				  false, 0, 0);
-		if (IS_ERR(child))
-			return PTR_ERR(child);
-	}
-
-	if (IS_ENABLED(CONFIG_TWL4030_USB) && pdata->usb &&
-	    twl_class_is_4030()) {
-
-		static struct regulator_consumer_supply usb1v5 = {
-			.supply =	"usb1v5",
-		};
-		static struct regulator_consumer_supply usb1v8 = {
-			.supply =	"usb1v8",
-		};
-		static struct regulator_consumer_supply usb3v1 = {
-			.supply =	"usb3v1",
-		};
-
-	/* First add the regulators so that they can be used by transceiver */
-		if (IS_ENABLED(CONFIG_REGULATOR_TWL4030)) {
-			/* this is a template that gets copied */
-			struct regulator_init_data usb_fixed = {
-				.constraints.valid_modes_mask =
-					REGULATOR_MODE_NORMAL
-					| REGULATOR_MODE_STANDBY,
-				.constraints.valid_ops_mask =
-					REGULATOR_CHANGE_MODE
-					| REGULATOR_CHANGE_STATUS,
-			};
-
-			child = add_regulator_linked(TWL4030_REG_VUSB1V5,
-						      &usb_fixed, &usb1v5, 1,
-						      features);
-			if (IS_ERR(child))
-				return PTR_ERR(child);
-
-			child = add_regulator_linked(TWL4030_REG_VUSB1V8,
-						      &usb_fixed, &usb1v8, 1,
-						      features);
-			if (IS_ERR(child))
-				return PTR_ERR(child);
-
-			child = add_regulator_linked(TWL4030_REG_VUSB3V1,
-						      &usb_fixed, &usb3v1, 1,
-						      features);
-			if (IS_ERR(child))
-				return PTR_ERR(child);
-
-		}
-
-		child = add_child(TWL_MODULE_USB, "twl4030_usb",
-				pdata->usb, sizeof(*pdata->usb), true,
-				/* irq0 = USB_PRES, irq1 = USB */
-				irq_base + USB_PRES_INTR_OFFSET,
-				irq_base + USB_INTR_OFFSET);
-
-		if (IS_ERR(child))
-			return PTR_ERR(child);
-
-		/* we need to connect regulators to this transceiver */
-		if (IS_ENABLED(CONFIG_REGULATOR_TWL4030) && child) {
-			usb1v5.dev_name = dev_name(child);
-			usb1v8.dev_name = dev_name(child);
-			usb3v1.dev_name = dev_name(child);
-		}
-	}
-
-	if (IS_ENABLED(CONFIG_TWL4030_WATCHDOG) && twl_class_is_4030()) {
-		child = add_child(TWL_MODULE_PM_RECEIVER, "twl4030_wdt", NULL,
-				  0, false, 0, 0);
-		if (IS_ERR(child))
-			return PTR_ERR(child);
-	}
-
-	if (IS_ENABLED(CONFIG_INPUT_TWL4030_PWRBUTTON) && twl_class_is_4030()) {
-		child = add_child(TWL_MODULE_PM_MASTER, "twl4030_pwrbutton",
-				  NULL, 0, true, irq_base + 8 + 0, 0);
-		if (IS_ERR(child))
-			return PTR_ERR(child);
-	}
-
-	if (IS_ENABLED(CONFIG_MFD_TWL4030_AUDIO) && pdata->audio &&
-	    twl_class_is_4030()) {
-		child = add_child(TWL4030_MODULE_AUDIO_VOICE, "twl4030-audio",
-				pdata->audio, sizeof(*pdata->audio),
-				false, 0, 0);
-		if (IS_ERR(child))
-			return PTR_ERR(child);
-	}
-
-	/* twl4030 regulators */
-	if (IS_ENABLED(CONFIG_REGULATOR_TWL4030) && twl_class_is_4030()) {
-		child = add_regulator(TWL4030_REG_VPLL1, pdata->vpll1,
-					features);
-		if (IS_ERR(child))
-			return PTR_ERR(child);
-
-		child = add_regulator(TWL4030_REG_VIO, pdata->vio,
-					features);
-		if (IS_ERR(child))
-			return PTR_ERR(child);
-
-		child = add_regulator(TWL4030_REG_VDD1, pdata->vdd1,
-					features);
-		if (IS_ERR(child))
-			return PTR_ERR(child);
-
-		child = add_regulator(TWL4030_REG_VDD2, pdata->vdd2,
-					features);
-		if (IS_ERR(child))
-			return PTR_ERR(child);
-
-		child = add_regulator(TWL4030_REG_VMMC1, pdata->vmmc1,
-					features);
-		if (IS_ERR(child))
-			return PTR_ERR(child);
-
-		child = add_regulator(TWL4030_REG_VDAC, pdata->vdac,
-					features);
-		if (IS_ERR(child))
-			return PTR_ERR(child);
-
-		child = add_regulator((features & TWL4030_VAUX2)
-					? TWL4030_REG_VAUX2_4030
-					: TWL4030_REG_VAUX2,
-				pdata->vaux2, features);
-		if (IS_ERR(child))
-			return PTR_ERR(child);
-
-		child = add_regulator(TWL4030_REG_VINTANA1, pdata->vintana1,
-					features);
-		if (IS_ERR(child))
-			return PTR_ERR(child);
-
-		child = add_regulator(TWL4030_REG_VINTANA2, pdata->vintana2,
-					features);
-		if (IS_ERR(child))
-			return PTR_ERR(child);
-
-		child = add_regulator(TWL4030_REG_VINTDIG, pdata->vintdig,
-					features);
-		if (IS_ERR(child))
-			return PTR_ERR(child);
-	}
-
-	/* maybe add LDOs that are omitted on cost-reduced parts */
-	if (IS_ENABLED(CONFIG_REGULATOR_TWL4030) && !(features & TPS_SUBSET)
-	  && twl_class_is_4030()) {
-		child = add_regulator(TWL4030_REG_VPLL2, pdata->vpll2,
-					features);
-		if (IS_ERR(child))
-			return PTR_ERR(child);
-
-		child = add_regulator(TWL4030_REG_VMMC2, pdata->vmmc2,
-					features);
-		if (IS_ERR(child))
-			return PTR_ERR(child);
-
-		child = add_regulator(TWL4030_REG_VSIM, pdata->vsim,
-					features);
-		if (IS_ERR(child))
-			return PTR_ERR(child);
-
-		child = add_regulator(TWL4030_REG_VAUX1, pdata->vaux1,
-					features);
-		if (IS_ERR(child))
-			return PTR_ERR(child);
-
-		child = add_regulator(TWL4030_REG_VAUX3, pdata->vaux3,
-					features);
-		if (IS_ERR(child))
-			return PTR_ERR(child);
-
-		child = add_regulator(TWL4030_REG_VAUX4, pdata->vaux4,
-					features);
-		if (IS_ERR(child))
-			return PTR_ERR(child);
-	}
-
-	if (IS_ENABLED(CONFIG_CHARGER_TWL4030) && pdata->bci &&
-			!(features & (TPS_SUBSET | TWL5031))) {
-		child = add_child(TWL_MODULE_MAIN_CHARGE, "twl4030_bci",
-				pdata->bci, sizeof(*pdata->bci), false,
-				/* irq0 = CHG_PRES, irq1 = BCI */
-				irq_base + BCI_PRES_INTR_OFFSET,
-				irq_base + BCI_INTR_OFFSET);
-		if (IS_ERR(child))
-			return PTR_ERR(child);
-	}
-
-	if (IS_ENABLED(CONFIG_TWL4030_POWER) && pdata->power) {
-		child = add_child(TWL_MODULE_PM_MASTER, "twl4030_power",
-				  pdata->power, sizeof(*pdata->power), false,
-				  0, 0);
-		if (IS_ERR(child))
-			return PTR_ERR(child);
-	}
-
-	return 0;
-}
-
 /*----------------------------------------------------------------------*/
 
 /*
@@ -987,8 +684,7 @@ static inline int unprotect_pm_master(void)
 	return e;
 }
 
-static void clocks_init(struct device *dev,
-			struct twl4030_clock_init_data *clock)
+static void clocks_init(struct device *dev)
 {
 	int e = 0;
 	struct clk *osc;
@@ -1018,8 +714,6 @@ static void clocks_init(struct device *dev,
 	}
 
 	ctrl |= HIGH_PERF_SQ;
-	if (clock && clock->ck32k_lowpwr_enable)
-		ctrl |= CK32K_LOWPWR_EN;
 
 	e |= unprotect_pm_master();
 	/* effect->MADC+USB ck en */
@@ -1063,7 +757,6 @@ static struct of_dev_auxdata twl_auxdata_lookup[] = {
 static int
 twl_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
-	struct twl4030_platform_data	*pdata = dev_get_platdata(&client->dev);
 	struct device_node		*node = client->dev.of_node;
 	struct platform_device		*pdev;
 	const struct regmap_config	*twl_regmap_config;
@@ -1071,7 +764,7 @@ twl_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	int				status;
 	unsigned			i, num_slaves;
 
-	if (!node && !pdata) {
+	if (!node) {
 		dev_err(&client->dev, "no platform data\n");
 		return -EINVAL;
 	}
@@ -1161,7 +854,7 @@ twl_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	twl_priv->ready = true;
 
 	/* setup clock framework */
-	clocks_init(&client->dev, pdata ? pdata->clock : NULL);
+	clocks_init(&client->dev);
 
 	/* read TWL IDCODE Register */
 	if (twl_class_is_4030()) {
@@ -1209,14 +902,8 @@ twl_probe(struct i2c_client *client, const struct i2c_device_id *id)
 				 TWL4030_DCDC_GLOBAL_CFG);
 	}
 
-	if (node) {
-		if (pdata)
-			twl_auxdata_lookup[0].platform_data = pdata->gpio;
-		status = of_platform_populate(node, NULL, twl_auxdata_lookup,
-					      &client->dev);
-	} else {
-		status = add_children(pdata, irq_base, id->driver_data);
-	}
+	status = of_platform_populate(node, NULL, twl_auxdata_lookup,
+				      &client->dev);
 
 fail:
 	if (status < 0)
diff --git a/include/linux/mfd/twl.h b/include/linux/mfd/twl.h
index 8871cc5188a0..e426938eafd5 100644
--- a/include/linux/mfd/twl.h
+++ b/include/linux/mfd/twl.h
@@ -694,61 +694,6 @@ struct twl4030_audio_data {
 	unsigned int irq_base;
 };
 
-struct twl4030_platform_data {
-	struct twl4030_clock_init_data		*clock;
-	struct twl4030_bci_platform_data	*bci;
-	struct twl4030_gpio_platform_data	*gpio;
-	struct twl4030_madc_platform_data	*madc;
-	struct twl4030_keypad_data		*keypad;
-	struct twl4030_usb_data			*usb;
-	struct twl4030_power_data		*power;
-	struct twl4030_audio_data		*audio;
-
-	/* Common LDO regulators for TWL4030/TWL6030 */
-	struct regulator_init_data		*vdac;
-	struct regulator_init_data		*vaux1;
-	struct regulator_init_data		*vaux2;
-	struct regulator_init_data		*vaux3;
-	struct regulator_init_data		*vdd1;
-	struct regulator_init_data		*vdd2;
-	struct regulator_init_data		*vdd3;
-	/* TWL4030 LDO regulators */
-	struct regulator_init_data		*vpll1;
-	struct regulator_init_data		*vpll2;
-	struct regulator_init_data		*vmmc1;
-	struct regulator_init_data		*vmmc2;
-	struct regulator_init_data		*vsim;
-	struct regulator_init_data		*vaux4;
-	struct regulator_init_data		*vio;
-	struct regulator_init_data		*vintana1;
-	struct regulator_init_data		*vintana2;
-	struct regulator_init_data		*vintdig;
-	/* TWL6030 LDO regulators */
-	struct regulator_init_data              *vmmc;
-	struct regulator_init_data              *vpp;
-	struct regulator_init_data              *vusim;
-	struct regulator_init_data              *vana;
-	struct regulator_init_data              *vcxio;
-	struct regulator_init_data              *vusb;
-	struct regulator_init_data		*clk32kg;
-	struct regulator_init_data              *v1v8;
-	struct regulator_init_data              *v2v1;
-	/* TWL6032 LDO regulators */
-	struct regulator_init_data		*ldo1;
-	struct regulator_init_data		*ldo2;
-	struct regulator_init_data		*ldo3;
-	struct regulator_init_data		*ldo4;
-	struct regulator_init_data		*ldo5;
-	struct regulator_init_data		*ldo6;
-	struct regulator_init_data		*ldo7;
-	struct regulator_init_data		*ldoln;
-	struct regulator_init_data		*ldousb;
-	/* TWL6032 DCDC regulators */
-	struct regulator_init_data		*smps3;
-	struct regulator_init_data		*smps4;
-	struct regulator_init_data		*vio6025;
-};
-
 struct twl_regulator_driver_data {
 	int		(*set_voltage)(void *data, int target_uV);
 	int		(*get_voltage)(void *data);

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.36.1

