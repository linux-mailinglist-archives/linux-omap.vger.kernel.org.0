Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE9B115B5BC
	for <lists+linux-omap@lfdr.de>; Thu, 13 Feb 2020 01:17:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbgBMARB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Feb 2020 19:17:01 -0500
Received: from gateway30.websitewelcome.com ([50.116.127.1]:24100 "EHLO
        gateway30.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729256AbgBMARA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Wed, 12 Feb 2020 19:17:00 -0500
X-Greylist: delayed 1214 seconds by postgrey-1.27 at vger.kernel.org; Wed, 12 Feb 2020 19:17:00 EST
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
        by gateway30.websitewelcome.com (Postfix) with ESMTP id 32FF67279C
        for <linux-omap@vger.kernel.org>; Wed, 12 Feb 2020 17:56:46 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id 21s6jmjHyXVkQ21s6jAohf; Wed, 12 Feb 2020 17:56:46 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=/EEuWjIs24zKWMIqBOvxcb5j49JwVhYdPasyL1DoPcI=; b=f39zQB0NnhSRj5vhaap+92XVNE
        xeAw/tYgbka4ARFX6aMzPd1+63LR4h0GXQEV/haTWYmf1y5s0m9UYd/cTLRreqzjlnTxQ+OvQvziw
        7KMZWzHzONfscu6Go9KdVoSK1UfBbcqQnGn+WV28xlsbPaadi5TZ9fySDFUrPfOeTRHQ2agR34XP4
        ZggByW/Y34dLChIkjXbUme/OtWzjghVZF/iBCnkl89iN1j9g4j5RDc1+6A7mMWPRkgNg9t/F0wGWg
        9nlf8zluM7fsPEiCy9NFqGcENnN6NHg4a7oiq8z/Ms2CGnyAb2Gawgl9gHA05pob3jPCT5Q9V31NI
        iRmDeNFw==;
Received: from [200.68.141.42] (port=22005 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1j21s4-003LCB-B0; Wed, 12 Feb 2020 17:56:44 -0600
Date:   Wed, 12 Feb 2020 17:56:42 -0600
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>
Cc:     linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] mfd: omap-usb-tll: Replace zero-length array with
 flexible-array member
Message-ID: <20200212235642.GA19206@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 200.68.141.42
X-Source-L: No
X-Exim-ID: 1j21s4-003LCB-B0
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [200.68.141.42]:22005
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 9
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/mfd/omap-usb-tll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
index 265f5e350e1c..1cf259a48966 100644
--- a/drivers/mfd/omap-usb-tll.c
+++ b/drivers/mfd/omap-usb-tll.c
@@ -99,7 +99,7 @@
 struct usbtll_omap {
 	void __iomem	*base;
 	int		nch;		/* num. of channels */
-	struct clk	*ch_clk[0];	/* must be the last member */
+	struct clk	*ch_clk[];	/* must be the last member */
 };
 
 /*-------------------------------------------------------------------------*/
-- 
2.23.0

