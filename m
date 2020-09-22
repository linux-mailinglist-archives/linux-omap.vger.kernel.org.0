Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBA1C27490D
	for <lists+linux-omap@lfdr.de>; Tue, 22 Sep 2020 21:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726577AbgIVT1J (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Sep 2020 15:27:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726576AbgIVT1J (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 22 Sep 2020 15:27:09 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DEABC061755;
        Tue, 22 Sep 2020 12:27:08 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id c2so15111188ljj.12;
        Tue, 22 Sep 2020 12:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9cpt1dNCJgsbEN9MEo3XnIHRq7hWgh7WobDyOrCQzvU=;
        b=l6g/u5iSTbtjMW/bXos5i0WqnL8nhP75EMh0pcnRL0UBt6+z8EX+9l54qOXuBWLpqe
         DjFcpWZjC9hsG+pjhbdzjZ4hooccZEzgn9hey+kNwdjlhbycJxXzWSfr/hmviRi/vOPg
         s5UWyZH1QATu8x2AZLPnXnaeB4BvZjvFT+6HWVTgtKLwEobQehUp0p31i7RI/LdBt3zB
         mTxRD3WXVZc8lym+JJXWS78pOD/r/CblS+fzxq+tl2/QXuppW3g9NLUBcxK381CZkV/N
         S7ZzHtpD1sVeo4u19IJnqI9uP/PVv6U/7VAsCKL9ZE0Bw6RqmwI4p6qOS31j7umJKrEF
         mV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9cpt1dNCJgsbEN9MEo3XnIHRq7hWgh7WobDyOrCQzvU=;
        b=sLFwSKTP4D3Va5eQV05WNfelLTIKjbAqBnGvpuqlTfjvviwDGnz89B3/u8gDI0rhal
         ArRApmHN1AWk1vf+hX0pZIBsXnuGAI6kwfu5/tfHJR34VK9lN3gRK4mOOZ253UqK8Hsi
         wzqpiJ0KYY46+hQ2Uh7U8S7kULQEPHO7wKPbXaWxqJDCXsqQnMfKZwv53R8JXOf+DIwz
         RFF6sncYa/e46hb/z54KoQQD2/ExkDSguK48ssfM4PUkUC1tEzcK7HeyiHEnxKe9ZbED
         gW46TDOi0RWUHssuTj75cT7DTPVVd4+WVJ4ptQYYdFDfVNXEwT/Gp+sTzG0XPHgRXeCc
         Q8Kw==
X-Gm-Message-State: AOAM533s9TnHUyhkznqNGjtzu3oFwNKXwAfNQjsOv+AbJudFsEZQOAXv
        g0465Dx9Hr3F4bkM1vevp2c=
X-Google-Smtp-Source: ABdhPJyAx7qCmFwloXWmCYvXS52s5OAJho5iDN1YztW7szjWbufuaIE/wh5LtJgNJ5Dg086XE0wm7A==
X-Received: by 2002:a2e:95d3:: with SMTP id y19mr969054ljh.393.1600802826938;
        Tue, 22 Sep 2020 12:27:06 -0700 (PDT)
Received: from localhost.localdomain (h-82-196-111-59.NA.cust.bahnhof.se. [82.196.111.59])
        by smtp.gmail.com with ESMTPSA id r132sm3770013lff.167.2020.09.22.12.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 12:27:06 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        support.opensource@diasemi.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com, Milo Kim <milo.kim@ti.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 0/8] drivers/mfd: Constify static struct resource
Date:   Tue, 22 Sep 2020 21:26:51 +0200
Message-Id: <20200922192659.14535-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Constify a number of static struct resource to allow the compiler to put
them in read-only memory. Typically, the only usage of these is to assign
their address to the resources field in the mfd_cell struct, which is a
const pointer (a few drivers also read the value of the start field).

I went through the rest of the static instances of struct resource in
drivers/mfd and all of them are either directly modified by the driver
or has its address passed to mfd_add_devices() which takes a non-const
pointer.

The series is compile-tested only.

I split this into patches per maintainer, I'll happily split it (or squash
it) some other way if that's preferable.

Rikard Falkeborn (8):
  mfd: da: Constify static struct resource
  mfd: intel: Constify static struct resource
  mfd: Constify static struct resource in OMAP2+ drivers
  mfd: wm: Constify static struct resource
  mfd: lp8788: Constify static struct resource
  mfd: stmpe: Constify static struct resource
  mfd: sun4i-gpadc: Constify static struct resource
  mfd: Constify static struct resource

 drivers/mfd/88pm800.c                 |  2 +-
 drivers/mfd/88pm860x-core.c           | 50 ++++++++++++------------
 drivers/mfd/da9055-core.c             |  8 ++--
 drivers/mfd/da9062-core.c             | 24 ++++++------
 drivers/mfd/da9063-core.c             |  8 ++--
 drivers/mfd/da9150-core.c             |  6 +--
 drivers/mfd/hi655x-pmic.c             |  2 +-
 drivers/mfd/intel_msic.c              | 18 ++++-----
 drivers/mfd/intel_quark_i2c_gpio.c    |  4 +-
 drivers/mfd/intel_soc_pmic_bxtwc.c    | 14 +++----
 drivers/mfd/intel_soc_pmic_chtdc_ti.c | 10 ++---
 drivers/mfd/intel_soc_pmic_chtwc.c    |  4 +-
 drivers/mfd/intel_soc_pmic_crc.c      | 10 ++---
 drivers/mfd/ioc3.c                    | 16 ++++----
 drivers/mfd/lp8788.c                  |  4 +-
 drivers/mfd/max8925-core.c            | 56 +++++++++++++--------------
 drivers/mfd/rdc321x-southbridge.c     |  4 +-
 drivers/mfd/retu-mfd.c                |  4 +-
 drivers/mfd/rk808.c                   |  8 ++--
 drivers/mfd/stmpe.c                   | 10 ++---
 drivers/mfd/sun4i-gpadc.c             |  2 +-
 drivers/mfd/tc3589x.c                 |  4 +-
 drivers/mfd/tc6387xb.c                |  2 +-
 drivers/mfd/tc6393xb.c                |  6 +--
 drivers/mfd/tps65090.c                |  2 +-
 drivers/mfd/tps65217.c                |  4 +-
 drivers/mfd/tps6586x.c                |  2 +-
 drivers/mfd/tps65910.c                |  2 +-
 drivers/mfd/tps80031.c                |  2 +-
 drivers/mfd/wm831x-core.c             | 52 ++++++++++++-------------
 drivers/mfd/wm8994-core.c             |  4 +-
 31 files changed, 172 insertions(+), 172 deletions(-)

-- 
2.28.0

