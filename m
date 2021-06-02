Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84860398DA0
	for <lists+linux-omap@lfdr.de>; Wed,  2 Jun 2021 17:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231424AbhFBPCA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Jun 2021 11:02:00 -0400
Received: from smtp-35.italiaonline.it ([213.209.10.35]:48024 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231693AbhFBPCA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 2 Jun 2021 11:02:00 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([79.17.119.101])
        by smtp-35.iol.local with ESMTPA
        id oSLqlJ7WDsptioSLulKArE; Wed, 02 Jun 2021 17:00:15 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1622646015; bh=+sVRheN2hxOIVCCNCGrpAYU/okLJ8F4OSpSvvK3/KsY=;
        h=From;
        b=tGoF00FbrlZ94mpZbYxrPChYpyrsSI9dnHmyV2s02ZWDv/qc5mtzGj2NoQCK+5p80
         MvVoFKlpcQkt0NG42KG9PYfZhWNkQTo2pEPHuZcZ0RKXYy6IUKOmYBiDwZZc2ZnPq/
         P7Nj3QJd0vNa98D7Uo4XG3O/tbD5iLlaOQLE4KpCLCrV4U246JMFGW/XhBYpgrfV7g
         34U4qhEa1whfUgK8gFh/G9VYbNLF87AJMBgil7fXF3Gvx0IhmdDugvWx2KCOyr+G6d
         5S2yh3w93MhGe9G2pWxEUzRZ6ho4ifbonUbAkrU159rbskF2hiNczxBq1F18oLhkkU
         sSHtEBPDWZt4g==
X-CNFS-Analysis: v=2.4 cv=Bo1Yfab5 c=1 sm=1 tr=0 ts=60b79cff cx=a_exe
 a=do1bHx4A/kh2kuTIUQHSxQ==:117 a=do1bHx4A/kh2kuTIUQHSxQ==:17
 a=IkcTkHD0fZMA:10 a=7lJUY2J14ryrXklOE8AA:9 a=QEXdDO2ut3YA:10
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Dario Binacchi <dariobin@libero.it>,
        Tero Kristo <kristo@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH v7 0/5] clk: ti: add am33xx spread spectrum clock support
Date:   Wed,  2 Jun 2021 17:00:03 +0200
Message-Id: <20210602150009.17531-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfGSQLGD2pWymgAK0rBD2YU7Pmmqecdc8EA0H+cr0HKkjs9HfADN3eADfap6TRxYHBIbhKd9eXqeZtHIS20R6+v0eMxJCTRZSVuaqp4JVPXQJ6OdewlFI
 ABOERsbywLgYSX0G+03OqMPOATnIxcwqFgLnUGpsI+5uUogRNtDvgkMPSasI7zfoK6dvtH39TRoKzu010ZViCmqec+ob6GtCNnq7GCk4dJV6YwG5pggMd1Kj
 BjH9NcreRIqrjczcG0vAAHDBhbofRlV2NSryFSHNJ3nko+m306Gj4M0MZzeZZ7fsVgJswlsSJeWF6f0BF/fJ3yNZhSpiu6XaaGlqEpSI9wEowOE0qDUGXErQ
 CorkcFMgUKANb8ag4iEltEdfDawX0312vpQtVsPyW8p0CprHyq6PKIzK0q8z15bkBG8eLB5UdkhzVQ8Sx3hKjrzXAm0/5HYBd8tQk54U3iX5e2SHsDBVANzz
 pzfjcbb+iH38Z/kso3vaLk38hvYqVIK79WCrTsbP5jvXka36d0CqOdKJA991srhT98tfj3Bv99pDGXxmT/p29JCQI6ptjTkk1vYaTosJaErWeaEYN002WoeM
 se1HVQLGYbtuxQCHiZdRXxd9P7I7nbYOKSURkcm3dn63sA==
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


As reported by the TI spruh73x/spruhl7x RM, MPU and LCD modules support
spread spectrum clocking (SSC) on their output clocks. SSC is used to
spread the spectral peaking of the clock to reduce any electromagnetic
interference (EMI) that may be caused due to the clock’s fundamental
or any of its harmonics.
The series allows you to enable and adjust the spread spectrum clocking
for all am33xx/am43xx PLLs for which it is supported. All these issues
have been fixed.


Previous versions of the series did not supported SSC for am43xx SOCs,
causing clock registration failure for DPLLs. Furthermore, for am33xx
SOCs, clock registration failed for DPLLs for which SSC is not supported.

Changes in v7:
- Add Tony Lindgren acked tag.

Changes in v6:
- Add Tero Kristo review tag.

Changes in v5:
- Remove ssc_ack_mask field from dpll_data structure. It was not used.
- Change ssc_downspread type from u8 to bool in dpll_data structure.

Changes in v4:
- Add Stephen Boyd review tag.
- Add Rob Herring review tag.
- Add SSC registers for CORE, DDR and PER PLLs.
- Update commit message.
- Update commit message.

Changes in v3:
- Add '-hz' suffix to "ti,ssc-modfreq" binding.
- Add Tony Lindgren acked tag.
- Use "ti,ssc-modfreq-hz" binding instead of "ti,ssc-modfreq".

Changes in v2:
- Remove SSC registers from dpll_core_ck@490 node (SSC is not supported)
- Add SSC registers to dpll_mpu_ck@488 node.
- Move the DT changes to the previous patch in the series.

Dario Binacchi (5):
  clk: ti: fix typo in routine description
  dt-bindings: ti: dpll: add spread spectrum support
  ARM: dts: am33xx-clocks: add spread spectrum support
  ARM: dts: am43xx-clocks: add spread spectrum support
  clk: ti: add am33xx/am43xx spread spectrum clock support

 .../devicetree/bindings/clock/ti/dpll.txt     | 20 +++++
 arch/arm/boot/dts/am33xx-clocks.dtsi          | 10 +--
 arch/arm/boot/dts/am43xx-clocks.dtsi          | 12 +--
 drivers/clk/ti/dpll.c                         | 39 +++++++++
 drivers/clk/ti/dpll3xxx.c                     | 87 ++++++++++++++++++-
 include/linux/clk/ti.h                        | 22 +++++
 6 files changed, 178 insertions(+), 12 deletions(-)

-- 
2.17.1

