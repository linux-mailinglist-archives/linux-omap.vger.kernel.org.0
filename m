Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19BA8123B0F
	for <lists+linux-omap@lfdr.de>; Wed, 18 Dec 2019 00:47:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbfLQXrt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Dec 2019 18:47:49 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:33442 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbfLQXrt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 17 Dec 2019 18:47:49 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHNllJp123632;
        Tue, 17 Dec 2019 17:47:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576626467;
        bh=jVr74vWuzIfO+nDiaorAjcV+IZmwd1gLYVhfeRKngQQ=;
        h=From:To:CC:Subject:Date;
        b=YNoHWGs5K6SKl1Ic4FfxAYONqNGG0NgYpZXECWgZUDswU12zscTT+gTFXYrW/s46S
         TmBCeRk+b3aQWjwK7sMb5J+SUFEDKIKh+uIZLL3zk3b/bGpeJoDlFf/5E23A8oAAuZ
         zIPVuKiT6fZZy8ly6qS73japemjEeCUSWelVDW8M=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBHNllMj068309
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 Dec 2019 17:47:47 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 17:47:46 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Dec 2019 17:47:46 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHNlkb3009896;
        Tue, 17 Dec 2019 17:47:46 -0600
Received: from localhost ([10.250.79.55])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id xBHNlku27108;
        Tue, 17 Dec 2019 17:47:46 -0600 (CST)
From:   "Andrew F. Davis" <afd@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Andrew F . Davis" <afd@ti.com>
Subject: [PATCH v2 0/3] Use ARM SMC Calling Convention when OP-TEE is available
Date:   Tue, 17 Dec 2019 18:47:42 -0500
Message-ID: <20191217234745.4434-1-afd@ti.com>
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

Andrew F. Davis (3):
  ARM: OMAP2+: Add omap_secure_init callback hook for secure
    initialization
  ARM: OMAP2+: Introduce check for OP-TEE in omap_secure_init()
  ARM: OMAP2+: Use ARM SMC Calling Convention when OP-TEE is available

 arch/arm/mach-omap2/common.h      |  2 +-
 arch/arm/mach-omap2/io.c          | 11 +++++++++
 arch/arm/mach-omap2/omap-secure.c | 41 +++++++++++++++++++++++++++++++
 arch/arm/mach-omap2/omap-secure.h |  6 +++++
 arch/arm/mach-omap2/omap-smc.S    |  6 ++---
 5 files changed, 62 insertions(+), 4 deletions(-)

-- 
2.17.1

