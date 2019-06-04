Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55C5D34E31
	for <lists+linux-omap@lfdr.de>; Tue,  4 Jun 2019 19:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727715AbfFDRCA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 4 Jun 2019 13:02:00 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:52830 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbfFDRCA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 4 Jun 2019 13:02:00 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x54H1rIA084228;
        Tue, 4 Jun 2019 12:01:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559667713;
        bh=tJUbaYS3PXeCQDqLVzPk13j5W5PyU3RKgopVrDFEeQg=;
        h=From:To:CC:Subject:Date;
        b=g99hBXdJ5Ku+pEdJSxXzrA8vje66HcnNOeFGe0pg44GMPt6l8TFdgsRYkfeaND30G
         RjY+YinDO2YOj+qvZze9b4cX1w4o9scy+3fZqMD7VW0gIYTvaY9OoQFMckdIvCHYVt
         O5u8a7GBMU4UEiXdbNyHF5o+0G8s8BfKwrY1cU0Y=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x54H1qAO055469
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 4 Jun 2019 12:01:52 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 4 Jun
 2019 12:01:52 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 4 Jun 2019 12:01:52 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x54H1qr7052476;
        Tue, 4 Jun 2019 12:01:52 -0500
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id x54H1pm17287;
        Tue, 4 Jun 2019 12:01:51 -0500 (CDT)
From:   Suman Anna <s-anna@ti.com>
To:     Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 0/2] Add Mailbox support for TI K3 SoCs
Date:   Tue, 4 Jun 2019 12:01:44 -0500
Message-ID: <20190604170146.12205-1-s-anna@ti.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Jassi,

The following series adds the support for the Mailbox IP present
within the Main NavSS module on the newer TI K3 AM65x and J721E SoCs.

The Mailbox IP is similar to the previous generation IP on OMAP SoCs
with a few differences:
 - Multiple IP instances from previous DRA7/AM57 family each form a
   cluster and are part of the same IP. The driver support will continue
   to be based on a cluster.
 - The IP is present within a Main NaVSS, and interrupts have to go
   through an Interrupt Router within Main NavSS before they reach the
   respective processor sub-system's interrupt controllers.
 - The register layout is mostly same, with difference in two registers

Support is added by enhancing the existing OMAP Mailbox driver to 
support the K3 IP using a new compatible. The driver also has to be
adjusted to deal with the 32-bit mailbox payloads vs the 64-bit 
pointers used by the Mailbox API on these Arm v8 platforms.

DT nodes will be posted separately once the binding is acked.

regards
Suman

Suman Anna (2):
  dt-bindings: mailbox: omap: Update bindings for TI K3 SoCs
  mailbox/omap: Add support for TI K3 SoCs

 .../bindings/mailbox/omap-mailbox.txt         | 59 ++++++++++++++++---
 drivers/mailbox/Kconfig                       |  2 +-
 drivers/mailbox/omap-mailbox.c                | 43 ++++++++------
 include/linux/omap-mailbox.h                  |  4 +-
 4 files changed, 80 insertions(+), 28 deletions(-)

-- 
2.21.0

