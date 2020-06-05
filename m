Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41E0C1F02C6
	for <lists+linux-omap@lfdr.de>; Sat,  6 Jun 2020 00:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728199AbgFEWNy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 5 Jun 2020 18:13:54 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:56534 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728157AbgFEWNy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 5 Jun 2020 18:13:54 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 055MDq9F083614;
        Fri, 5 Jun 2020 17:13:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1591395232;
        bh=bfbj0ZmfHj4Nq5JyfXLL6/Je6X3wkUQXXHeCX4U1k54=;
        h=From:To:CC:Subject:Date;
        b=yiwIMii5VPM+zgba3v4wuTz0d0b+yVixNyk4bxJJP/vch6mOp7kHGBLjs11IPPW49
         Mjqb1DJi8CRLVfeMKYJvDH8o6XY9jZ4SgVeA5vdTM5B9Xf+ftFBBpOa2BgvptDMTcC
         /U6lCNUd9x3QeuJ0DXTLFX2AMjeGeJg4OOWl0YLc=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 055MDqkM019134;
        Fri, 5 Jun 2020 17:13:52 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Jun
 2020 17:13:52 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Jun 2020 17:13:52 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 055MDq8q120069;
        Fri, 5 Jun 2020 17:13:52 -0500
Received: from localhost ([10.250.70.56])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 055MDqZ3005494;
        Fri, 5 Jun 2020 17:13:52 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Tero Kristo <t-kristo@ti.com>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>
Subject: [PATCH 0/2] DRA7 timer/mailbox dts fixes
Date:   Fri, 5 Jun 2020 17:13:45 -0500
Message-ID: <20200605221347.15735-1-s-anna@ti.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

The following 2 patches are couple of minor fixes that clean up
couple of commits from the "ARM: dts: dra7/am57xx: remoteproc
support" series [1]. Please pick these for the 5.8-rc fixes.

The issues look to be result of incorrect rebase-conflict resolution
of the downstream TI patches based on 5.4 kernel.

regards
Suman

[1] https://patchwork.kernel.org/cover/11508091/

Suman Anna (2):
  ARM: dts: dra7: Fix timer nodes properly for timer_sys_ck clocks
  ARM: dts: dra7-evm-common: Fix duplicate mailbox nodes

 arch/arm/boot/dts/dra7-evm-common.dtsi | 20 ---------------
 arch/arm/boot/dts/dra7-l4.dtsi         | 34 ++++++++++++--------------
 2 files changed, 16 insertions(+), 38 deletions(-)

-- 
2.26.0

