Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88F942B96BD
	for <lists+linux-omap@lfdr.de>; Thu, 19 Nov 2020 16:53:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728529AbgKSPpD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Nov 2020 10:45:03 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50776 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728851AbgKSPpC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Nov 2020 10:45:02 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AJFixwI126682;
        Thu, 19 Nov 2020 09:44:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1605800699;
        bh=TQXxcINRCAnbf5YwYtVF5aK6oPcqn1yRuOFJKkerAtU=;
        h=From:To:CC:Subject:Date;
        b=hOakFd6reMCjZ4e9cFBudcB+vuJvJ3rzfhw5lWxKDkicH1DGLCHg8xfJUHLvqhkYH
         RM199M7ER8oHqsuUOk555iavfMizp7c348c010DVOEXt31C4BPrJ1zsxj11Kyv11uW
         coiYxLRyObLRSwjnKRXOHxLPU+RrhwL3Vfug86dc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AJFix0e107680
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Nov 2020 09:44:59 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 19
 Nov 2020 09:44:59 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 19 Nov 2020 09:44:59 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AJFiwfj102457;
        Thu, 19 Nov 2020 09:44:59 -0600
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Sekhar Nori <nsekhar@ti.com>, <linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-omap@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH 0/2] ARM: dts: am335x-evm/evmsk/icev2: switch to new cpsw switch drv
Date:   Thu, 19 Nov 2020 17:44:50 +0200
Message-ID: <20201119154452.26961-1-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

This is the initial conversation of am335x boards to use new cpsw switch driver.
This series adds the cpsw switch driver DT definition and am335x-evm/evmsk/icev2
boards are converted to use it.

Grygorii Strashko (2):
  ARM: dts: am33xx-l4: add dt node for new cpsw switchdev driver
  ARM: dts: am335x-evm/evmsk/icev2: switch to new cpsw switch drv

 arch/arm/boot/dts/am335x-evm.dts   | 13 +++++---
 arch/arm/boot/dts/am335x-evmsk.dts | 14 ++++-----
 arch/arm/boot/dts/am335x-icev2.dts | 14 ++++-----
 arch/arm/boot/dts/am33xx-l4.dtsi   | 49 ++++++++++++++++++++++++++++++
 4 files changed, 69 insertions(+), 21 deletions(-)

-- 
2.17.1

