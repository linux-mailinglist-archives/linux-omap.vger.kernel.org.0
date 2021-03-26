Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9628634B1AF
	for <lists+linux-omap@lfdr.de>; Fri, 26 Mar 2021 23:01:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbhCZWAh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 26 Mar 2021 18:00:37 -0400
Received: from mga04.intel.com ([192.55.52.120]:61331 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230076AbhCZWAS (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 26 Mar 2021 18:00:18 -0400
IronPort-SDR: tgDjlUKxqiWb+UA/Za2tn9Xm31NjnKHx0ZO+i5qvKogGzoSAleCrp0WCibgZFT/kmB3clMjtK1
 vCLqPx+rNH2Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9935"; a="188957161"
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; 
   d="scan'208";a="188957161"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2021 15:00:17 -0700
IronPort-SDR: L69N9VpMxxYFEMXkpmZM/AoW24ukbCE7ajCVSK54wsNGlrbfNhw4hIsTWntdYiyBR1RF8VVD1d
 SfVNsZVn7PwQ==
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; 
   d="scan'208";a="416706915"
Received: from zcmahone-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com) ([10.255.231.203])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2021 15:00:16 -0700
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
Subject: [PATCH 14/17] ASoC: ti: omap-abe-twl6040: remove useless assignment
Date:   Fri, 26 Mar 2021 16:59:24 -0500
Message-Id: <20210326215927.936377-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
References: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

cppcheck warning:

sound/soc/ti/omap-abe-twl6040.c:173:10: style: Variable 'ret' is
assigned a value that is never used. [unreadVariable]
 int ret = 0;
         ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/ti/omap-abe-twl6040.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/omap-abe-twl6040.c b/sound/soc/ti/omap-abe-twl6040.c
index 16ea039ff865..91cc9a4f44d7 100644
--- a/sound/soc/ti/omap-abe-twl6040.c
+++ b/sound/soc/ti/omap-abe-twl6040.c
@@ -170,7 +170,7 @@ static int omap_abe_twl6040_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_card *card = rtd->card;
 	struct abe_twl6040 *priv = snd_soc_card_get_drvdata(card);
 	int hs_trim;
-	int ret = 0;
+	int ret;
 
 	/*
 	 * Configure McPDM offset cancellation based on the HSOTRIM value from
-- 
2.25.1

