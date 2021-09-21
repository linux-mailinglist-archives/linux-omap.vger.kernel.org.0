Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 279544131A3
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 12:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231939AbhIUKf1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 06:35:27 -0400
Received: from muru.com ([72.249.23.125]:35522 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231823AbhIUKf0 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Sep 2021 06:35:26 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 37951812F;
        Tue, 21 Sep 2021 10:34:24 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] tty: n_gsm: Don't ignore write return value in gsmld_output()
Date:   Tue, 21 Sep 2021 13:33:42 +0300
Message-Id: <20210921103346.64824-3-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921103346.64824-1-tony@atomide.com>
References: <20210921103346.64824-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We currently have gsmld_output() ignore the return value from device
write. This means we will lose packets if device write returns 0 or
an error.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/tty/n_gsm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/n_gsm.c b/drivers/tty/n_gsm.c
--- a/drivers/tty/n_gsm.c
+++ b/drivers/tty/n_gsm.c
@@ -687,7 +687,7 @@ static void gsm_data_kick(struct gsm_mux *gsm, struct gsm_dlci *dlci)
 			print_hex_dump_bytes("gsm_data_kick: ",
 					     DUMP_PREFIX_OFFSET,
 					     gsm->txframe, len);
-		if (gsmld_output(gsm, gsm->txframe, len) < 0)
+		if (gsmld_output(gsm, gsm->txframe, len) <= 0)
 			break;
 		/* FIXME: Can eliminate one SOF in many more cases */
 		gsm->tx_bytes -= msg->len;
@@ -2358,8 +2358,7 @@ static int gsmld_output(struct gsm_mux *gsm, u8 *data, int len)
 	if (debug & 4)
 		print_hex_dump_bytes("gsmld_output: ", DUMP_PREFIX_OFFSET,
 				     data, len);
-	gsm->tty->ops->write(gsm->tty, data, len);
-	return len;
+	return gsm->tty->ops->write(gsm->tty, data, len);
 }
 
 /**
-- 
2.33.0
