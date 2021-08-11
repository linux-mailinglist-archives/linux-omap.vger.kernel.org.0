Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA7DF3E8A12
	for <lists+linux-omap@lfdr.de>; Wed, 11 Aug 2021 08:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234756AbhHKGLa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Aug 2021 02:11:30 -0400
Received: from muru.com ([72.249.23.125]:41474 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234770AbhHKGL1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 11 Aug 2021 02:11:27 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 16AB280CF;
        Wed, 11 Aug 2021 06:11:21 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Pavel Machek <pavel@denx.de>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: [PATCH] bus: ti-sysc: Fix error handling for sysc_check_active_timer()
Date:   Wed, 11 Aug 2021 09:10:53 +0300
Message-Id: <20210811061053.32081-1-tony@atomide.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We have changed the return type for sysc_check_active_timer() from -EBUSY
to -ENXIO, but the gpt12 system timer fix still checks for -EBUSY. We are
also not returning on other errors like we did earlier as noted by
Pavel Machek <pavel@denx.de>.

Commit 3ff340e24c9d ("bus: ti-sysc: Fix gpt12 system timer issue with
reserved status") should have been updated for commit 65fb73676112
("bus: ti-sysc: suppress err msg for timers used as clockevent/source").

Let's fix the issue by checking for -ENXIO and returning on any other
errors as suggested by Pavel Machek <pavel@denx.de>.

Fixes: 3ff340e24c9d ("bus: ti-sysc: Fix gpt12 system timer issue with reserved status")
Depends-on: 65fb73676112 ("bus: ti-sysc: suppress err msg for timers used as clockevent/source")
Reported-by: Pavel Machek <pavel@denx.de>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Jarkko Nikula <jarkko.nikula@bitmer.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -3097,8 +3097,10 @@ static int sysc_probe(struct platform_device *pdev)
 		return error;
 
 	error = sysc_check_active_timer(ddata);
-	if (error == -EBUSY)
+	if (error == -ENXIO)
 		ddata->reserved = true;
+	else if (error)
+		return error;
 
 	error = sysc_get_clocks(ddata);
 	if (error)
-- 
2.32.0
