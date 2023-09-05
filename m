Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6269379246E
	for <lists+linux-omap@lfdr.de>; Tue,  5 Sep 2023 17:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231199AbjIEP67 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Sep 2023 11:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354592AbjIEMu3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Sep 2023 08:50:29 -0400
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE53C9
        for <linux-omap@vger.kernel.org>; Tue,  5 Sep 2023 05:50:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693918223; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Ga/yR7Y7U7/OXtmufeTBDGZpDsQJbdqBHakYMt4k2HZx/rxc67Am9953gQOtS77Rqt
    9ohIS6/tPGhtbjGepnEvPZhn12C0SNsivoUO2EXpEtXTq353r+YCW/dLKWU1b1B4qLw2
    vkSS8hKouyGvff3sazaIhD9KaiBMueEtzD8OBIudxZF0rfH4U6BFGv/woZ/E6rfSHiT8
    7ft87B8WNSxhd1mtfd+gCS5qekiAqLYDj77fVriwe0+lmCBrc0WZE5fMtzJ4pEsSlULh
    KRBoo537tLTdhg82+l2SM1OdnJbuBAxO1DadHb5Fwfd1/6oDhyHCG3SIhNdb4c3pucHe
    oV5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1693918223;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=mnCUM3rkt4/FFO7ZsiP2k3wZjhDaTOgC6Yct3mvlDeA=;
    b=f9UIaFX1Blwo3dHngjqV85gJFWy3SBi8lgPzrCTGvQikGp2wDlMo5DkxXkBX/TGJid
    ws2CyQ1ahO7hzqXW34fWuzOrlPQ7DY479j0LAtuJu1ERHXmz7CZbTPtv30zN30CVlQrv
    GqIGq/lCV4Hn9u/grYSEG/FdOvkimv/vpYmuW9H6xehVf+gBk9FbJwgwrTe6tUbmxtue
    w2NgMfnpHIjPIifSb+rZfv22KrCFtEhlowU6cI66K7vUlwn2L0inCpM3QaCQowLp7iVp
    ZX+GUNrx9kRCVpC9m4aGbNf21xFmGh1NGTQOjmscOosESDIM723cNFZC0Sqqs1ZVrXg/
    ib5A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1693918223;
    s=strato-dkim-0002; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=mnCUM3rkt4/FFO7ZsiP2k3wZjhDaTOgC6Yct3mvlDeA=;
    b=tF6J2C5GPQY5vqfOk380f7psdJgbGQEqGEogc4mx5tEFhnLq4CKywwaQyldXIEj8Uz
    Zy6d3Nj3BL4ZnKL5YgkRFxfJS7X69mU9DwOBMmeTp7h2frAmdYbDFIONZf2rqTrmIcEX
    yWZzWDtq9M5iBiJzLqv8jUEV8PKD2pagZa1NxMoZTXA57gd9++YNp9/VdFcruMZ4A2t6
    0oI6UQwPQWiJ7ygXc/g/hNCvie8OBCJwj7p4VfyKSKKRPX50uNgWyBMz7Rt5lD+uLBSQ
    XwMACVk6R1B92ScZoGXoNVTVqSMB1+1vqIO746oXd1i2YTlCQlhN3wD5cBhS8MFkLtfA
    R1yg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1693918223;
    s=strato-dkim-0003; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=mnCUM3rkt4/FFO7ZsiP2k3wZjhDaTOgC6Yct3mvlDeA=;
    b=VeFDtYZH9kfI54AMGJ4agJUbO128XySzdMrRIZAXjNAO30RCa27fHeihpVJauCyfsC
    Rhv79WDSQ+OGmNp7cwAA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1iTDUhfN4hi3qVZrW7J"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 49.8.2 DYNA|AUTH)
    with ESMTPSA id 04cbadz85CoNLbF
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 5 Sep 2023 14:50:23 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        =?UTF-8?q?Patrik=20Dahlstr=C3=B6m?= <risca@dalakolonin.se>,
        peter.ujfalusi@gmail.com
Cc:     letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        linux-omap@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [RFC 0/6] tentative additions to fix ABE/AESS device tree entries for OMAP4&5
Date:   Tue,  5 Sep 2023 14:50:09 +0200
Message-ID: <cover.1693918214.git.hns@goldelico.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

RFC V1 2023-09-05 14:50:14:
RFC: tentative additions to fix ABE/AESS device tree entries

This is part of a bigger project to provide a modern driver for the
OMAP4/5 Audio Engine (ABE/AE/AESS). The first step is to fix/add some
device tree records so that this allows to do power and clock management
by a driver and give the processor access to all interface registers
and memory blocks.

Main RFC question is if clock setup is correct. For example there is
no connection to abe_giclk_div / ocp_abe_iclk / abe_iclk.

Notes:
- this may be extensible to DRA7xx
- code is based on v6.5
- there is no bindings document for ti,omap4-aess

H. Nikolaus Schaller (4):
  ARM: DTS: omap5-l4-abe: we do not need separate target-modules for
    dmem, cmem, smem
  ARM: DTS: omap5-l4-abe: add an aess (audio DSP of OMAP4 and OMAP5)
    child
  ARM: DTS: omap4-l4-abe: add an aess (audio DSP of OMAP4 and OMAP5)
    child
  ARM: DTS: omap4-panda-common: enable aess, add phandles for aess and
    mcbsp1/2/3

Marek Belisko (1):
  ARM: DTS: omap5-board-common: enable aess, add phandles for aess and
    mcbsp1/2/3

Peter Ujfalusi (1):
  ARM: DTS: omap4-l4-abe: Add McASP configuration

 arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi   | 78 +++++++++++----
 .../boot/dts/ti/omap/omap4-panda-common.dtsi  | 22 ++++-
 .../boot/dts/ti/omap/omap5-board-common.dtsi  | 15 +++
 arch/arm/boot/dts/ti/omap/omap5-l4-abe.dtsi   | 98 +++++++++++--------
 4 files changed, 149 insertions(+), 64 deletions(-)

-- 
2.42.0

