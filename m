Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD07E18A907
	for <lists+linux-omap@lfdr.de>; Thu, 19 Mar 2020 00:10:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727231AbgCRXJp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Mar 2020 19:09:45 -0400
Received: from muru.com ([72.249.23.125]:60832 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726647AbgCRXJo (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 18 Mar 2020 19:09:44 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B8208819C;
        Wed, 18 Mar 2020 23:10:29 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Henrik Rydberg <rydberg@bitmath.org>,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH 2/3] Input: atmel_mxt_ts - add idle power config
Date:   Wed, 18 Mar 2020 16:09:37 -0700
Message-Id: <20200318230938.31573-2-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200318230938.31573-1-tony@atomide.com>
References: <20200318230938.31573-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can save few tens of mW of power during runtime. Let's add a new idle
power config where we minimize the active time and maximize the idle time.

Then we can use the new idle setting based on runtime PM autosuspend in
the following patch.

Let's also start using enum mxt_power_cfg while at it.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 27 +++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -97,8 +97,11 @@ struct t7_config {
 	u8 active;
 } __packed;
 
-#define MXT_POWER_CFG_RUN		0
-#define MXT_POWER_CFG_DEEPSLEEP		1
+enum mxt_power_cfg {
+	MXT_POWER_CFG_RUN,
+	MXT_POWER_CFG_IDLE,
+	MXT_POWER_CFG_DEEPSLEEP,
+};
 
 /* MXT_TOUCH_MULTI_T9 field */
 #define MXT_T9_CTRL		0
@@ -2155,17 +2158,31 @@ static int mxt_initialize(struct mxt_data *data)
 	return 0;
 }
 
-static int mxt_set_t7_power_cfg(struct mxt_data *data, u8 sleep)
+/*
+ * Note that active value 0 forces the controller to idle so 1 is the shortest
+ * active periiod with interrupts still working. Idle value of 255 blocks idle
+ * completely so 254 is the maximum idle time we can use.
+ */
+static int mxt_set_t7_power_cfg(struct mxt_data *data,
+				enum mxt_power_cfg config)
 {
 	struct device *dev = &data->client->dev;
 	int error;
 	struct t7_config *new_config;
 	struct t7_config deepsleep = { .active = 0, .idle = 0 };
+	struct t7_config idle = { .active = 1, .idle = 254 };
 
-	if (sleep == MXT_POWER_CFG_DEEPSLEEP)
+	switch (config) {
+	case MXT_POWER_CFG_IDLE:
+		new_config = &idle;
+		break;
+	case MXT_POWER_CFG_DEEPSLEEP:
 		new_config = &deepsleep;
-	else
+		break;
+	default:
 		new_config = &data->t7_cfg;
+		break;
+	}
 
 	error = __mxt_write_reg(data->client, data->T7_address,
 				sizeof(data->t7_cfg), new_config);
-- 
2.25.1
