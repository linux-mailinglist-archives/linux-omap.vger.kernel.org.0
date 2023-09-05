Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4733792464
	for <lists+linux-omap@lfdr.de>; Tue,  5 Sep 2023 17:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230413AbjIEP6z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Sep 2023 11:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354595AbjIEMug (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Sep 2023 08:50:36 -0400
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 571A6DD
        for <linux-omap@vger.kernel.org>; Tue,  5 Sep 2023 05:50:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693918224; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=qKaO0TKMhlmO/kC+VqmxKrwhPXrdbOA4Ovsrasypx5yS1aDGyHW8NhEAMb5bNCEzIy
    2LIJUJZTKU+fXLh792BxFKZLZU++w9PP/j6+bDqsc+3rQCN9SUTtl2VeVwz0DG8LOzR0
    97WkQNhXIi1Uiyj8cpX0ATAkJ1x1EAGpLpty03nhV20sunflvflUrQ5srUYdhcwU+QxF
    dJaizBQSYm2Z8rX1GuDJnI4Xa81hCA3l0uPd6XCyUw3Pnf+RO0ZTC1rpy74JBGwtLy7P
    PCzTxv3/VQ9MRuhMWsFjuneBq12oRwYA8K+cVknG7+oXVWwqFx020mplqyFsIFhMIUVV
    hdWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1693918224;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=rBlPc9AzTsKnNPqbexirh7STUhddRw6xwzmeuauTMOA=;
    b=ULRMdnQ1FDaTxFKShX0GPLM5hNKg1R0zVzFReWsfiA0X/BNztvQaq7t/+3h8Rx2hnE
    r5sooR9ar11skfggGoMPgOpBFxlGpFcdhfoKoTeghXkxgnFnw/WjO1X+KoWqC2zNWPd8
    X+pNlUUeHx4JZW8nD2i9r3L+sQ0vQzm8De8cE1/OV4UO/QBgRlzmt/i8AfqGOWiXnuLk
    xyuKgMnT2HzyLNKVyGQFF8IwgbcfP4+XdWAuqxk570WbrAaazOKxCVMxjv8lB2wPQILx
    DFQS9k8bi4lQW7THdPDnug/mGzcyj/kCUrmvWkf42fA29pdk+ANcYY0n8mWEOuA+tPID
    mR3A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1693918224;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=rBlPc9AzTsKnNPqbexirh7STUhddRw6xwzmeuauTMOA=;
    b=JtgW+2RPgXCFiKQhycNVeV0rdjbO9cqR/bt13mkail6Wg1TKmiPVJpifF8pRcaiKGk
    un89hcmbJx9UEObhEVKlNVTpNEedbctt8PFVCeEDVUtNXv4LYf4OCbHMzrWU4PNCaIOM
    MAxcbNWiZ9PacnH40q4JWa0VrHZOUqgtsHo53IWVjDXZDSsIJ1HlN10jIpJbVGojWahU
    czqjspir7AhDpXlpL2JXDW7TF6T0/2nUWT5W4o747WjAfO/E6IaUTUz6KtUQdXpWcNJ8
    qiet4P3S3MAsAo3fWUMn1fVB4sqSOXlxYfYjm/Y0BW6OPVgnDvRBFrJkTVnyeuIqApRW
    BPdw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1693918224;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=rBlPc9AzTsKnNPqbexirh7STUhddRw6xwzmeuauTMOA=;
    b=vGDdj9s2q/I68TP1Vm/DaFmxAV31913DaaXGBPu+cRhFczWFvG1Wgxc3r30sffglZ6
    iMwleXXohXtPjr3o91Aw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1iTDUhfN4hi3qVZrW7J"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 49.8.2 DYNA|AUTH)
    with ESMTPSA id 04cbadz85CoOLbJ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 5 Sep 2023 14:50:24 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        =?UTF-8?q?Patrik=20Dahlstr=C3=B6m?= <risca@dalakolonin.se>,
        peter.ujfalusi@gmail.com
Cc:     letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        linux-omap@vger.kernel.org
Subject: [RFC 4/6] ARM: DTS: omap4-l4-abe: Add McASP configuration
Date:   Tue,  5 Sep 2023 14:50:13 +0200
Message-ID: <6a4f04d5f977344b168d34029da4402cf37d8f68.1693918214.git.hns@goldelico.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1693918214.git.hns@goldelico.com>
References: <cover.1693918214.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Peter Ujfalusi <peter.ujfalusi@gmail.com>

OMAP4 has a single McASP instance with single serializer and locked for DIT
mode.
To be able to enable the support the following fixes needed:
- Add the DAT port ranges to the target module's ranges
- SIDLE mode must be disabled as it is not working with McASP
 most likely module integration issue with McASP

We can already fill in the op-mode and serial-dir  for McASP as it only
supports this configuration, but keep the module disabled as there is no
known device available where it is used.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
---
 arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi b/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi
index 7ae8b620515c5..a8d66240d17d5 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi
@@ -192,8 +192,7 @@ target-module@28000 {			/* 0x40128000, ap 8 08.0 */
 			      <0x28004 0x4>;
 			reg-names = "rev", "sysc";
 			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
-					<SYSC_IDLE_NO>,
-					<SYSC_IDLE_SMART>;
+					<SYSC_IDLE_NO>;
 			/* Domains (V, P, C): iva, abe_pwrdm, abe_clkdm */
 			clocks = <&abe_clkctrl OMAP4_MCASP_CLKCTRL 0>;
 			clock-names = "fck";
-- 
2.42.0

