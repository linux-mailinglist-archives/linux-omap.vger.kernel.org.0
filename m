Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 542DF689B1A
	for <lists+linux-omap@lfdr.de>; Fri,  3 Feb 2023 15:08:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233061AbjBCOFX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 3 Feb 2023 09:05:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233181AbjBCOEN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 3 Feb 2023 09:04:13 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 355BCA56EC
        for <linux-omap@vger.kernel.org>; Fri,  3 Feb 2023 06:02:05 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id k16so3945559wms.2
        for <linux-omap@vger.kernel.org>; Fri, 03 Feb 2023 06:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oEkaRI2/7OwdP6CFOGx3AkcXyupYh3TuV6fnAqTrbn8=;
        b=sHxjOK4xLPki6HlXUcVjIamFw7gcPjMf3aifkU7FVnaJU/10MVvRXXqhp7M2fLNP2b
         S6aX3jACu7Va+p8Nf9e+A5FzZ2AoUuTzFAr/1A57g7A6Ilu2d6yLziBbSNs6NqtKO+cS
         5dNk0DjzNtDEWG56WWuuRALima53OCtPLY9N5eNVFRxka43H9LJ9DTJuBjJFn2o7NjpR
         0EELvc7//3E6Ax0xn85aKg1VIGKqUinYZN71HQX2SoJ6ckQ33No8i7E8S9t3x/BSG7R+
         dL7hKNdgme6iGklgw897tOI7R0laQWDZxjegSq9ktY+Cm0JbBaaoQztefgK4bvD+EX5t
         YiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oEkaRI2/7OwdP6CFOGx3AkcXyupYh3TuV6fnAqTrbn8=;
        b=cimZAlMF4fvDV11kfDTLjIQKh2xjHkgy8dBPCKj/67h/4NLKbYJyp8uRxhoOgpC8z4
         4yrRYssXybN9wP9AUQLj25pbtxhHiwcSyJo8LPjr0gE4+r/igt+xZuSo/sVgt/KeAssY
         MOnmIM5L9VOxCvbOxuRheaG7W2LQNfOVNS4SXjnYvjNsmP6VY9GFLeMMzun0RMB1u1Fn
         O5G8u47dAUXHf6M/83PeRkocbqfcTn+N3Zhr5oLKO2+bB2HMdwLtdspquWOfCDBw3bJa
         +kMHf3v0YQKPFQbFBMwV+Tt1+tsjRVjR29M0E+pkC2HkL6Myi5dgCWmHfbUdk6ZN/Js9
         qrZg==
X-Gm-Message-State: AO0yUKVhQtb/KswEDhT4q+h3uFTloRz0Ubk2E4mtK6Tx5cR/o6Mi0lEZ
        CIIdxC03RKnsx2G/6SJpXuckLtVw1kXWVTYauSg=
X-Google-Smtp-Source: AK7set/td3giVdEyQMU1/tNN5LqZolXDlM06sT0CPDRovFBWDn9DIptflRFLfdzI+M12SsOBkGWKxw==
X-Received: by 2002:a05:600c:1e84:b0:3dc:5aba:f287 with SMTP id be4-20020a05600c1e8400b003dc5abaf287mr10085611wmb.23.1675432913358;
        Fri, 03 Feb 2023 06:01:53 -0800 (PST)
Received: from jerome-BL.. (192.201.68.85.rev.sfr.net. [85.68.201.192])
        by smtp.gmail.com with ESMTPSA id g24-20020a7bc4d8000000b003df30c94850sm6859209wmk.25.2023.02.03.06.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 06:01:52 -0800 (PST)
From:   Jerome Neanne <jneanne@baylibre.com>
To:     tony@atomide.com, lee@kernel.org
Cc:     linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        khilman@baylibre.com, nm@ti.com, afd@ti.com, msp@baylibre.com,
        Jerome Neanne <jneanne@baylibre.com>
Subject: [PATCH] mfd: tps65219: Add support for soft shutdown via sys-off API
Date:   Fri,  3 Feb 2023 15:01:50 +0100
Message-Id: <20230203140150.13071-1-jneanne@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use new API for power-off mode support:
Link: https://lwn.net/Articles/894511/
Link: https://lore.kernel.org/all/7hfseqa7l0.fsf@baylibre.com/

sys-off API allows support of shutdown handler and restart handler.

Shutdown was not supported before that enhancement.
This is required for platform that are not using PSCI.

Test:
- restart:
  # reboot
  Default is cold reset:
  # cat /sys/kernel/reboot/mode
  Switch boot mode to warm reset:
  # echo warm > /sys/kernel/reboot/mode
- power-off:
  # halt

Tested on AM62-SP-SK board.

Signed-off-by: Jerome Neanne <jneanne@baylibre.com>
Suggested-by: Andrew Davis <afd@ti.com>
---
 drivers/mfd/tps65219.c | 45 +++++++++++++++++++++++++++++++-----------
 1 file changed, 34 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
index 0e402fda206b..c134f3f6e202 100644
--- a/drivers/mfd/tps65219.c
+++ b/drivers/mfd/tps65219.c
@@ -25,25 +25,34 @@ static int tps65219_cold_reset(struct tps65219 *tps)
 				  TPS65219_MFP_COLD_RESET_I2C_CTRL_MASK);
 }
 
-static int tps65219_restart(struct notifier_block *this,
-			    unsigned long reboot_mode, void *cmd)
+static int tps65219_soft_shutdown(struct tps65219 *tps)
 {
-	struct tps65219 *tps;
+	return regmap_update_bits(tps->regmap, TPS65219_REG_MFP_CTRL,
+				  TPS65219_MFP_I2C_OFF_REQ_MASK,
+				  TPS65219_MFP_I2C_OFF_REQ_MASK);
+}
 
-	tps = container_of(this, struct tps65219, nb);
+static int tps65219_power_off_handler(struct sys_off_data *data)
+{
+	tps65219_soft_shutdown(data->cb_data);
+	return NOTIFY_DONE;
+}
 
+static int tps65219_restart(struct tps65219 *tps,
+			    unsigned long reboot_mode)
+{
 	if (reboot_mode == REBOOT_WARM)
 		tps65219_warm_reset(tps);
 	else
 		tps65219_cold_reset(tps);
-
 	return NOTIFY_DONE;
 }
 
-static struct notifier_block pmic_rst_restart_nb = {
-	.notifier_call = tps65219_restart,
-	.priority = 200,
-};
+static int tps65219_restart_handler(struct sys_off_data *data)
+{
+	tps65219_restart(data->cb_data, data->mode);
+	return NOTIFY_DONE;
+}
 
 static const struct resource tps65219_pwrbutton_resources[] = {
 	DEFINE_RES_IRQ_NAMED(TPS65219_INT_PB_FALLING_EDGE_DETECT, "falling"),
@@ -269,13 +278,27 @@ static int tps65219_probe(struct i2c_client *client)
 		}
 	}
 
-	tps->nb = pmic_rst_restart_nb;
-	ret = register_restart_handler(&tps->nb);
+	ret = devm_register_sys_off_handler(tps->dev,
+					    SYS_OFF_MODE_RESTART,
+					    SYS_OFF_PRIO_HIGH,
+					    tps65219_restart_handler,
+					    tps);
+
 	if (ret) {
 		dev_err(tps->dev, "cannot register restart handler, %d\n", ret);
 		return ret;
 	}
 
+	ret = devm_register_sys_off_handler(tps->dev,
+					    SYS_OFF_MODE_POWER_OFF,
+					    SYS_OFF_PRIO_DEFAULT,
+					    tps65219_power_off_handler,
+					    tps);
+	if (ret) {
+		dev_err(tps->dev, "failed to register sys-off handler: %d\n",
+			ret);
+		return ret;
+	}
 	return 0;
 }
 
-- 
2.34.1

