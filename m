Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0477CCCDE4
	for <lists+linux-omap@lfdr.de>; Sun,  6 Oct 2019 04:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbfJFCdT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 5 Oct 2019 22:33:19 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:33475 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbfJFCdT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 5 Oct 2019 22:33:19 -0400
Received: by mail-io1-f68.google.com with SMTP id z19so21684523ior.0;
        Sat, 05 Oct 2019 19:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=HIOpkaYk/LdhNeJZnSkbF455Ac5gPraX0S6ROVZRNtg=;
        b=lkENuWgVYOr+0FINXrsfRgS2ooQ1Fd8KQrhsNtuK47tukg2c/0pxvINxQIbPjo6tl0
         5RK/oL4PSowKSSKk8x39r5ZD3qoYh31/fdD9J/UGVDD1iHi7Akl4fWF/X/FQXmW/+e5P
         0HWOsuf409TdeqUFexZGZ6K58iKtS6W1Q2LNZlLBkHjx6GY1tHi9rw4cRbqWSLAPu4f7
         rR/4yZFjs0mP97d1qMlaIUdGDLMa64w+m3KAOfYEfxwdlJPvkZa6ZqQy41UKB+kgCLlP
         U5b6cMPeFaCuj+/mkiAg3rJl/rd1sSnqik/Zlm0IADC9e9kEDXzjBkwF2/jf0zPs+ilX
         IvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HIOpkaYk/LdhNeJZnSkbF455Ac5gPraX0S6ROVZRNtg=;
        b=sdwBFmT3Sj5c/gjoWEHHXVTmd3QAvo4tYuqrqpPUejQ1Z5AwE9B9TUxgs+tnYOj2t3
         LKtsBeSKYf7CRBmObUxu4uT8N6YJtc2tj4bdmfuBS0fkYFHQiAJ34F5TFCBs+ueODnkP
         2NThWNDyq9mQCClThh33RTpqfHnkrpnu8W4O2FEGpDP2yPbdbYgraXN/ZAzH4PYbspNI
         LXTTejsIm8V/7p8YeyTpLCX9azfPzrjwQhy9Hn7SIXDOqliAkOSM4dyrb+2XlZ/5Ty6T
         fQ8gaHcYAmFoHQyptT0HVCbc1FNEhMZZVWqwxwlAvY7bmu1HxyQJ+2sPS0bkhia+DdMp
         vdtQ==
X-Gm-Message-State: APjAAAUTf8gqmeOBQldNnRfWQQV96l4ngwlxIV1cI08urYQZz8xwxBPx
        3gfTfdrlPU77tUYeDU8GrlZOYcQG
X-Google-Smtp-Source: APXvYqx+Hi3qVmUmyjC+UjEP/BasijEGykJofjqeqhWQyD1nCRW+dKbmCucPTXnSCIslCe/Liy2uUQ==
X-Received: by 2002:a92:169d:: with SMTP id 29mr23172307ilw.146.1570329197511;
        Sat, 05 Oct 2019 19:33:17 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id v17sm6109149ill.76.2019.10.05.19.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2019 19:33:16 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-serial@vger.kernel.org
Cc:     adam.ford@logicpd.com, linux-omap@vger.kernel.org,
        Adam Ford <aford173@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, Vignesh R <vigneshr@ti.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yegor Yefremov <yegorslists@googlemail.com>,
        Tony Lindgren <tony@atomide.com>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] serial: 8250_omap: Fix gpio check for auto RTS and CTS
Date:   Sat,  5 Oct 2019 21:32:52 -0500
Message-Id: <20191006023254.23841-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

There are two checks to see if the manual gpio is configured, but
these the check is seeing if the structure is NULL instead it
should check to see if there are CTS and/or RTS pins defined.

This patch uses checks for those individual pins instead of
checking for the structure itself.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index c68e2b3a1634..836e736ae188 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -141,7 +141,7 @@ static void omap8250_set_mctrl(struct uart_port *port, unsigned int mctrl)
 
 	serial8250_do_set_mctrl(port, mctrl);
 
-	if (!up->gpios) {
+	if (!mctrl_gpio_to_gpiod(up->gpios, UART_GPIO_RTS)) {
 		/*
 		 * Turn off autoRTS if RTS is lowered and restore autoRTS
 		 * setting if RTS is raised
@@ -456,7 +456,8 @@ static void omap_8250_set_termios(struct uart_port *port,
 	up->port.status &= ~(UPSTAT_AUTOCTS | UPSTAT_AUTORTS | UPSTAT_AUTOXOFF);
 
 	if (termios->c_cflag & CRTSCTS && up->port.flags & UPF_HARD_FLOW &&
-	    !up->gpios) {
+	    !mctrl_gpio_to_gpiod(up->gpios, UART_GPIO_RTS) &&
+	    !mctrl_gpio_to_gpiod(up->gpios, UART_GPIO_CTS)) {
 		/* Enable AUTOCTS (autoRTS is enabled when RTS is raised) */
 		up->port.status |= UPSTAT_AUTOCTS | UPSTAT_AUTORTS;
 		priv->efr |= UART_EFR_CTS;
-- 
2.17.1

