Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0CCA5F10D6
	for <lists+linux-omap@lfdr.de>; Fri, 30 Sep 2022 19:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232410AbiI3R3R (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Sep 2022 13:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232415AbiI3R3A (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 30 Sep 2022 13:29:00 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 917BD1C2F89
        for <linux-omap@vger.kernel.org>; Fri, 30 Sep 2022 10:28:38 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id x18so7888270wrm.7
        for <linux-omap@vger.kernel.org>; Fri, 30 Sep 2022 10:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=6SX2bkfgZ9PNP0/w/uxInyAv1AmhgXbrOxW94DREZHc=;
        b=wa/rTq+H1cWhpdN53xdo+stD+WktBQocMfom2rQlFs8fR244P/RTN2LNDzseLpmO0g
         kD1gLX4V0qtt3WY+JrI2iQNcMd+f7r3NnaNwYvYxsXlQ1GpERlwqbrde+FZ5HZycD07h
         u2IGp70+sDRuN7jl6Ag+iIPLv5aU1TEzVmQ7sV5rGFVCXuzkxenWsV8QGqR3eT4yrXBb
         IgqYHZHbMYFmyuRKyb0ZfFBYkwAlCKkA7fdw93eJa+t+8+7pdzBt8vPveS+HIgsqicwR
         1FiwOeKw99r1izVjDED2rBhDOsVrbavPetetM8ohzu7kXYqmQuTv8NAq1uUhl59YBsyu
         1/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=6SX2bkfgZ9PNP0/w/uxInyAv1AmhgXbrOxW94DREZHc=;
        b=11Q2R3OO+jl5Hp/XMP90RMNqjoaSYGVIYLHhiYwy8AzxyOLlDLP0aFpzmOD5zpQ++h
         0X1a2q8/EpYRkwluLeQuk8jnh5DCLITmSADlcI9U8SzXO2+ixcSNWmBtrQRA+OVoO9wm
         Hiz70Yc8my/ZTzqsQ4NxAcT584McUpV20gcOW2zfQQ1kWSVz4RlFUCgHz46evSn0dexz
         5NC2r1+oGRml+rY3J9NBuHq0tR3dlLnGXHrRbviK2PotSlYIkO5wvtMIPHA9Q7TEM0MP
         IR0vgSlRXIjTc0xtCj/7JLUz/mBucfcCaaRiwm5EwKrFvLqLYMKVXpuzet6pqrR3xAWL
         HY5g==
X-Gm-Message-State: ACrzQf2euBkFYjUaOYYNlVHVbEe7U44o3TnBAAxPfbIzkNbZEr1rLRjt
        cnQ27ogJOoHVH+9AmNre8fcitmU0ri7AWHjI
X-Google-Smtp-Source: AMsMyM7gtmm6UHsmYkCYX3YcRaXDZAFRxsqrlJRbsGZSPLyXDy2pxbiJ0NPgPTRIvaXOZwkXbfYG1Q==
X-Received: by 2002:a5d:4f81:0:b0:21e:2cd7:25df with SMTP id d1-20020a5d4f81000000b0021e2cd725dfmr6751308wru.439.1664558917074;
        Fri, 30 Sep 2022 10:28:37 -0700 (PDT)
Received: from nicolas-Precision-3551.home ([2001:861:5180:dcc0:1a56:87a1:b5b8:453b])
        by smtp.gmail.com with ESMTPSA id bv14-20020a0560001f0e00b0022ae8b862a7sm2525407wrb.35.2022.09.30.10.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 10:28:36 -0700 (PDT)
From:   Nicolas Frayer <nfrayer@baylibre.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, khilman@baylibre.com,
        glaroque@baylibre.com, granquet@baylibre.com,
        Nicolas Frayer <nfrayer@baylibre.com>
Subject: [PATCH 0/2] soc: ti: Convert K3 SoC info driver to module
Date:   Fri, 30 Sep 2022 19:28:08 +0200
Message-Id: <20220930172810.199758-1-nfrayer@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In order for the TI K3 SoC info driver to be built as a module, the
following 2 changes have been made:
- Convert memory allocations to devm and added the remove callback
- Added necessary code to build the driver as a module

Nicolas Frayer (2):
  soc: ti: Convert allocations to devm
  soc: ti: Add module build support

 arch/arm64/Kconfig.platforms |  1 -
 drivers/soc/ti/Kconfig       |  3 ++-
 drivers/soc/ti/k3-socinfo.c  | 47 +++++++++++++++++++-----------------
 3 files changed, 27 insertions(+), 24 deletions(-)

-- 
2.25.1

