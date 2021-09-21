Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A391641319F
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 12:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231887AbhIUKfY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 06:35:24 -0400
Received: from muru.com ([72.249.23.125]:35518 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231823AbhIUKfY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Sep 2021 06:35:24 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3FF7E8127;
        Tue, 21 Sep 2021 10:34:22 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] n_tty: Start making use of -EAGAIN returned from process_output_block()
Date:   Tue, 21 Sep 2021 13:33:41 +0300
Message-Id: <20210921103346.64824-2-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921103346.64824-1-tony@atomide.com>
References: <20210921103346.64824-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We check for -EAGAIN in n_tty_write() but never currently get it from
process_output_block(). Let's add -EAGAIN handling and break out with 0
bytes processed. Note that if we return -EAGAIN from n_tty_write(), it
will be treated as error by the caller rather than a retry.

Looking at the patch description for commit 9ef8927f45f2 ("n_tty: check
for negative and zero space return from tty_write_room") it looks like we
have not made use of -EGAIN from process_output_block() so far, so this
does not seem like it's currently needed as a fix.

We can use -EAGAIN for serial layer power management changes as we now
will make use of write_room() returning 0 for an idled serial port.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/tty/n_tty.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/n_tty.c b/drivers/tty/n_tty.c
--- a/drivers/tty/n_tty.c
+++ b/drivers/tty/n_tty.c
@@ -549,6 +549,8 @@ static ssize_t process_output_block(struct tty_struct *tty,
 	space = tty_write_room(tty);
 	if (space <= 0) {
 		mutex_unlock(&ldata->output_lock);
+		if (!space)
+			space = -EAGAIN;
 		return space;
 	}
 	if (nr > space)
@@ -2287,8 +2289,10 @@ static ssize_t n_tty_write(struct tty_struct *tty, struct file *file,
 			while (nr > 0) {
 				ssize_t num = process_output_block(tty, b, nr);
 				if (num < 0) {
-					if (num == -EAGAIN)
-						break;
+					if (num == -EAGAIN) {
+						retval = 0;
+						goto break_out;
+					}
 					retval = num;
 					goto break_out;
 				}
-- 
2.33.0
