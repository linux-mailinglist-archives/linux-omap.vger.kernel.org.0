Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFA230680
	for <lists+linux-omap@lfdr.de>; Fri, 31 May 2019 04:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726372AbfEaCNa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 May 2019 22:13:30 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:60872 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbfEaCN3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 May 2019 22:13:29 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4V2DNib098757;
        Thu, 30 May 2019 21:13:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559268804;
        bh=4vHnJdthnChgJfAriNkhNapcvwKQORqbRQnHgoj1we0=;
        h=From:To:CC:Subject:Date;
        b=DybxtHrFjYw9OxY3kbZCcSWtD/wOGmO/+PiB1j2PHboNVNfr2vtaMuKoG2BsQcFDs
         4O2XfHxc8NuKXwTzi7fIpnOGlJo/fEHNWIifLlUFiPfU3fAAJUmnbPMw7j21aD1d0n
         yPDgPz+VDgoES3g12gzzhvO2ImNRAZ2XlvwEiTKY=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4V2DNoS040227
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 30 May 2019 21:13:23 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 30
 May 2019 21:13:23 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 30 May 2019 21:13:23 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4V2DNGG027201;
        Thu, 30 May 2019 21:13:23 -0500
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id x4V2DNm18124;
        Thu, 30 May 2019 21:13:23 -0500 (CDT)
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 0/3] Add HwSpinlock support for TI K3 SoCs
Date:   Thu, 30 May 2019 21:13:18 -0500
Message-ID: <20190531021321.14025-1-s-anna@ti.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Bjorn,

The following series adds the support for the HwSpinlock IP present
on the newer TI K3 AM65x and J721E SoCs. The first 2 patches are
related to the K3 support, and the last patch is a minor debug related
trace to see the number of locks registered on each SoC.

I will be posting the DT nodes once the binding is acked.

regards
Suman

Suman Anna (3):
  dt-bindings: hwlock: Update OMAP binding for TI K3 SoCs
  hwspinlock/omap: Add support for TI K3 SoCs
  hwspinlock/omap: Add a trace during probe

 .../bindings/hwlock/omap-hwspinlock.txt       | 25 +++++++++++++++----
 drivers/hwspinlock/Kconfig                    |  2 +-
 drivers/hwspinlock/omap_hwspinlock.c          |  4 +++
 3 files changed, 25 insertions(+), 6 deletions(-)

-- 
2.21.0

