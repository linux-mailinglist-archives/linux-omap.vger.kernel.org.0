Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99EFA74A3E
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jul 2019 11:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727747AbfGYJp4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Jul 2019 05:45:56 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:53751 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbfGYJpz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 25 Jul 2019 05:45:55 -0400
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 4093BE0005;
        Thu, 25 Jul 2019 09:45:53 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 0/3]  regulator: twl6030: Fix the VMMC reset behavior
Date:   Thu, 25 Jul 2019 11:45:39 +0200
Message-Id: <20190725094542.16547-1-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello,

With the TWL6030 PMIC, during reset the VMMC regulator doesn't reach
0V and only drops to 1.8V, furthermore the pulse width is under 200us
whereas the SD specification expect 1ms.

Fortunately, the WR_S bit allows the TWL6030 to no reset at all the
VMMC during warm reset and keep the current voltage. Thanks to this
workaround the SD card doesn't reach a undefined reset stage.

The first patch describes the new property needed for this "feature".

The second one is just a small cleanup done while I wrote the last
patch, but as it was not really related to the feature itself, I made
a separate patch for it.

The last patch adds the feature in the driver.

Gregory

Gregory CLEMENT (3):
  dt-bindings: regulator: twl6030: Add retain-on-reset property
  regulator: twl6030: use variable for device node
  regulator: twl6030: workaround the VMMC reset behavior

 .../bindings/regulator/twl-regulator.txt      |  7 +++++++
 drivers/regulator/twl6030-regulator.c         | 21 +++++++++++++++----
 2 files changed, 24 insertions(+), 4 deletions(-)

-- 
2.20.1

