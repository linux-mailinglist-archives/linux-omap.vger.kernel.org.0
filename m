Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F9BB5B7F9B
	for <lists+linux-omap@lfdr.de>; Wed, 14 Sep 2022 05:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbiINDqW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 13 Sep 2022 23:46:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbiINDqU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 13 Sep 2022 23:46:20 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD5736AA27;
        Tue, 13 Sep 2022 20:46:18 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MS5lq1LVFznV0W;
        Wed, 14 Sep 2022 11:43:35 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 14 Sep 2022 11:46:15 +0800
From:   Gaosheng Cui <cuigaosheng1@huawei.com>
To:     <rostedt@goodmis.org>, <mingo@redhat.com>, <linux@armlinux.org.uk>,
        <tony@atomide.com>, <bcousson@baylibre.com>, <paul@pwsan.com>,
        <krzysztof.kozlowski@linaro.org>, <alim.akhtar@samsung.com>,
        <stefan@agner.ch>, <rmk+kernel@armlinux.org.uk>,
        <linus.walleij@linaro.org>, <broonie@kernel.org>,
        <sebastian.reichel@collabora.co.uk>, <cuigaosheng1@huawei.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-samsung-soc@vger.kernel.org>
Subject: [PATCH 0/3] Remove unused declarations for arm
Date:   Wed, 14 Sep 2022 11:46:12 +0800
Message-ID: <20220914034615.1240860-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This series contains a few cleanup patches, to remove unused
declarations which have been removed. Thanks!

Gaosheng Cui (3):
  ARM: OMAP2+: remove orphan declarations from omap2
  ARM: s3c: remove orphan declarations from arch/arm/mach-s3c/devs.h
  ARM: ftrace: remove unused ftrace_graph_caller_old() declaration

 arch/arm/kernel/ftrace.c                     | 1 -
 arch/arm/mach-omap2/common.h                 | 3 ---
 arch/arm/mach-omap2/omap_hwmod.h             | 3 ---
 arch/arm/mach-omap2/omap_hwmod_common_data.h | 1 -
 arch/arm/mach-omap2/omap_opp_data.h          | 5 -----
 arch/arm/mach-omap2/serial.h                 | 3 ---
 arch/arm/mach-omap2/usb.h                    | 1 -
 arch/arm/mach-s3c/devs.h                     | 2 --
 8 files changed, 19 deletions(-)

-- 
2.25.1

