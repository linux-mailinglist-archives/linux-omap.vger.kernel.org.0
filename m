Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED7B43BAD8E
	for <lists+linux-omap@lfdr.de>; Sun,  4 Jul 2021 17:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbhGDPFL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 4 Jul 2021 11:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbhGDPFL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 4 Jul 2021 11:05:11 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BD70C061574
        for <linux-omap@vger.kernel.org>; Sun,  4 Jul 2021 08:02:35 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id d25so20917403lji.7
        for <linux-omap@vger.kernel.org>; Sun, 04 Jul 2021 08:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/xTN97w8XIGDTjxvTLbrfb/afaXrPnyo60XpFbJbFNc=;
        b=NbADD9+779eUTcOL97RoK3y83GFYbdFskagr7niqpCqjGw3mmIetLbv8U/hFMDKmTB
         PokV0QEuqTP2ory/M/34m4xpZq6re/iTbM+eI4m7kpvweWmf7iyp00lIu87Koh1+lr6o
         dLJkBvO2QGCcHGeBi5VV/Gw94CfYvVhXmnllbDTebehtTnHueq8iLjiU+URC8mwVsTOw
         24RG7Jp5DDjVnrbeOcqTC3446Y+B5zV9WhZNJFxr7iitOrkZmEGJ/BVK0xF2yiEPuEQY
         T+ocLk3PZ3SLRpUihqXGCpPwsD79XgnxADpdyPZnmuwn1OvHCiY+KPsNE5brIWZrwiIN
         o+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/xTN97w8XIGDTjxvTLbrfb/afaXrPnyo60XpFbJbFNc=;
        b=gO6sng4BJXAlTsgpSsxQj6+EpR5dlsrUU5aTBkjaRgkfT73Is4V3HLIFs1ZFWAGKMm
         7pSPbLZ/zG8jVpP+5tem8qLypTT5UZUrWnTVsCo6nBPyGedryOwF7xxcAfQFk9efFDwI
         UfYR25wWj10ns1ZDxG2bHBGgBRKWSiol+tZpbplB2Zt2Dw1ktZuEPu788Zfq0IF9db8w
         YLqaBmPdH83etfP2LjZGpQxVd68QlCDMyP52Q+QjMOpKYKytodxouO0T+VKPTpYsZb7W
         paWlUtbEj2uId64TPzn6chTYuOytSxjQD0lLxZXQYiI4VBLsScellvPrZJpU367p7iAv
         CO2Q==
X-Gm-Message-State: AOAM530yXXXRe6cS/pNyWHQ46C/aafY4+K2SRinQC34yk/fUHMF86ujD
        KoIK3d84QrU8bBR0kWHEtbZJNHOR8F4=
X-Google-Smtp-Source: ABdhPJyXzi8stOptuSmyIr/cDlu0eVO6W3HQthBg6222BpaKwGnxJPww36YudAw+sOST2Y5/dl4lGQ==
X-Received: by 2002:a2e:89d6:: with SMTP id c22mr7639726ljk.132.1625410953365;
        Sun, 04 Jul 2021 08:02:33 -0700 (PDT)
Received: from localhost.localdomain (91-155-111-71.elisa-laajakaista.fi. [91.155.111.71])
        by smtp.gmail.com with ESMTPSA id k11sm268826lfc.272.2021.07.04.08.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 08:02:31 -0700 (PDT)
From:   Peter Ujfalusi <peter.ujfalusi@gmail.com>
To:     broonie@kernel.org, tony@atomide.com
Cc:     alsa-devel@alsa-project.org, lgirdwood@gmail.com,
        linux-omap@vger.kernel.org, hns@goldelico.com
Subject: [PATCH 0/5] ASoC: ti: davinci-mcasp: Fix the DIT mode and OMAP4 support
Date:   Sun,  4 Jul 2021 18:04:45 +0300
Message-Id: <20210704150450.20106-1-peter.ujfalusi@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

it has been on my todo list for several years to support McASP on OMAP4 devices.
For Galaxy Nexus we had an omap-mcasp driver (which was mostly a stripped down
davinci-mcasp driver) to support what was needed on that specific phone + it's
dock for S/PDIF (48KHz, 16bit, stereo).

Not many (if any) device available to test the DIT mode of McASP.
I have used BeagleBone White (McASP1 AXR3 can be routed to a pin) to get the
S/PDIF mode working then PandaES for OMAP4 support (on PandaES the gpio_121 is
not used and the signal is routed to expansion J6 pin14)

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
 sound/soc/ti/davinci-mcasp.c                  | 168 +++++++++++++++---
 5 files changed, 168 insertions(+), 42 deletions(-)

-- 
2.32.0

