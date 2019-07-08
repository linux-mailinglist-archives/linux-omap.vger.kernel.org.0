Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA2B620C4
	for <lists+linux-omap@lfdr.de>; Mon,  8 Jul 2019 16:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728072AbfGHOqR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Jul 2019 10:46:17 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:20929 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbfGHOqR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 8 Jul 2019 10:46:17 -0400
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2AyOEF/R66y"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
        with ESMTPSA id V09459v68Ek6X7D
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 8 Jul 2019 16:46:06 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     letux-kernel@openphoenux.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 0/2] DTS: ARM: some minor updates and fixes for GTA04
Date:   Mon,  8 Jul 2019 16:46:03 +0200
Message-Id: <cover.1562597164.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We define define chosen/stdout-path chosen to remove the
console= entry in the kernel command line.

And we fix the SPI definition to make the LCD panel work
again.

H. Nikolaus Schaller (2):
  DTS: ARM: gta04: define chosen/stdout-path
  DTS: ARM: gta04: introduce legacy spi-cs-high to make display work
    again

 Documentation/devicetree/bindings/spi/spi-bus.txt | 6 ++++++
 arch/arm/boot/dts/omap3-gta04.dtsi                | 5 +++++
 2 files changed, 11 insertions(+)

-- 
2.19.1

