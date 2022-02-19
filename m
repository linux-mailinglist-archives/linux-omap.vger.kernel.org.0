Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC17A4BCAC3
	for <lists+linux-omap@lfdr.de>; Sat, 19 Feb 2022 22:55:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233263AbiBSV4B (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 19 Feb 2022 16:56:01 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231611AbiBSV4A (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 19 Feb 2022 16:56:00 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E20B254197
        for <linux-omap@vger.kernel.org>; Sat, 19 Feb 2022 13:55:39 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id c3so237741plh.9
        for <linux-omap@vger.kernel.org>; Sat, 19 Feb 2022 13:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+iB57UsJFQk/qq+LqVrtygemXd0B+XVilZt4bFe5htU=;
        b=u5QhJnaaBF1SaKzz2/AjuOZECD3NVFhQ0Zrh5Uh70FXAXPLK+SYH6ZFV67648MToHb
         24xqZa0KtbsnXxThMuOffKAsoP58K2KgmpJUtNMWIDGvxSCZdzA9jbUwLjkUg40g3Qq/
         2fEc2Ftlb5+zx65nVGgQhT0bTvZsJMRgDFVpQdz5vkmWbmIdIH53utimgQiiwHLfGgqU
         NGAboZr1sbE/ZFi8SVqEkF3X2XMNZ6/+lXxVpVgWyr33R7152G11sYVSyRtIpTbc0smC
         EFi/H9O+GQPGZpOzvhdvWxlXMvuy4U0WANQxUt+GLjmJAKmuhM6WgGd+00YDW+1E1BC+
         ncQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+iB57UsJFQk/qq+LqVrtygemXd0B+XVilZt4bFe5htU=;
        b=A7NQNvRksW4ZoG2fK7sE5LAclFSYTjCDUZP63AoNqlCjKUAZr5OgbVQHSM0wAOvbVM
         qLG4Qprf1o9+/f1m4eXbtAyFrRNgdx027CfWE/cGlJ8xL5kg9izRtClSz/w36nxjnRxT
         qIfos9z8UgO0edphh/BB5szRgPBkxdQ6o1KEuN1Kum1IFCYoelkdG9hs0tQCrPoHesdM
         8Gla5iw1dPsVzfPa5LI7DSPW1bz/07S2kb80NS4ksFZJhDXQ2TwElT3IpX7QxnTdpklm
         A6EMfm8NhFPbHmODDIinQ8LyRWuO2i/NPGqKrUCvamWAxHiENdxGqSjVzqM9dLC8fa0R
         eiQA==
X-Gm-Message-State: AOAM532JWPa8p1YfD09WgTIT+iDR3K9UkXFHJUb7DUgRC+AoG/1FO7pC
        jzsYFz6GwAIY5X2L1ShY7Jro+w==
X-Google-Smtp-Source: ABdhPJyLzGQfZEFYVEdwDM8G/RuzZT3/PENOwn2dG/FOspxT/iak7Uij73jUVZB1jllVqos1xyCcQg==
X-Received: by 2002:a17:90a:c706:b0:1b8:a942:3e36 with SMTP id o6-20020a17090ac70600b001b8a9423e36mr14451630pjt.40.1645307739266;
        Sat, 19 Feb 2022 13:55:39 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c2:1001:7090:31ab:1e81:9550:f30a])
        by smtp.gmail.com with ESMTPSA id i17sm13447337pgn.82.2022.02.19.13.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 13:55:38 -0800 (PST)
From:   Drew Fustini <dfustini@baylibre.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dave Gerlach <d-gerlach@ti.com>, devicetree@vger.kernel.org,
        Drew Fustini <dfustini@baylibre.com>,
        Keerthy <j-keerthy@ti.com>, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony Lindgren <tony@atomide.com>, s-anna@ti.com,
        khilman@baylibre.com
Subject: [PATCH 00/11] soc: ti: wkup_m3_ipc: support vtt toggle, io isolation & voltage scaling
Date:   Sat, 19 Feb 2022 13:53:17 -0800
Message-Id: <20220219215328.485660-1-dfustini@baylibre.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Improve the wkup_m3_ipc driver to better support the TI Wakeup Cortex M3 
device found on TI AM33xx and AM43xx SoCs.

This series derives from these commits in the ti-linux-5.10.y branch of
the TI Linux repo [1]:

  6ab4eff1034b ("remoteproc: move rproc_da_to_va declaration to remoteproc.h")
  2a9be39a26f7 ("dt-bindings: wkup_m3_ipc: Add vtt toggling bindings")
  c65263f9e12c ("wkup_m3_ipc: Add support for toggling VTT regulator")
  5c6c821803e1 ("dt-bindings: wkup_m3_ipc: Add ti,io-isolation property")
  196c46f7577d ("wkup_m3_ipc: Add support for IO Isolation")
  c28acc847e5d ("soc: ti: wkup_m3_ipc: Add support for i2c voltage scaling")
  a4f9ef4ab5ca ("ARM: dts: am437x-gp-evm: Enable wkup_m3 control of IO isolation")
  94de756f1771 ("ARM: dts: am33xx: Add scale data fw to wkup_m3_ipc node")
  b7ae4b063793 ("ARM: dts: am43xx: Add scale data fw to wkup_m3_ipc node")
  451ec7871ae7 ("soc: ti: wkup_m3_ipc: Add debug option to halt m3 in suspend")

Minor changes have been made to some patches to resolve conflicts and 
to split i2c voltage scaling dt-bindings into separate patch.

[1] git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git

Dave Gerlach (10):
  dt-bindings: wkup_m3_ipc: Add vtt toggling bindings
  soc: ti: wkup_m3_ipc: Add support for toggling VTT regulator
  dt-bindings: wkup_m3_ipc: Add ti,io-isolation property
  soc: ti: wkup_m3_ipc: Add support for IO Isolation
  ARM: dts: am437x-gp-evm: Enable wkup_m3 control of IO isolation
  dt-bindings: wkup_m3_ipc: Add scale-data-fw property
  soc: ti: wkup_m3_ipc: Add support for i2c voltage scaling
  ARM: dts: am33xx: Add scale data fw to wkup_m3_ipc node
  ARM: dts: am43xx: Add scale data fw to wkup_m3_ipc node
  soc: ti: wkup_m3_ipc: Add debug option to halt m3 in suspend

Suman Anna (1):
  remoteproc: move rproc_da_to_va declaration to remoteproc.h

 .../bindings/soc/ti/wkup_m3_ipc.txt           |  91 ++++++++
 arch/arm/boot/dts/am335x-bone-common.dtsi     |   4 +
 arch/arm/boot/dts/am335x-evm.dts              |   4 +
 arch/arm/boot/dts/am335x-evmsk.dts            |   4 +
 arch/arm/boot/dts/am437x-gp-evm.dts           |   5 +
 arch/arm/boot/dts/am437x-sk-evm.dts           |   4 +
 arch/arm/boot/dts/am43x-epos-evm.dts          |   4 +
 drivers/remoteproc/remoteproc_internal.h      |   1 -
 drivers/soc/ti/wkup_m3_ipc.c                  | 208 +++++++++++++++++-
 include/linux/remoteproc.h                    |   1 +
 include/linux/wkup_m3_ipc.h                   |  13 ++
 11 files changed, 334 insertions(+), 5 deletions(-)

-- 
2.32.0

