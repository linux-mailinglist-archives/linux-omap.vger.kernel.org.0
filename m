Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26C2718A8BF
	for <lists+linux-omap@lfdr.de>; Wed, 18 Mar 2020 23:59:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbgCRW5g (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Mar 2020 18:57:36 -0400
Received: from muru.com ([72.249.23.125]:60778 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726647AbgCRW5g (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 18 Mar 2020 18:57:36 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 61D0A819C;
        Wed, 18 Mar 2020 22:58:22 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, ruleh <ruleh@gmx.de>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 1/3] Input: omap4-keypad - disable unused long interrupts
Date:   Wed, 18 Mar 2020 15:57:25 -0700
Message-Id: <20200318225727.29327-2-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200318225727.29327-1-tony@atomide.com>
References: <20200318225727.29327-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We are not using the long interrupts and they produce extra interrupts.
Let's not enable them at all.

Note that also the v3.0.8 Linux Android kernel has long interrupts
disabled.

Cc: Arthur Demchenkov <spinal.by@gmail.com>
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
2.25.1
