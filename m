Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38B26B8C24
	for <lists+linux-omap@lfdr.de>; Fri, 20 Sep 2019 10:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405042AbfITIAC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 20 Sep 2019 04:00:02 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43916 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404951AbfITIAC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 20 Sep 2019 04:00:02 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8K7ximS035593;
        Fri, 20 Sep 2019 02:59:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568966384;
        bh=fRna3Ce4+QZO4OTHHC6NwL1VdN3RV06uWyYjVpJ4w0w=;
        h=From:To:CC:Subject:Date;
        b=lYgP0KrTvECQvoCQYpcn36zdWF8tNJk54Ae3b1UWjSU3x8fLdBVJnC8OMs2NAvLHL
         rZwwsHP0KpKvQRSZelEz315DVRR0JEbLCSKrGzSRRkGWkm08aKuh/wFy1PA+NvkFI9
         gdIEHMjAO6ibWPdiN16npOUDgJN+XlUyy7cCy1Rk=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8K7xiDW057565
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Sep 2019 02:59:44 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 20
 Sep 2019 02:59:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 20 Sep 2019 02:59:40 -0500
Received: from a0393675ula.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8K7xeXS118255;
        Fri, 20 Sep 2019 02:59:40 -0500
From:   Keerthy <j-keerthy@ti.com>
To:     <arnd@arndb.de>, <nsekhar@ti.com>, <olof@lixom.net>,
        <t-kristo@ti.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <tony@atomide.com>
CC:     <s-anna@ti.com>, <hch@lst.de>, <bjorn.andersson@linaro.org>,
        <j-keerthy@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 linux-next 0/4] arm/arm64: configs: Convert all CONFIG_REMOTEPROC instances to y
Date:   Fri, 20 Sep 2019 13:29:42 +0530
Message-ID: <20190920075946.13282-1-j-keerthy@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Commit 6334150e9 changes CONFIG_REMOTEPROC to a boolean config
option that inhibits all defconfigs marking CONFIG_REMOTEPROC as
a module in compiling the remoteproc and dependent config options.

So convert all the instances to built in.

Boot tested for omap2plus_defconfig for dra7/am4/am3.

Any quick testing on other boards welcome. 

Patches apply on top of linux-next branch

Changes in v2:

Cc the right lists.

Keerthy (4):
  arm: configs: omap2plus_defconfig: Change CONFIG_REMOTEPROC from m to
    y
  arm: configs: davinci_all_defconfig: Change CONFIG_REMOTEPROC  from m
    to y
  arm: configs: multi_v7_defconfig: Change CONFIG_REMOTEPROC  from m to
    y
  arm64: configs: defconfig: Change CONFIG_REMOTEPROC from m to y

 arch/arm/configs/davinci_all_defconfig | 2 +-
 arch/arm/configs/multi_v7_defconfig    | 2 +-
 arch/arm/configs/omap2plus_defconfig   | 2 +-
 arch/arm64/configs/defconfig           | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.17.1

