Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0422F0936
	for <lists+linux-omap@lfdr.de>; Sun, 10 Jan 2021 20:07:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbhAJTGX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 10 Jan 2021 14:06:23 -0500
Received: from muru.com ([72.249.23.125]:42264 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726267AbhAJTGX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 10 Jan 2021 14:06:23 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id A74B180E5;
        Sun, 10 Jan 2021 19:05:41 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, ruleh <ruleh@gmx.de>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 1/5] Input: omap4-keypad - disable unused long interrupts
Date:   Sun, 10 Jan 2021 21:05:25 +0200
Message-Id: <20210110190529.46135-2-tony@atomide.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210110190529.46135-1-tony@atomide.com>
References: <20210110190529.46135-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We are not using the long events and they produce extra interrupts.
Let's not enable them at all.

Note that also the v3.0.8 Linux Android kernel has long interrupts
disabled.

Cc: Arthur Demchenkov <spinal.by@gmail.com>
Cc: Carl Philipp Klemm <philipp@uvos.xyz>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: ruleh <ruleh@gmx.de>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/input/keyboard/omap4-keypad.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
--- a/drivers/input/keyboard/omap4-keypad.c
+++ b/drivers/input/keyboard/omap4-keypad.c
@@ -176,10 +176,9 @@ static int omap4_keypad_open(struct input_dev *input)
 	kbd_write_irqreg(keypad_data, OMAP4_KBD_IRQSTATUS,
 			 kbd_read_irqreg(keypad_data, OMAP4_KBD_IRQSTATUS));
 	kbd_write_irqreg(keypad_data, OMAP4_KBD_IRQENABLE,
-			OMAP4_DEF_IRQENABLE_EVENTEN |
-				OMAP4_DEF_IRQENABLE_LONGKEY);
+			OMAP4_DEF_IRQENABLE_EVENTEN);
 	kbd_writel(keypad_data, OMAP4_KBD_WAKEUPENABLE,
-			OMAP4_DEF_WUP_EVENT_ENA | OMAP4_DEF_WUP_LONG_KEY_ENA);
+			OMAP4_DEF_WUP_EVENT_ENA);
 
 	enable_irq(keypad_data->irq);
 
-- 
2.30.0
