Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0B884833C
	for <lists+linux-omap@lfdr.de>; Mon, 17 Jun 2019 14:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbfFQMzo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Jun 2019 08:55:44 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:45045 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727921AbfFQMzo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Jun 2019 08:55:44 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1N3KgE-1ibs0F23KE-010PaW; Mon, 17 Jun 2019 14:55:25 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Paul Walmsley <paul@pwsan.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Kevin Hilman <khilman@kernel.org>, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH, for GregKH] ARM: omap1: remove unused variable
Date:   Mon, 17 Jun 2019 14:55:02 +0200
Message-Id: <20190617125521.1553103-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5sZGK4gs2Z6lmbY+AZRULzOzFNndqrsR+LR3N/b8eoORxP0RDRK
 4cwluOKmjFxZCnLo2qjBpxUUor/ZXJ6iEOFu4JpoLJpxM9m4apj+ajihoQh0JF6jBNqRUk6
 6PPyM14TQksrd7+xKxkYUtkmSnkp4rcQ+bNDJB86ByweuvD+ZWfuaaSvro2a99gv7/O6PtM
 yrVhks6FHyXfuGJOb8tkQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vOzSgpnzn8Y=:1UhMFQ7PRhzaTbKtTHzgsT
 5+AiVHzBehXpewrih74danSoQRVN7gVvj2LwcJMjovTHaV/Wyw4ViTKEqbVzd4scs1XsCGzO1
 Uf0MYtPBFdXpjUY7EdnT9n/Sx3X9ZEv8buU8UjwG9r3csAMpb2DG0k+A8Vwe8WtV+JBbW4hKF
 kkQSzdm3YZz5daeUE8MxrYUfJlpl8jXHmlR9FAsDz748cfxqiwvYi7r6d3oGWCa9krHTvldF9
 ifuTXbZZ6/s9zRxzsA0Iw+lbc7b4iW+MWhBp6MF/HOakiWDQvowMgPEK9q6cGqiJmA60GqvJk
 27fGHmd3qp997d5pGrZUgbUtg+9eRe65Pi4CC42FghZ/FqHhAtMjHZz2YdVhUReZ51Ju0jOxW
 iK6OrUR3wNTS0Of90ifwvPRkTzJ3uXQESeImSIeNO+VSFjTJJ3AffNyJfV7moQF4BdCeZn9pb
 hCStqGC+UbBGwjmOi/U1OhkYFluLjG46BwkaFV70Qkk4z8Xe8AyUaKfreqTQweEvBWTN5djKA
 Knz3ZQT13EC/45cg0E+EsVNclYxV0dkG/qNoIe3nZ7SUde5whaJV4E2nZbdFCaOILpylFzyRz
 jtB/qrS5wmw9P6iKCkc6aUzpkp5z1xXHXycv695xZdFIBNC5BkoTM+Xsykg+Io46UGfoQ0oux
 s4vvsz8urhMUWnUF5BGBe7aAfYcI2fUWZc7SkLo1iRfeIgzBA5Vu8dsZ8s421DQ22epTb8HCj
 uwKQnAgsCRwDixLu77x5b2TVETajW7qitnG9hA==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The cleanup of the debugfs functions left one variable behind that
should now be removed as well:

arch/arm/mach-omap1/clock.c:1008:6: error: unused variable 'err' [-Werror,-Wunused-variable]

Fixes: d5ddd5a51726 ("arm: omap1: no need to check return value of debugfs_create functions")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/clock.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-omap1/clock.c b/arch/arm/mach-omap1/clock.c
index 3d7ab2bcf46c..a5a50efc8e17 100644
--- a/arch/arm/mach-omap1/clock.c
+++ b/arch/arm/mach-omap1/clock.c
@@ -1005,7 +1005,6 @@ static void clk_debugfs_register_one(struct clk *c)
 
 static void clk_debugfs_register(struct clk *c)
 {
-	int err;
 	struct clk *pa = c->parent;
 
 	if (pa && !pa->dent)
-- 
2.20.0

