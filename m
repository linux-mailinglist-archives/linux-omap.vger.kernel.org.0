Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C60C16B53E
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 00:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728569AbgBXXWJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 18:22:09 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48826 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728269AbgBXXWJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 18:22:09 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01ONLvmb054476;
        Mon, 24 Feb 2020 17:21:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582586517;
        bh=mDaDuvaFh0sunLB3b2TyLWg6Xn466LJ8UhglyscAC0M=;
        h=From:To:CC:Subject:Date;
        b=MSIBHwhXgWYCKGUCgpnSb3aEakgB0K5q7myYnn6g95IAgw6C9V6yvkv5FkFxrN+CZ
         VEyzJHatxigPWIw0EfkJ7tJVph6HLfha5uIOHv/YjI2gJkGVwVJNUgzlixmVNNR2ZE
         BeUlfpqQD2dQa9x46ijByUg9w6OJ2WKyybScq+lU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01ONLvpw105193
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 24 Feb 2020 17:21:57 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 24
 Feb 2020 17:21:57 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 24 Feb 2020 17:21:57 -0600
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01ONLvWT046682;
        Mon, 24 Feb 2020 17:21:57 -0600
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 01ONLvuF021215;
        Mon, 24 Feb 2020 17:21:57 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Tero Kristo <t-kristo@ti.com>, Roger Quadros <rogerq@ti.com>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 0/3] Drop PRUSS and OMAP4 IPU/DSP hwmod data
Date:   Mon, 24 Feb 2020 17:21:49 -0600
Message-ID: <20200224232152.25562-1-s-anna@ti.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

The following patches drop the hwmod data for PRUSS on AM33xx and AM437x
SoCs, and for the IPU and DSP processors on OMAP4 SoC. Patches are based
on 5.6-rc1. Please consider these for the 5.7 merge window.

I will be submitting another series tomorrow to add the ti-sysc support
for PRUSS. Nevertheless, the PRUSS hwmods will not be used going forward
and can be dropped independently.

The IPU and DSP hwmods were never added for OMAP5 and DRA7xx/AM57xx SoCs,
and the MMU data was already dropped for 5.6-rc1, as it has all been
converted to ti-sysc and omap-prm. The DT nodes for these will follow
for the next merge window once the current OMAP remoteproc DT support
is accepted [1].

regards
Suman

[1] https://patchwork.kernel.org/cover/11396049/


Suman Anna (3):
  ARM: OMAP2+: Drop hwmod data for am3 and am4 PRUSS
  ARM: OMAP2+: Drop legacy platform data for OMAP4 DSP
  ARM: OMAP4: hwmod_data: Remove OMAP4 IPU hwmod data

 arch/arm/boot/dts/omap4.dtsi                  |   1 -
 .../omap_hwmod_33xx_43xx_common_data.h        |   2 -
 .../omap_hwmod_33xx_43xx_interconnect_data.c  |   8 --
 .../omap_hwmod_33xx_43xx_ipblock_data.c       |  33 -----
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |  10 --
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |   9 --
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c    | 127 ------------------
 7 files changed, 190 deletions(-)

-- 
2.23.0

