Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 986AF34B1AD
	for <lists+linux-omap@lfdr.de>; Fri, 26 Mar 2021 23:01:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbhCZWAh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 26 Mar 2021 18:00:37 -0400
Received: from mga04.intel.com ([192.55.52.120]:61331 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230416AbhCZWAT (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 26 Mar 2021 18:00:19 -0400
IronPort-SDR: NIURe4pAK8sVOlm6nK+bg7e2KehHkYVENbnSXyGgOFC022Ne8zyCvBtnI7Gk8YlRK1+U6hl/xS
 nYC0f3YLQWhw==
X-IronPort-AV: E=McAfee;i="6000,8403,9935"; a="188957164"
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; 
   d="scan'208";a="188957164"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2021 15:00:18 -0700
IronPort-SDR: ASrSkSy8ZzswgpddkfExnkweIrF0cmWYNKVfEIkWOgDZgL5x4QQMuVTx979VYSanpiBWsvpsoE
 oMy7OKeqDUbw==
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; 
   d="scan'208";a="416706935"
Received: from zcmahone-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com) ([10.255.231.203])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2021 15:00:17 -0700
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To:     alsa-devel@alsa-project.org
Cc:     tiwai@suse.de, broonie@kernel.org, linux-kernel@vger.kernel.org,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        linux-omap@vger.kernel.org (open list:OMAP AUDIO SUPPORT)
Subject: [PATCH 15/17] ASoC: ti: omap-mcsp: remove duplicate test
Date:   Fri, 26 Mar 2021 16:59:25 -0500
Message-Id: <20210326215927.936377-16-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
References: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

cppcheck warning:

sound/soc/ti/omap-mcbsp.c:379:11: style: The if condition is the same
as the previous if condition [duplicateCondition]

 if (mcbsp->irq) {
          ^
sound/soc/ti/omap-mcbsp.c:376:11: note: First condition
 if (mcbsp->irq)
          ^
sound/soc/ti/omap-mcbsp.c:379:11: note: Second condition
 if (mcbsp->irq) {
          ^

Keeping two separate tests was probably intentional for clarity, but
since this generates warnings we might as well make cppcheck happy so
that we have fewer warnings.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/ti/omap-mcbsp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index 6025b30bbe77..db47981768c5 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -373,10 +373,9 @@ static void omap_mcbsp_free(struct omap_mcbsp *mcbsp)
 		MCBSP_WRITE(mcbsp, WAKEUPEN, 0);
 
 	/* Disable interrupt requests */
-	if (mcbsp->irq)
+	if (mcbsp->irq) {
 		MCBSP_WRITE(mcbsp, IRQEN, 0);
 
-	if (mcbsp->irq) {
 		free_irq(mcbsp->irq, (void *)mcbsp);
 	} else {
 		free_irq(mcbsp->rx_irq, (void *)mcbsp);
-- 
2.25.1

