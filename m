Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A23F727893
	for <lists+linux-omap@lfdr.de>; Thu,  8 Jun 2023 09:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233699AbjFHHUH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Jun 2023 03:20:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235178AbjFHHTz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 8 Jun 2023 03:19:55 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EEA89E
        for <linux-omap@vger.kernel.org>; Thu,  8 Jun 2023 00:19:53 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f736e0c9a8so1180935e9.2
        for <linux-omap@vger.kernel.org>; Thu, 08 Jun 2023 00:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686208791; x=1688800791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J4070cfF5PAleKzRCTMiKt0VwtD6qDiaa/t3zF9r6Pw=;
        b=3l0tt/gEy2ZmUawIigas/dQcBroxP8nUFOqTF93ZItYcV7eA/Ccm9NTmmTqOJghjsZ
         3+AMlPL/R5sQ4Fe+IycH+oPAYpvwDyJaZj2OAUXXVk0ws3Vcy/YXKUJmhB+wbDYKDXQW
         FvKTHcziAd6NySKGq/XtDD9BqXZY5MfZGudz7JLHySJLadwmUoY7k1V1c6LcO2pvzDG8
         HkP+5yH9PaYhyWJlOFfxUsF20LPgMvJBJGTc1KID8wG9lOL5pTfu8MZGG3nMmDv86c5f
         ilA81ugcfQyDyoV7lunznyDzDhi8bYIgQTPK5fb/EJ9O1l2LnhLQCgxuQk0bn1QHX2s+
         FGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686208791; x=1688800791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J4070cfF5PAleKzRCTMiKt0VwtD6qDiaa/t3zF9r6Pw=;
        b=HI7K23wtSLpjAehfYv9PXXURQ7bLy6RSWWBRUC+GxXoNZ4PhY2IHg/Mdth6HdCQ2D4
         lR7YlhhQZASy1eyhfv1/SECQ6vOlrd3g+TNuRCggqH21WOIgdfiFr65B+cGBPhH3o3se
         uP7ZrYJNe2bsJmMviTm5i5l5sEg/YVXRxJVV8XnXQEATFhzBcAuyt8PXy8aLo45qW6aS
         33FP4pbr5XmlfriDwC4VzLEOPmDXgP7i37rPBvDufrFlYZlz5o2UWIUaIpomUDFHPGXY
         QYfQUht6cV+bupcY1Zswp+zuTkoUi1Lh1ZGV23mC02rklNjDV621oB00XnxrGrnCWNb4
         i8Pw==
X-Gm-Message-State: AC+VfDwtvXxA+FoctM9UbleRSGbFD6jPdBG1XT8LGOaMk3vXE7SXrFBe
        hXNC9lJpiC7MBKbOcFwzRgicuA==
X-Google-Smtp-Source: ACHHUZ46cL7WHN6WPtl/cXPyvYLYUPu589KDc+8TiQuhm/A4tpkXAU5iXUIJUXrCxQNMa+F0+tUbFg==
X-Received: by 2002:a05:600c:20c:b0:3f6:be1:b8d6 with SMTP id 12-20020a05600c020c00b003f60be1b8d6mr579770wmi.9.1686208791643;
        Thu, 08 Jun 2023 00:19:51 -0700 (PDT)
Received: from jerome-BL.. (192.201.68.85.rev.sfr.net. [85.68.201.192])
        by smtp.gmail.com with ESMTPSA id c22-20020a7bc856000000b003f42ceb3bf4sm1012572wml.32.2023.06.08.00.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 00:19:51 -0700 (PDT)
From:   Jerome Neanne <jneanne@baylibre.com>
To:     tony@atomide.com, lee@kernel.org
Cc:     linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        khilman@baylibre.com, nm@ti.com, afd@ti.com, msp@baylibre.com,
        Jerome Neanne <jneanne@baylibre.com>
Subject: [RESEND PATCH v3] mfd: tps65219: Add support for soft shutdown via sys-off API
Date:   Thu,  8 Jun 2023 09:19:47 +0200
Message-Id: <20230608071947.3467751-1-jneanne@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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

Tested on AM62-LP-SK board.

Signed-off-by: Jerome Neanne <jneanne@baylibre.com>
Suggested-by: Andrew Davis <afd@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
---

Notes:
    Change-log v3 to v2
    v2: Link: https://lore.kernel.org/lkml/20230511122100.2225417-1-jneanne@baylibre.com/
    Lee Jones Review:
    nits: rm not needed line wraps and restore a cr deleted not related with the patch.
    
    Change-log v2 to v1
    v1: Link: https://lore.kernel.org/all/20230203140150.13071-1-jneanne@baylibre.com/
    Andrew Davis Review:
    - Use new helpers devm_register_restart_handler and devm_register_power_off_handler
    Vignesh Raghavendra:
    - Fix typo on board name in commit message

 drivers/mfd/tps65219.c | 38 ++++++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
index 0e402fda206b..3d9164491e20 100644
--- a/drivers/mfd/tps65219.c
+++ b/drivers/mfd/tps65219.c
@@ -25,13 +25,21 @@ static int tps65219_cold_reset(struct tps65219 *tps)
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
 
+static int tps65219_restart(struct tps65219 *tps, unsigned long reboot_mode)
+{
 	if (reboot_mode == REBOOT_WARM)
 		tps65219_warm_reset(tps);
 	else
@@ -40,10 +48,11 @@ static int tps65219_restart(struct notifier_block *this,
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
@@ -269,13 +278,22 @@ static int tps65219_probe(struct i2c_client *client)
 		}
 	}
 
-	tps->nb = pmic_rst_restart_nb;
-	ret = register_restart_handler(&tps->nb);
+	ret = devm_register_restart_handler(tps->dev,
+					    tps65219_restart_handler,
+					    tps);
+
 	if (ret) {
 		dev_err(tps->dev, "cannot register restart handler, %d\n", ret);
 		return ret;
 	}
 
+	ret = devm_register_power_off_handler(tps->dev,
+					      tps65219_power_off_handler,
+					      tps);
+	if (ret) {
+		dev_err(tps->dev, "failed to register power-off handler: %d\n", ret);
+		return ret;
+	}
 	return 0;
 }
 
-- 
2.34.1

