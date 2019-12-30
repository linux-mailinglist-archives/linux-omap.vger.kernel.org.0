Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5616A12D38A
	for <lists+linux-omap@lfdr.de>; Mon, 30 Dec 2019 19:50:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727572AbfL3Su1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Dec 2019 13:50:27 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:44308 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbfL3Su1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Dec 2019 13:50:27 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBUIoODV032995;
        Mon, 30 Dec 2019 12:50:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1577731824;
        bh=WNCUqtwjUG1a/O9NJFFBAc++jPwLxeQDM8DqNOzYfW4=;
        h=From:To:CC:Subject:Date;
        b=yj8aISPLqbCP0kYSZh69iK3ls44q4c8DsISN2z023YvaZhxsxoMeX+swRe918l8o1
         mAyiSuM/8ahfc1XjiJLl/BTIgB334+s9atKLS2IpVHJh38pyp9UiDgBZg1eWVwP8EY
         ZT/clKnMZ2gIBlxB30I8GjnqtmNae1e/3muZ2cvE=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBUIoOY2097050
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 30 Dec 2019 12:50:24 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 30
 Dec 2019 12:50:24 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 30 Dec 2019 12:50:24 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBUIoOj1043624;
        Mon, 30 Dec 2019 12:50:24 -0600
Received: from localhost ([10.250.65.50])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id xBUIoNu06642;
        Mon, 30 Dec 2019 12:50:24 -0600 (CST)
From:   "Andrew F. Davis" <afd@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Andrew F . Davis" <afd@ti.com>
Subject: [PATCH v3 0/4] Use ARM SMC Calling Convention when OP-TEE is available
Date:   Mon, 30 Dec 2019 13:50:00 -0500
Message-ID: <20191230185004.32279-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello all,

This is the reworked patch turned into a series to allow upstream kernels
to make use of OP-TEE on the OMAP2+ platform.

Thanks,
Andrew

Changes from v1:
 - Split into logical patches
 - Check for OP-TEE in DT only once
 - Check the OP-TEE node is "okay"

Changes from v2:
 - Add HS patch using 'optee_available'

Andrew F. Davis (4):
  ARM: OMAP2+: Add omap_secure_init callback hook for secure
    initialization
  ARM: OMAP2+: Introduce check for OP-TEE in omap_secure_init()
  ARM: OMAP2+: Use ARM SMC Calling Convention when OP-TEE is available
  ARM: OMAP2+: sleep43xx: Call secure suspend/resume handlers

 arch/arm/mach-omap2/common.h      |  2 +-
 arch/arm/mach-omap2/io.c          | 11 ++++++++
 arch/arm/mach-omap2/omap-secure.c | 45 +++++++++++++++++++++++++++++++
 arch/arm/mach-omap2/omap-secure.h | 10 +++++++
 arch/arm/mach-omap2/omap-smc.S    |  6 ++---
 arch/arm/mach-omap2/pm33xx-core.c | 17 ++++++++++++
 6 files changed, 87 insertions(+), 4 deletions(-)

-- 
2.17.1

