Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCC101F6B02
	for <lists+linux-omap@lfdr.de>; Thu, 11 Jun 2020 17:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728414AbgFKP34 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 11 Jun 2020 11:29:56 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:37232 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728411AbgFKP34 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 11 Jun 2020 11:29:56 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05BFTq9C127234;
        Thu, 11 Jun 2020 10:29:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1591889393;
        bh=qbKG8m+p3y9aGhFMGec53de0IEuLu9JBOzjzkscBIgo=;
        h=From:To:CC:Subject:Date;
        b=CDIFH1d1ZxcujnWczcDM9Szp48icU5w2M18JCaYdOO1GLt4Knv8PrZNFQeNQ/gvaI
         XCz53HW6dgB9E5mmYCjia/1GT95RUVIvwF1w+AxcrND7FdVIfKhEIQHiR3YyV7X2WX
         d0NbhGmeqrqrE2+Sd7//90m9WJXK04Fj44AQCzcI=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05BFTqUX083015
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 11 Jun 2020 10:29:52 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 11
 Jun 2020 10:29:52 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 11 Jun 2020 10:29:52 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05BFTqpC021031;
        Thu, 11 Jun 2020 10:29:52 -0500
Received: from localhost ([10.250.48.148])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 05BFTq3k085854;
        Thu, 11 Jun 2020 10:29:52 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Jason Kridner <jdk@ti.com>, Caleb Robey <c-robey@ti.com>,
        Drew Fustini <drew@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 0/2] Enable IPU and DSP rprocs on AM5729 BeagleBone AI
Date:   Thu, 11 Jun 2020 10:29:43 -0500
Message-ID: <20200611152945.27656-1-s-anna@ti.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony, Jason, Caleb,

The IPU and DSP remote processors are finally booting as of latest master
on almost all the TI DRA7xx/AM57xx boards except for AM5729 BeagleBone AI
board. We have most of the common dts pieces available due to the usage
of common dra74-ipu-dsp.common.dtsi and dra7-ipu-dsp-common.dtsi files.
The series leverages these to enable both the IPUs (IPU1 and IPU2) and
DSPs (DSP1 and DSP2) on AM5729 BeagleBone AI board.

Patch 1 is enough to enable the support, and patch 2 is a cleanup.
Patches are based on latest master.

I don't have access to an BeagleBone AI board, so appreciate some testing
from any of you. If you are using the TI SDK firmware images, you would
need the following additional patch [1] to have the rpmsg devices published
successfully (otherwise you will see a malformed rpmsg ns message trace).
This patch is getting replaced with an alternate logic, and I am waiting
for that to be finalized before I update our BIOS-side logic/firmwares.

regards
Suman

[1] https://patchwork.kernel.org/patch/11096599/

Suman Anna (2):
  ARM: dts: am5729-beaglebone-ai: Enable IPU & DSP rprocs
  ARM: dts: am5729-beaglebone-ai: Disable ununsed mailboxes

 arch/arm/boot/dts/am5729-beagleboneai.dts | 73 +++++++----------------
 1 file changed, 21 insertions(+), 52 deletions(-)

-- 
2.26.0

