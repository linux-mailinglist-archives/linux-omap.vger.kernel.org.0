Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0662555C5D
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2019 01:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbfFYXdV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Jun 2019 19:33:21 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47978 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbfFYXdU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 25 Jun 2019 19:33:20 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5PNXIFQ068416;
        Tue, 25 Jun 2019 18:33:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561505598;
        bh=t1N1fNUydejlrc13enmcaQ+yARdfCqgRqgTvctqS1/8=;
        h=From:To:CC:Subject:Date;
        b=rvlsoXuOILjneNcZZ11ZIZT5H03RwFLg/CcKuDVoroJrto0jBBohvtM53CDdAqDff
         iW0geCvuaxqxawz7GzYJlXD+qwuH4wQCkEE2bLdxeuvjR5z65Owy8Mow0V18hFSoAZ
         U5FZ1i/j/N89+qgNu6QRKzCGmgXMIwSCAzrZRRok=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5PNXIoF074196
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Jun 2019 18:33:18 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 25
 Jun 2019 18:33:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 25 Jun 2019 18:33:17 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5PNXHX2089251;
        Tue, 25 Jun 2019 18:33:17 -0500
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id x5PNXHm12151;
        Tue, 25 Jun 2019 18:33:17 -0500 (CDT)
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Tero Kristo <t-kristo@ti.com>, Roger Quadros <rogerq@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>
Subject: [PATCH 0/5] Minor ti-sysc cleanups
Date:   Tue, 25 Jun 2019 18:33:10 -0500
Message-ID: <20190625233315.22301-1-s-anna@ti.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

The following series includes minor cleanup patches against the ti-sysc
code. Patches are based on top of all your 5.3 staged branches. Feel free
to pick them up for either 5.3 (if it is not too late) or 5.4 merge window. 

The first 4 patches are non-coding changes, and the last patch is a minor
fixup cleaning up the code flow on failure error paths in sysc_probe()
function. I have boot tested on the limited boards that I have - AM335x
BeagleBone Black, AM437x IDK, AM57xx GP EVM, OMAP4 PandaBoard and OMAP5
uEVM.

regards
Suman

Suman Anna (5):
  MAINTAINERS: Add ti-sysc files under the OMAP2+ entry
  dt-bindings: ti-sysc: Add SPDX license identifier
  bus: ti-sysc: Switch to SPDX license identifier
  bus: ti-sysc: Add missing kerneldoc comments
  bus: ti-sysc: Simplify cleanup upon failures in sysc_probe()

 MAINTAINERS                           |  2 ++
 drivers/bus/ti-sysc.c                 | 31 +++++++++++++--------------
 include/dt-bindings/bus/ti-sysc.h     |  1 +
 include/linux/platform_data/ti-sysc.h |  7 ++++--
 4 files changed, 23 insertions(+), 18 deletions(-)

-- 
2.21.0

