Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39ADD79244E
	for <lists+linux-omap@lfdr.de>; Tue,  5 Sep 2023 17:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbjIEP6p (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Sep 2023 11:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354593AbjIEMug (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Sep 2023 08:50:36 -0400
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1914DDB
        for <linux-omap@vger.kernel.org>; Tue,  5 Sep 2023 05:50:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693918224; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=jMwNAdvcxD3RmrZ9R2PhnTwpva14v2o4tM/Ty22qEUzPHT10JU9ZNmT+VsLG8IzUcJ
    H8Z3vfz2KAEI+c6GG39vsoDZbemEZJBiNQPvZP+jgtZUYvsmXLPfpnRgmW492xFfhs8W
    Sa4pM55hrQud+ShBqQ96zgVbumsB5Z/S3376OgnUtN381p1kSEyaLLQGNigCbwZt2Kgn
    /myaVGc7ivSnfB3fYS32BMeShr19HjRoP2LqRNdxpRRGENbJMkmdqcBNGqboXesD0SPo
    fBFq7YJL8GPIEkDwORZKW3jzfYTd4PXnyqoy53pnuZe2Iov9qwA452xxk5v487wZW4Te
    2g5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1693918224;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=W3Nkpo2doA25N/O3GRBIU/l26DqKGAjiAD2HtrBDUe0=;
    b=h7FYbBnRg/I+6KwTcYaPQCvRMdZisAyB8qLPz2Co5PoMuSzaMthE0FSLubHnncxwDJ
    udrdymklMxxtNdFjpUnnMgUXkOlu8lL1EXIOLkMrKOxNxZVln0E+sbu2rbE+RmGGXKqw
    b3vLBZtX8RZBSuiFoRRHxdXSkCgFDU3ylpTnk8FnDfzVOFbfxuVH/GFAX1q7YVYklM70
    iZlA2l3z2/PgCcpwzrEswbma1f1UKrKTiFgKpRFw0DsK9DqmXJ6JNgA6Usau7sxiUjel
    wV3mpJLIelF2bjHnfJbGkF6cg68e1rm6X/CdoAH0mVlu9TOrqEDXaUmF/PPFWl3Z72ak
    u66Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1693918224;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=W3Nkpo2doA25N/O3GRBIU/l26DqKGAjiAD2HtrBDUe0=;
    b=ebEqTUFVy6UpvwrYLnuwGk0RnwVZ+bD6qtjDntTBSPRXNxEMyam+K4GCS91qJWTeih
    vS6yOFjj3gzjgiMaOuFk4nljUQ6GPsy2M4MFGGBNKA3qvTaXgKs2qdxhX9qxRwnGGsSZ
    Il8lsU0WzzdOSP4h7f3tgCp2LC6231HgbbE2Dff+BteyM2C07Fd8+VjdraSdu7UO72lZ
    XQ5apUH+JeSYjGbU6eUivz5W47pDN/72qbqxUGlsLKE66cZ3BLNEf4qZh1HAFkDrczYW
    klmSclem/8/6r42DqwW0Q6V0e9OcODThzo6pByqNeR7ZMyU39r0RlxRCBOMIftZAHSgS
    86UQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1693918224;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=W3Nkpo2doA25N/O3GRBIU/l26DqKGAjiAD2HtrBDUe0=;
    b=0a9pX8P+Uq0t9J7kzYq4n4vBmUzKGWgGFOXS/QyK7NVCSD9CTzwCYZ6hHpkLn2jTzf
    HYk/tLmAhmnR4n0YKPCA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1iTDUhfN4hi3qVZrW7J"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 49.8.2 DYNA|AUTH)
    with ESMTPSA id 04cbadz85CoNLbG
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
Subject: [RFC 1/6] ARM: DTS: omap5-l4-abe: we do not need separate target-modules for dmem, cmem, smem
Date:   Tue,  5 Sep 2023 14:50:10 +0200
Message-ID: <239a3e7bfdfff7e83e8fa0f7bb89bad63a5fd0a1.1693918214.git.hns@goldelico.com>
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

They are part of the Audio Engine target module.

The address ranges are handled by the aess child node.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/ti/omap/omap5-l4-abe.dtsi | 27 ---------------------
 1 file changed, 27 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap5-l4-abe.dtsi b/arch/arm/boot/dts/ti/omap/omap5-l4-abe.dtsi
index a03bca5a35844..7d223f938d479 100644
--- a/arch/arm/boot/dts/ti/omap/omap5-l4-abe.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap5-l4-abe.dtsi
@@ -404,33 +404,6 @@ timer8: timer@0 {
 			};
 		};
 
-		target-module@80000 {			/* 0x40180000, ap 26 1a.0 */
-			compatible = "ti,sysc";
-			status = "disabled";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0x0 0x80000 0x10000>,
-				 <0x49080000 0x49080000 0x10000>;
-		};
-
-		target-module@a0000 {			/* 0x401a0000, ap 28 1c.0 */
-			compatible = "ti,sysc";
-			status = "disabled";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0x0 0xa0000 0x10000>,
-				 <0x490a0000 0x490a0000 0x10000>;
-		};
-
-		target-module@c0000 {			/* 0x401c0000, ap 30 1e.0 */
-			compatible = "ti,sysc";
-			status = "disabled";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0x0 0xc0000 0x10000>,
-				 <0x490c0000 0x490c0000 0x10000>;
-		};
-
 		target-module@f1000 {			/* 0x401f1000, ap 32 20.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
 			reg = <0xf1000 0x4>,
-- 
2.42.0

