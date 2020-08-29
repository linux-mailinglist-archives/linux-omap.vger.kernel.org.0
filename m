Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4905D256A90
	for <lists+linux-omap@lfdr.de>; Sun, 30 Aug 2020 00:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728478AbgH2WL3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 29 Aug 2020 18:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728063AbgH2WLQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 29 Aug 2020 18:11:16 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A6A7C061575;
        Sat, 29 Aug 2020 15:11:16 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id j15so1531995lfg.7;
        Sat, 29 Aug 2020 15:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T+EGcDME8OsL++fl1T4qVOn72QV5xXHDdtJ+n1uKIFQ=;
        b=Jm/9upNxlWiHnFELXSdsLWscOzni8nCgG3Lg6i9xvCFJC+yn6ckrsYri70QPrdDTIN
         aQ55ju53E2BRfYpM40gW6J7nvHBG46INBgO0c+9e0Sm8Tz/IhTLGhPAH29kbF/z0mTWN
         ulPXqzt+njH8RHkrBPy9j1h4hqmrCshwQJnpBNmZ7rxCCTKM/W9TTKeLRgLeeQ8rpFrq
         u+QsaR2dKP1ACXkEPi2O0BMbUR0gsF3Zwv6UD0hGa1Ff6w6JGDTTJjtSc3WwKWgC2KSC
         NnSTmWqW1oLzEC0SKUDaRmRWmL2gEK2CwCW8d9UB6NashxHqcikEk9NlKKbzsKBJHnBz
         H7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T+EGcDME8OsL++fl1T4qVOn72QV5xXHDdtJ+n1uKIFQ=;
        b=gqtjMw9XAIHtWud0oRN4T+rrgo7EteIvC9766A4oYPHH85O8shchGf6mGOnb6FNVeh
         RkYmq3Sf7+VaWOjicA0JpJWAUrwQdUHfEQhNMhUlrvrgI3wINre+kOgfnywNXtHilDke
         LyHxk2BQ/t/EM39aDjQJLkeUS/nLiX/LXbxHvxOLGhcoQVQEFfG5a1vvdAcT0KPT7JFp
         d3buxRFiHzMu4Q9sTvPsU4Auv5puxK+qbC6k1dzQjSsBaqN+Ydc64wmC4uOxsgOk9vDg
         NeJaDkjkzFYrZyGO96vsYDIZfrTVggDD+uT2+YaUFr0rupveHCrkfNoqQXw6p3nANhbW
         okdw==
X-Gm-Message-State: AOAM530a+Ahym0Gp4lfalktcm2B3WFib54xsF4u1Dyfbz3FEVoHKjGo1
        ogWHTlAlK65isgGfTjuSlbUbId9EsMc=
X-Google-Smtp-Source: ABdhPJwBA2BZvU2D2PIFB8ugQPxHGSAe34/lKbYMGdrfOfZDDMQwyKn0TjUy2r0PuaX1cOsbrI+C8g==
X-Received: by 2002:ac2:5382:: with SMTP id g2mr356236lfh.140.1598739072880;
        Sat, 29 Aug 2020 15:11:12 -0700 (PDT)
Received: from localhost.localdomain (h-82-196-111-59.NA.cust.bahnhof.se. [82.196.111.59])
        by smtp.gmail.com with ESMTPSA id 4sm697546ljq.92.2020.08.29.15.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2020 15:11:12 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Subject: [PATCH 0/8] regulator/tps*: Constify static regulator ops
Date:   Sun, 30 Aug 2020 00:10:56 +0200
Message-Id: <20200829221104.20870-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Constify static instances of struct regulator_ops to allow the compiler
to put them in read-only memory. Patches are independent. Compile-tested
only.

Rikard Falkeborn (8):
  regulator: tps51632: Constify tps51632_dcdc_ops
  regulator: tps6105x: Constify tps6105x_regulator_ops
  regulator: tps62360: Constify tps62360_dcdc_ops
  regulator: tps65086: Constify static regulator_ops
  regulator: tps65090: constify static regulator_ops
  regulator: tps6586x: Constify static regulator_ops
  regulator: tps65912: Constify static regulator_ops
  regulator: tps65910: Constify static regulator_ops

 drivers/regulator/tps51632-regulator.c |  2 +-
 drivers/regulator/tps6105x-regulator.c |  2 +-
 drivers/regulator/tps62360-regulator.c |  2 +-
 drivers/regulator/tps65086-regulator.c |  4 ++--
 drivers/regulator/tps65090-regulator.c |  8 ++++----
 drivers/regulator/tps6586x-regulator.c |  8 ++++----
 drivers/regulator/tps65910-regulator.c | 10 +++++-----
 drivers/regulator/tps65912-regulator.c |  4 ++--
 8 files changed, 20 insertions(+), 20 deletions(-)

-- 
2.28.0

