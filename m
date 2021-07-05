Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 107AC3BC32E
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jul 2021 21:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbhGETnL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Jul 2021 15:43:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbhGETnK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Jul 2021 15:43:10 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA595C061574
        for <linux-omap@vger.kernel.org>; Mon,  5 Jul 2021 12:40:32 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id t30so5957351ljo.5
        for <linux-omap@vger.kernel.org>; Mon, 05 Jul 2021 12:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2U0wvxPRKxvDIv/UsBUgP1f1+9ZNjFw1lh7hg331W6o=;
        b=LP7li9WxtyVh6I4wyeda/ydzYLij+dGAuC4DGZksPaI1cVn+R8/rq9EgLPUTZ8jCt8
         kGzm96nodNX0cAg3wL0PTyAOJSgfTBOMvR9FlSw4HJLIsm28hkdUWdegoq9x97NPZo5d
         fHC/hKVCtjW+Roc/+V3gJEZDuQHcxiSmH0zJgiSEdryZOMb4tKA/ti4XftJkxioaDnff
         2myBI5regMViCbspFLMBC5G5IgIQScqM1ewA1KFijvG82nPg1oIZ+JomQfGp5G0VT74Y
         ize6fXJehGpHoElHYbdjyyQqBZ7BcV8O+tMZj+sdrq/XkIHtQ+qh2H0HTCHqVHb99ld6
         Z7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2U0wvxPRKxvDIv/UsBUgP1f1+9ZNjFw1lh7hg331W6o=;
        b=Pr4kkWFMmAb5RQxEM/7dg85WjpFp92ToaolwNFenA8hPZuex8huzSDj2vl4QOEHs8I
         nLuGEbxbp01AXbti4ZrLsy1qivFQtrcBVUeprd5nsljyJ7PCsGLuf96QYwTStnUdO7CR
         BLkHfR4nrREMZWGuOcLQdItmO3kPQSPOCcfjngRcQrT3cKxOY61+A8cfgZ9sDBPBfr3+
         30Y+6agxQ/HBGoTJdtXjxfzq3FwsZLGFpEhxrSgJWrG8MixPLxDAGAYB8zvEdaDCEAdt
         tKUCfnP8wGTmxCAIM047c1D8uF4gIyBYKGS2J4iS0KXpKAFHNF+G475IcYlmkPNIxX1B
         YQYg==
X-Gm-Message-State: AOAM533L8uGuUr9FCjZ9TO52mPQos0K+7tR/Btm/fceZQdEm/jg/phd3
        snv1Ef8VznBsfTyKel8Ax1oUAbU0c2LJEhBq
X-Google-Smtp-Source: ABdhPJzs3XKPF7dxtOZ7jnHpnB9/6EpP5VmrK9kqc4/pd1Kc/4KaZF2AI/infMrzAk0zyqsFzK0jKw==
X-Received: by 2002:a2e:4c19:: with SMTP id z25mr12351302lja.47.1625514031141;
        Mon, 05 Jul 2021 12:40:31 -0700 (PDT)
Received: from localhost.localdomain (91-155-111-71.elisa-laajakaista.fi. [91.155.111.71])
        by smtp.gmail.com with ESMTPSA id b5sm1167248lfv.3.2021.07.05.12.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 12:40:30 -0700 (PDT)
From:   Peter Ujfalusi <peter.ujfalusi@gmail.com>
To:     broonie@kernel.org, tony@atomide.com
Cc:     alsa-devel@alsa-project.org, lgirdwood@gmail.com,
        linux-omap@vger.kernel.org, hns@goldelico.com
Subject: [PATCH v2 0/5] ASoC: ti: davinci-mcasp: Fix the DIT mode and OMAP4 support
Date:   Mon,  5 Jul 2021 22:42:44 +0300
Message-Id: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

Changes since v1:
- Do not calculat that we allow one serializer in DIT mode, just set the
  max_active_serializers to 1.
  Reported-by: kernel test robot <lkp@intel.com>

it has been on my todo list for several years to support McASP on OMAP4 devices.
For Galaxy Nexus we had an omap-mcasp driver (which was mostly a stripped down
davinci-mcasp driver) to support what was needed on that specific phone + it's
dock for S/PDIF (48KHz, 16bit, stereo).

Not many (if any) device available to test the DIT mode of McASP.
I have used BeagleBone White (McASP1 AXR3 can be routed to a pin) to get the
S/PDIF mode working then PandaES for OMAP4 support (on PandaES the gpio_121 is
not used and the signal is routed to expansion J6 pin14).

In theory the McASP in OMAP5 should be working after this series, but the OMAP5
TRM is not public and I do not have one to check the addresses and see if there
is a way to test it on omap5-uevm.

Mark, Tony:
The ASoC and dts patches can go via separate tree I felt that it is better if
they are together, at least initially.

Nikolaus: fyi, this might be useful for Pyra?

Regards,
Péter
---
Peter Ujfalusi (5):
  ASoC: ti: davinci-mcasp: Fix DIT mode support
  ASoC: dt-bindings: davinci-mcasp: Add compatible string for OMAP4
  ASoC: ti: davinci-mcasp: Add support for the OMAP4 version of McASP
  ARM: dts: omap4-l4-abe: Correct sidle modes for McASP
  ARM: dts: omap4-l4-abe: Add McASP configuration

 .../bindings/sound/davinci-mcasp-audio.txt    |   1 +
 arch/arm/boot/dts/omap4-l4-abe.dtsi           |  39 ++--
 include/linux/platform_data/davinci_asp.h     |   1 +
 sound/soc/ti/Kconfig                          |   1 +
 sound/soc/ti/davinci-mcasp.c                  | 176 +++++++++++++++---
 5 files changed, 175 insertions(+), 43 deletions(-)

-- 
2.32.0

