Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37746F2D07
	for <lists+linux-omap@lfdr.de>; Thu,  7 Nov 2019 12:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388352AbfKGLGm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Nov 2019 06:06:42 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.122]:15270 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388298AbfKGLG1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Nov 2019 06:06:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1573124785;
        s=strato-dkim-0002; d=goldelico.com;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=XDDMV0r7God8oaw26RRX8bDOEGcPbFm9sSN1MRhg7fc=;
        b=NXDyGbxgUfNxL/rpFjdji43piZr6pfNLx/U9A8D25L6QS80mfVkNbKnMicEgz8Hp2/
        LrzsfTZJtiHtZLVSOn8F1tiaz9mK2fZt4hFfyjqIFX6HWUO+FHxKEpXT284siOw9Ugu2
        fhRx69qNMAMR4xWV5OIuZ42ktRt+zXetJW/ZUjOlZxpK0WA4wUpiPMbxz18cYWEz+FWf
        kMXJ9SaCfwrjOYRcF99+iM4a43jmj5jCneoc8wXizh7NAT+Q1KNWR2hpFtCIqXbU/OSx
        lpVigDAGllB5FcPbYd8fNqtErUWal/zzGCZZbZUW2WwOiw0zHf89Qawa3s5P6GIwRnEE
        eOCg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7PR5/L9P0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
        with ESMTPSA id L09db3vA7B6Cdgn
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Thu, 7 Nov 2019 12:06:12 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2 0/8] ARM/MIPS: DTS: add child nodes describing the PVRSGX present in some OMAP SoC and JZ4780
Date:   Thu,  7 Nov 2019 12:06:03 +0100
Message-Id: <cover.1573124770.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Changes:
* tried convert bindings to YAML format - suggested by Rob Herring
* added JZ4780 DTS node (proven to load the driver)
* removed timer and img,cores properties until we know we really need them - suggested by Rob Herring

PATCH V1 2019-10-18 20:46:35:

This patch set defines child nodes for the SGX5xx interface inside
the OMAP SoC so that a driver can be found and probed by the
compatible strings and can retrieve information about the SGX revision
that is included in a specific SoC. It also defines the interrupt number
to be used by the SGX driver.

There is currently no mainline driver for these GPUs, but a project [1]
is ongoing with the goal to get the open-source part as provided by TI/IMG
into drivers/staging/pvr.

The kernel modules built from this project have successfully demonstrated
to work with the DTS definitions from this patch set on AM335x BeagleBone
Black and OMAP5 Pyra. They partially works on DM3730 and PandaBoard ES but
that is likely a problem in the kernel driver or the (non-free) user-space
blobs.

There is potential to extend this work to JZ4780 (CI20 board) and
BananaPi-M3 (A83) and even some Intel Poulsbo and CedarView devices.

[1]: https://github.com/openpvrsgx-devgroup

H. Nikolaus Schaller (8):
  RFC: dt-bindings: add img,pvrsgx.yaml for Imagination GPUs
  ARM: DTS: am33xx: add sgx gpu child node
  ARM: DTS: am3517: add sgx gpu child node
  ARM: DTS: omap3: add sgx gpu child node
  ARM: DTS: omap36xx: add sgx gpu child node
  ARM: DTS: omap4: add sgx gpu child node
  ARM: DTS: omap5: add sgx gpu child node
  MIPS: DTS: jz4780: add sgx gpu node

 .../devicetree/bindings/gpu/img,pvrsgx.yaml   | 128 ++++++++++++++++++
 arch/arm/boot/dts/am33xx.dtsi                 |   9 +-
 arch/arm/boot/dts/am3517.dtsi                 |  11 +-
 arch/arm/boot/dts/omap34xx.dtsi               |  11 +-
 arch/arm/boot/dts/omap36xx.dtsi               |  11 +-
 arch/arm/boot/dts/omap4.dtsi                  |   9 +-
 arch/arm/boot/dts/omap4470.dts                |  15 ++
 arch/arm/boot/dts/omap5.dtsi                  |   9 +-
 arch/mips/boot/dts/ingenic/jz4780.dtsi        |  11 ++
 9 files changed, 187 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
 create mode 100644 arch/arm/boot/dts/omap4470.dts

-- 
2.23.0

