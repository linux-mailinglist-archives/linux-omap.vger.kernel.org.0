Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5906556978A
	for <lists+linux-omap@lfdr.de>; Thu,  7 Jul 2022 03:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234876AbiGGBeE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Jul 2022 21:34:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234889AbiGGBeC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 6 Jul 2022 21:34:02 -0400
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F2F2ED65
        for <linux-omap@vger.kernel.org>; Wed,  6 Jul 2022 18:33:59 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2671XuiC018721;
        Wed, 6 Jul 2022 20:33:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1657157636;
        bh=2hV4yAhibiXXfo3vfWVagKC5tdsyHsYjdHP2fkFDgJs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=pfZvAtmEZG9s/CfQNsgooRCN+B/B4/u/PZwfhG5qqmBkgA4SbE0nmOtA8n80FXZk+
         QlHrorFn5k7ym4PCQGbnUCHUjo0ZimtLBug4ryx7mTvlQY6CPi0MuDTXf4D09GxWDO
         pKn39ChCfwLhq4AkhUVcNPP68yKDcQY1iKcWHvRE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2671Xuio043230
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 6 Jul 2022 20:33:56 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 6
 Jul 2022 20:33:56 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 6 Jul 2022 20:33:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2671XtWr019968;
        Wed, 6 Jul 2022 20:33:55 -0500
From:   Nishanth Menon <nm@ti.com>
To:     <glaroque@baylibre.com>, <vigneshr@ti.com>,
        <linux-omap@vger.kernel.org>
CC:     Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <praneeth@ti.com>, <khilman@baylibre.com>
Subject: Re: [PATCH v4] arm64: dts: ti: k3-am625-sk: enable ramoops
Date:   Wed, 6 Jul 2022 20:33:55 -0500
Message-ID: <165715760732.14184.3989595493247484427.b4-ty@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220517122828.2985179-1-glaroque@baylibre.com>
References: <20220517122828.2985179-1-glaroque@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Guillaume La Roque,

On Tue, 17 May 2022 14:28:28 +0200, Guillaume La Roque wrote:
> Enable ramoops features to easily debug some issues.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am625-sk: Enable ramoops
      commit: e2788887b33f00c4fabbfa251c8efb6bec1fba2e

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

