Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EAA7170E2B
	for <lists+linux-omap@lfdr.de>; Thu, 27 Feb 2020 03:04:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728285AbgB0CEM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Feb 2020 21:04:12 -0500
Received: from muru.com ([72.249.23.125]:57982 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728243AbgB0CEM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 26 Feb 2020 21:04:12 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E546A8022;
        Thu, 27 Feb 2020 02:04:56 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 1/2] Input: omap4-keypad - Configure interrupt as level
Date:   Wed, 26 Feb 2020 18:04:06 -0800
Message-Id: <20200227020407.17276-1-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The interrupt should be level high for SoC internal devices.
Otherwise interrupts may not be seen after a wake-up event.

Cc: Arthur Demchenkov <spinal.by@gmail.com>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/input/keyboard/omap4-keypad.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
--- a/drivers/input/keyboard/omap4-keypad.c
+++ b/drivers/input/keyboard/omap4-keypad.c
@@ -344,7 +344,8 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 	}
 
 	error = request_threaded_irq(keypad_data->irq, omap4_keypad_irq_handler,
-				     omap4_keypad_irq_thread_fn, IRQF_ONESHOT,
+				     omap4_keypad_irq_thread_fn,
+				     IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
 				     "omap4-keypad", keypad_data);
 	if (error) {
 		dev_err(&pdev->dev, "failed to register interrupt\n");
-- 
2.25.1
