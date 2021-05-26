Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0756B3917CC
	for <lists+linux-omap@lfdr.de>; Wed, 26 May 2021 14:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234105AbhEZMt4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 May 2021 08:49:56 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56839 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234852AbhEZMsx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 May 2021 08:48:53 -0400
Received: from mail-ua1-f69.google.com ([209.85.222.69])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llswT-0000ty-A6
        for linux-omap@vger.kernel.org; Wed, 26 May 2021 12:47:21 +0000
Received: by mail-ua1-f69.google.com with SMTP id t19-20020ab021530000b029020bc458f62fso693831ual.20
        for <linux-omap@vger.kernel.org>; Wed, 26 May 2021 05:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O/UCsmH3hl4IpqKUJA4a+70Zw+Sf6AD7w/Z6UKUd60g=;
        b=L7v5RijSEAvY1Pnpg97vu+ntilUWWW/oHHNZT5THHzKV2ZXnhrBzWbL3wPbdjHiOpj
         jJ0V7RgomQTv/L3PcdyjYRo7PdpTGameEqrk2nhEv2F/ZEhM5N//gUWOM4t22spARVQt
         FG+0GhpJkSpXnNvZo9wWE3Jlsn0cL46H0Sf5T0Nrg8LI16abrEMNFWnqZx6Ac//wmz8B
         bOACorgaKTKQ9vb6kuENfcr170SurFU35OG5ofqFCFWCdHrXrrUlAB0DQyVqNwD8u4Zl
         Z1JIQKvLZoiHFrFl9LAvGVQW6AnxSTqtb22pMDHijTmElsgQs4bXRndRi/VFxqFPP7uD
         ZiWg==
X-Gm-Message-State: AOAM5319QltvGp74Huh70VpF5K4zc4+nv1PELfCwFW4EFXSZLipJlFaP
        hRcIxnA6lRYSHTBt2XvMdw2snCM9OnMLvfRZmVGlVKT8/7PrgYwDvni+XneRTPaUZkhzaLpdCG3
        xK3RnEmaMy6n2IvIT6vr2J2OX7Etbg+VUlE55g1E=
X-Received: by 2002:a67:ea98:: with SMTP id f24mr32326330vso.58.1622033240417;
        Wed, 26 May 2021 05:47:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzncV7KUF7nlI+xDOZ2Hh0jrvt9tlTaxUB/9/ZQ88phvVB/gpuC8OhttWrjIE2/mvfwYc6tAw==
X-Received: by 2002:a67:ea98:: with SMTP id f24mr32326315vso.58.1622033240219;
        Wed, 26 May 2021 05:47:20 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id c126sm875817vkh.47.2021.05.26.05.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 05:47:19 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [RESEND PATCH v2 00/13] Simplify + drop board file support for Samsung PMIC
Date:   Wed, 26 May 2021 08:46:58 -0400
Message-Id: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Lee,

This is the resend of two previous series, combined together as the
latter depends on the first:
https://lore.kernel.org/lkml/20210420113929.278082-1-krzysztof.kozlowski@canonical.com/
https://lore.kernel.org/lkml/20210420170118.12788-1-krzysztof.kozlowski@canonical.com/

Everything rebased on latest next.

This also includes two MFD "Correct kerneldoc" patches which seems to be
still valid, even though you mentioned they were fixed.


The Samsung PMIC drivers since long time are used only on devicetree
platforms (Samsung Exynos) and there are no users with board files.

Drop the support for board files entirely and depend on OF for matching.
This makes the code smaller and simpler.

Best regards,
Krzysztof

Krzysztof Kozlowski (13):
  mfd: max8997: Simplify getting of_device_id match data
  mfd: max8998: Simplify getting of_device_id match data
  mfd: da9052: Simplify getting of_device_id match data
  mfd: da9062: Simplify getting of_device_id match data
  mfd: sec: Simplify getting of_device_id match data
  mfd: wm831x: Correct kerneldoc
  mfd: twl: Correct kerneldoc
  mfd: sec: Drop support for board files and require devicetree
  mfd: sec: Remove unused cfg_pmic_irq in platform data
  mfd: sec: Remove unused device_type in platform data
  mfd: sec: Remove unused irq_base in platform data
  mfd: sec: Enable wakeup from suspend via devicetree property
  mfd: sec: Remove unused platform data members

 drivers/mfd/Kconfig              |  1 +
 drivers/mfd/da9052-i2c.c         |  9 +---
 drivers/mfd/da9062-core.c        | 13 ++----
 drivers/mfd/max8997.c            |  9 ++--
 drivers/mfd/max8998.c            |  8 ++--
 drivers/mfd/sec-core.c           | 70 +++++---------------------------
 drivers/mfd/sec-irq.c            |  4 +-
 drivers/mfd/twl-core.c           |  4 +-
 drivers/mfd/wm831x-core.c        |  2 +-
 include/linux/mfd/samsung/core.h | 33 ---------------
 10 files changed, 29 insertions(+), 124 deletions(-)

-- 
2.27.0

