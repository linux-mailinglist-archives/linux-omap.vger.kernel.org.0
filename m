Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7036F18B1EE
	for <lists+linux-omap@lfdr.de>; Thu, 19 Mar 2020 12:03:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbgCSLDU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Mar 2020 07:03:20 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:55636 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726663AbgCSLDU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Mar 2020 07:03:20 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02JB3FlX032613;
        Thu, 19 Mar 2020 06:03:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584615795;
        bh=n8cOACPz24iLv+TXfntFcziSsLRS8NmLUcjVq/avlzY=;
        h=From:To:CC:Subject:Date;
        b=iwJJp6PIyhPtChWN5Sx5TQOCEnOKQ4gioUUBRDkEBVQ5ogwYjrIPwvw6yXmpz/SBJ
         1b2OQlE8mM+p4jBcSyUOmzS8PbpZREytxBVl3mMKdUo7M7jEOdGF3+niosimmvifAV
         BCWf/yFQ/br9OMSl8xjIiEK8hq8DZ0qvv3hxlbBE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02JB3F2S038774;
        Thu, 19 Mar 2020 06:03:15 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 06:03:15 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 06:03:14 -0500
Received: from a0132425.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02JB3C7l119908;
        Thu, 19 Mar 2020 06:03:13 -0500
From:   Vignesh Raghavendra <vigneshr@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
CC:     Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-serial@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/6] 8250_omap: Add DMA for AM654/J721e type UARTs
Date:   Thu, 19 Mar 2020 16:33:38 +0530
Message-ID: <20200319110344.21348-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This series add DMA support for UARTs on AM654 and J721e SoCs. These
UARTs are modified version of older generation UARTs on OMAP SoCs.

With new version of IP, it is possible to support longer DMA bursts per
request. There are also differences wrt DMA integration.

First 4 patches update driver to work with AM654 DMA differences. Patch
5 implements errata workaround and Patch 6 adds the actual support for
DMA.


Peter Ujfalusi (1):
  serial: 8250: 8250_omap: Move locking out from __dma_rx_do_complete()

Vignesh Raghavendra (5):
  serial: 8250: 8250_omap: Terminate DMA before pushing data on RX
    timeout
  serial: 8250: 8250_omap: Account for data in flight during DMA
    teardown
  serial: 8250: 8250_omap: Extend driver data to pass FIFO trigger info
  serial: 8250: 8250_omap: Work around errata causing spurious IRQs with
    DMA
  serial: 8250: 8250_omap: Add DMA support for UARTs on K3 SoCs

 drivers/tty/serial/8250/8250_omap.c | 222 ++++++++++++++++++++++------
 1 file changed, 176 insertions(+), 46 deletions(-)

-- 
2.25.2

