Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3795114CF06
	for <lists+linux-omap@lfdr.de>; Wed, 29 Jan 2020 18:04:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbgA2RDQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Jan 2020 12:03:16 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53816 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbgA2RDP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 29 Jan 2020 12:03:15 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00TH38f7125953;
        Wed, 29 Jan 2020 11:03:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1580317388;
        bh=g6X3JxNTLRFUy2jBFHftDNK/a0/OoLRTQJFdw87B4jg=;
        h=From:To:CC:Subject:Date;
        b=rlHyNa+EZuNVZLY4zPHvi1/fKn/r39moc8HByA8F5EgEJ5FyDKMPnsSw0ZjC4q/fV
         plYgcLAPzEOvdbG8kxKR+maeS7nQ8Wa3EFsQqw8lRxkZZjgjHzKEvyuiQIoOY+nPk/
         3VlGnaiYkOf6w9mNbbGiFJMCQ0xmT8CeIKotZ9cI=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00TH38AN038585;
        Wed, 29 Jan 2020 11:03:08 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 29
 Jan 2020 11:03:07 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 29 Jan 2020 11:03:07 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00TH33Iv102348;
        Wed, 29 Jan 2020 11:03:04 -0600
From:   Jyri Sarha <jsarha@ti.com>
To:     <tony@atomide.com>, <bcousson@baylibre.com>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>
CC:     <tomi.valkeinen@ti.com>, <peter.ujfalusi@ti.com>, <bparrot@ti.com>,
        <praneeth@ti.com>
Subject: [PATCH 0/2] ARM: dts: keystone-k2g-evm: Display support
Date:   Wed, 29 Jan 2020 19:03:01 +0200
Message-ID: <cover.1580317147.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Now that drm/tidss is queued for mainline, lets add display support for
k2g-evm. There is no hurry since tidss is out only in v5.7, but it
should not harm to have the dts changes in place before that.

Jyri Sarha (2):
  ARM: dts: keystone-k2g: Add DSS node
  ARM: dts: keystone-k2g-evm: add HDMI video support

 arch/arm/boot/dts/keystone-k2g-evm.dts | 101 +++++++++++++++++++++++++
 arch/arm/boot/dts/keystone-k2g.dtsi    |  22 ++++++
 2 files changed, 123 insertions(+)

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

