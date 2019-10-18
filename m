Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 949F3DCE9A
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2019 20:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634541AbfJRSrJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 14:47:09 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:27432 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2443134AbfJRSqt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Oct 2019 14:46:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1571424406;
        s=strato-dkim-0002; d=goldelico.com;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=1QwlT7mxYs3pWYaMtPoVjC+h0W2w6mR5VlLH4l4Vwo4=;
        b=Kcf+ZvuIP9lsrRTKnHsW42Gh5QKk1z8Raqw9bB7SbLoJ8Tjed4IYjn0oDtRtV2Kmpx
        VBjBWoZ3gckqUZ7vbPcK+g5bN+OgyOnTXnuc6JIWfxtF+6mZvF15rmQ4xxRAuyPEP0gw
        4IxkWQkwW6jBFWGYHwn0L6UoW0w+jVzxtw37dm2sZcQTgPtWT1rx+mptW++nxvVrGlrg
        5FMrN9P73iCHDal3Tu2zXJhl9F8BhaxCjB6wi6KbYPJ0ZpFdig+5vMmr1F5XYdzTAYta
        dnRGyxqxWRNVqLVoKtGG9+sx6mbGaQ3pDJ7ohEGHBUhSSuA0DLWPc0uyBmDSBfHGFb2u
        7myw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6F3CFF60="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 44.28.1 DYNA|AUTH)
        with ESMTPSA id R0b2a8v9IIkVDLB
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 18 Oct 2019 20:46:31 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 0/7] ARM: DTS: OMAP: add child nodes describing the PVRSGX present in some OMAP SoC
Date:   Fri, 18 Oct 2019 20:46:23 +0200
Message-Id: <cover.1571424390.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This patch set defines child nodes for the SGX5xx interface inside
the OMAP SoC so that a driver can be found and probed by the
compatible strings and can retrieve information about the SGX revision
that is included in a specific SoC. It also defines the interrupt number
and the timer to be used by the SGX driver.

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

H. Nikolaus Schaller (7):
  dt-bindings: gpu: pvrsgx: add initial bindings
  ARM: DTS: am33xx: add sgx gpu child node
  ARM: DTS: am3517: add sgx gpu child node
  ARM: DTS: omap3: add sgx gpu child node
  ARM: DTS: omap36xx: add sgx gpu child node
  ARM: DTS: omap4: add sgx gpu child node
  ARM: DTS: omap5: add sgx gpu child node

 .../devicetree/bindings/gpu/img,pvrsgx.txt    | 76 +++++++++++++++++++
 arch/arm/boot/dts/am33xx.dtsi                 | 11 ++-
 arch/arm/boot/dts/am3517.dtsi                 | 13 ++--
 arch/arm/boot/dts/omap34xx.dtsi               | 13 ++--
 arch/arm/boot/dts/omap36xx.dtsi               | 13 ++--
 arch/arm/boot/dts/omap4.dtsi                  | 11 ++-
 arch/arm/boot/dts/omap4470.dts                | 16 ++++
 arch/arm/boot/dts/omap5.dtsi                  | 12 ++-
 8 files changed, 138 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,pvrsgx.txt
 create mode 100644 arch/arm/boot/dts/omap4470.dts

-- 
2.19.1

