Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9D2738AEEF
	for <lists+linux-omap@lfdr.de>; Thu, 20 May 2021 14:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242845AbhETMse (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 May 2021 08:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242269AbhETMrD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 20 May 2021 08:47:03 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71CBFC0610E3
        for <linux-omap@vger.kernel.org>; Thu, 20 May 2021 05:08:24 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id o127so9030614wmo.4
        for <linux-omap@vger.kernel.org>; Thu, 20 May 2021 05:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dn893ZzVrKXxQGRxEGsSD/9iX3yhc8jm1WEGCUx35vg=;
        b=S2Y9j+cYl2OkQaVFtUSIfETQKvk5W+SxbVM6ZZKlawNxttmj07hBNPMvlWpIHxTFMF
         GYszHT/Q6x1xgChKP7CkdcIYxpZab0aEzADi87JtO4GpFiBiQFnCM1f0aVjDd4LCrw9Q
         /Ew90g8H9IIMwSjmuwWtk7h//osuy7ogeoUIw7Wy9yockiD9GTg4HjIaMYi8jT1g7DfW
         64aGVyJWb22bFwqruMCm7qrKAs+rMgqrT2iX/+X9vc0RTsH7A2AJJhzrp83WnD3iZXof
         y1Qk90ZPVu5dTkuqNoXmC9u9f9DdSc5KX2tH7zuy51BELt3SZFXQkI3tcKpmwj5E64qa
         dbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dn893ZzVrKXxQGRxEGsSD/9iX3yhc8jm1WEGCUx35vg=;
        b=SEhQX/gZRw2RNoVDzeQckykQklI6xIfGGiiXcLXFx++2nlH1hXNP+oSAVhzaWWUB+Q
         oz3WHzSUdjf5ftPElI+mlSWQQtjhv9SX0b3Id+hhDd890oN1bvt21QUxyzyCQnDEFgIu
         4WFszqzUpVP48eeiWfF8zcrQqMejQWKzqtELlBFrM6ym5cslQ8iecM8xlUxZffGU525O
         y9/mgjOtgb6qees54g9Z7DvD0UHYi4CbTArEGbOdyGVhAyhhewLh0yNyvgQkr2qxeP/H
         +a9VIWdhn/yItszPyC9UL+Bgo+TNsLEhqjBozsnVNMVf3TJIOb2wBG+p0ybYV5YRkh4C
         QzBA==
X-Gm-Message-State: AOAM532kht0UXIRroVbb1JSQFDD8y/MK/Ne4YNfpItLOjY8ZqVyD7D+B
        9v/LZdCY2nF9PnSgBwjbRcTF84Y6WEbhlA==
X-Google-Smtp-Source: ABdhPJwO3+PzB1jF9H7RuxVvHTa5RqChw/PU+oskvT+RTxWQGEDL9CTAgDEAwPmTTXUr64ng2h445Q==
X-Received: by 2002:a05:600c:4f48:: with SMTP id m8mr3703078wmq.169.1621512503023;
        Thu, 20 May 2021 05:08:23 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id r7sm2237170wmq.18.2021.05.20.05.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 05:08:22 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Kai Svahn <kai.svahn@nokia.com>,
        Keshava Munegowda <keshava_mgowda@ti.com>,
        Kumar Sanghvi <kumar.sanghvi@stericsson.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Mattias Nilsson <mattias.i.nilsson@stericsson.com>,
        patches@opensource.cirrus.com, Roger Quadros <rogerq@ti.com>,
        Sundar Iyer <sundar.iyer@stericsson.com>,
        syed khasim <x0khasim@ti.com>, Tony Lindgren <tony@atomide.com>
Subject: [PATCH 0/7] Rid W=1 warnings from MFD
Date:   Thu, 20 May 2021 13:08:13 +0100
Message-Id: <20210520120820.3465562-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

Lee Jones (7):
  mfd: wm831x-core: Fix incorrect function name wm831x_reg_unlock()
  mfd: twl-core: Fix incorrect function name twl_regcache_bypass()
  mfd: db8500-prcmu: Fix multiple incorrectly documented function names
  mfd: omap-usb-host: File headers are not good candidates for
    kernel-doc
  mfd: omap-usb-tll: File headers are not good candidates for kernel-doc
  mfd: si476x-cmd: Fix a bunch of incorrectly documented function names
  mfd: si476x-i2c: Fix incorrectly documented function names

 drivers/mfd/db8500-prcmu.c  |  6 +++---
 drivers/mfd/omap-usb-host.c |  2 +-
 drivers/mfd/omap-usb-tll.c  |  2 +-
 drivers/mfd/si476x-cmd.c    | 24 ++++++++++++------------
 drivers/mfd/si476x-i2c.c    | 10 +++++-----
 drivers/mfd/twl-core.c      |  2 +-
 drivers/mfd/wm831x-core.c   |  2 +-
 7 files changed, 24 insertions(+), 24 deletions(-)

Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Kai Svahn <kai.svahn@nokia.com>
Cc: Keshava Munegowda <keshava_mgowda@ti.com>
Cc: Kumar Sanghvi <kumar.sanghvi@stericsson.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-omap@vger.kernel.org
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Mattias Nilsson <mattias.i.nilsson@stericsson.com>
Cc: patches@opensource.cirrus.com
Cc: Roger Quadros <rogerq@ti.com>
Cc: Sundar Iyer <sundar.iyer@stericsson.com>
Cc: syed khasim <x0khasim@ti.com>
Cc: Tony Lindgren <tony@atomide.com>
-- 
2.31.1

