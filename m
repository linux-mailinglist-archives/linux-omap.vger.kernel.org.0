Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98F852BF51
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2019 08:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727615AbfE1GYi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 May 2019 02:24:38 -0400
Received: from muru.com ([72.249.23.125]:51424 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727609AbfE1GYi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 28 May 2019 02:24:38 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id F149A812F;
        Tue, 28 May 2019 06:24:56 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 08/13] bus: ti-sysc: Set ENAWAKEUP if available
Date:   Mon, 27 May 2019 23:24:09 -0700
Message-Id: <20190528062414.27192-9-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190528062414.27192-1-tony@atomide.com>
References: <20190528062414.27192-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Some modules have ENAWAKEUP bit that we need to configure when not
relying on platform data callbacks.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -881,6 +881,11 @@ static int sysc_enable_module(struct device *dev)
 			dev_err(dev, "%s: invalid sidlemode\n", __func__);
 			return -EINVAL;
 		}
+
+		/* Set WAKEUP */
+		if (regbits->enwkup_shift >= 0 &&
+		    ddata->cfg.sysc_val & BIT(regbits->enwkup_shift))
+			reg |= BIT(regbits->enwkup_shift);
 	}
 
 	reg &= ~(SYSC_IDLE_MASK << regbits->sidle_shift);
-- 
2.21.0
