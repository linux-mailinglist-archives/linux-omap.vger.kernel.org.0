Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3271F1C5800
	for <lists+linux-omap@lfdr.de>; Tue,  5 May 2020 16:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729315AbgEEOEd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 May 2020 10:04:33 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:47851 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728135AbgEEOEc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 May 2020 10:04:32 -0400
Received: from localhost.localdomain ([149.172.19.189]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1Md6AP-1ixBSU2MgF-00aDyq; Tue, 05 May 2020 16:04:09 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marco Elver <elver@google.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Allison Randal <allison@lohutok.net>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Enrico Weigelt <info@metux.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: [PATCH] omapfb: don't annotate dss_conv_list as __initdata
Date:   Tue,  5 May 2020 16:03:52 +0200
Message-Id: <20200505140407.373983-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:b7GTK4JxzyLmn2gIsYhgbVf/xIlBzgBQDzJn6IhgPioBvsvScLO
 hkBobGOJ16kEh5G53aN++eiN7fEy2+8WNjNT2oAAh+pto0naL3H5RGdPuiPGftRLYE+WWk6
 AARHIaGwYWpgUPXoaHmYhwOoJNFWjRb9NvVIVNJ1vaGDXFt+mHz9QyUnAZl6/+oWiMZPV/U
 jTlT9OnyODlD3fxIq7spw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kJXlH+hW/RM=:GF6iW7yf/Pyctg3y13GUV2
 FqaS5odzEtD72BBRKOElhcz2U29q1LNd/0g9U9cvxHcoGNelA0e2X+cWbz9NoPViSRltONkbm
 LGFE+3SZlqFaNTw6HHnzmjvCuCr0ZCnNxcORk1uAX+Sey3pNmJg2E4YT1mR7/HMrhT54dR9ts
 J4X5/BFzLGeko86ZgOn9pIDklBlnCoK6I5TjvbVjBYP1n6iO1zpOuv4DVRQ1XIdvqm0Afyx6Q
 NN9DNF/UxpQnwNk6AxRh+ZAYljaQMy6P/nNk8rSnCKfInuMJvpLLRlzTGRQfwwH51hZ/qH6kJ
 GVRF5EJgFdrY/GmQxvz7qdg6pZRs5bnMigu8+zm028MNOcJmaGY7EZp4KW1fS8JHoRa1b7FKg
 zag7CBsFaMmPV22qZvJdIIDm0wl5M6BqnQYGxLhrc2Rr0CPFRbHNQ5IGfXehZbjPhZ9hfKqwJ
 B6HdayRKMOpYvsMoivRxljBAGW8MRnMNWtuWKgjAFTdWacPd9pqEdzEJv4rZXVo2ufbp//ZUb
 gHYy4n7XY5GyijCSW9fVbHqO7dYRzg84I3dRveYdKcWxkUqz4Hc6HXFkPgmW9DRysy9glOIZp
 D0GqunN4gpNaJQYpfCS7+U+LA4mR4UiyESvK+5oVfVIB+uAVYMijAw1/n2v5iEGvZfAD9ejp5
 La0lZdiWAcQSxK+M/9XNjltEvLvOA3ImAHOawsmGo4wRlXMTXm/6Q4nTx48oalue2KSKvBOuj
 0yjErUk/kCOrAMj0XMFmXosWZZFAbd/GbAaeFNtG3GQw0Y/IqMaFg9Slu2BZtppe+LVNj9Vb2
 BAdW/soKwj4RV9o1kG+AcGs+1G+ryxdeSkhmSUU9+eHuQkZ5uY=
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

With the kcsan changes, __read_once_size() is not inlined, but
clang can decide to emit a version that hardcodes the address, which
in turn triggers a warning for dss_conv_list being __initdata but
__read_once_size() not being __init:

WARNING: modpost: vmlinux.o(.text+0x6e4d7a): Section mismatch in
reference from the function __read_once_size() to the variable
.init.data:dss_conv_list
The function __read_once_size() references
the variable __initdata dss_conv_list.
This is often because __read_once_size lacks a __initdata
annotation or the annotation of dss_conv_list is wrong.

This is clearly a false positive warning, but it's hard to tell
who is to blame for it. Work around it by removing the __initdata
annotation, wasting the space of two pointers in return for getting
rid of the warning.

Fixes: dfd402a4c4ba ("kcsan: Add Kernel Concurrency Sanitizer infrastructure")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c b/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
index 0ae0cab252d3..29fdff9c95f6 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
@@ -19,7 +19,7 @@
 #include <linux/slab.h>
 #include <linux/list.h>
 
-static struct list_head dss_conv_list __initdata;
+static struct list_head dss_conv_list;
 
 static const char prefix[] __initconst = "omapdss,";
 
-- 
2.26.0

