Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6DA09D09B
	for <lists+linux-omap@lfdr.de>; Mon, 26 Aug 2019 15:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731029AbfHZNbV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Aug 2019 09:31:21 -0400
Received: from mout.web.de ([212.227.15.4]:57919 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726953AbfHZNbU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Aug 2019 09:31:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1566826260;
        bh=H8t7Un2cJVopHoyPBeZNQC7nMIY+09fxXzIkgx6q49s=;
        h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
        b=mKkN3yHg3MPRXKnKBUSTCy42ffoCRJ9GVAi4q7dzJLxjCXom8+RJzWcrfP7095COS
         ZwaGHoabdp7Z82wU1UUBbwHxQXVSmVcwnyPQFx4M8GOLE3pz7XFeNGxD8MzV9de4KJ
         /qcj859ouBrrWwjmkQRy2jqQmo+999VCmfyYP5eE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.136.115]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MddGu-1hsFD61VWe-00PP7p; Mon, 26
 Aug 2019 15:31:00 +0200
To:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Kishore Kadiyala <kishore.kadiyala@ti.com>,
        Russell King <linux@armlinux.org.uk>,
        Tony Lindgren <tony@atomide.com>
From:   Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] ARM: OMAP2+: Delete an unnecessary kfree() call in
 omap_hsmmc_pdata_init()
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, Balaji T K <balajitk@ti.com>,
        Benoit Cousson <b-cousson@ti.com>,
        Paul Walmsley <paul@pwsan.com>
Message-ID: <69025c8c-8d84-6686-138b-cde59467b802@web.de>
Date:   Mon, 26 Aug 2019 15:30:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TsinJ1WNOeK0AQGv8gXZCKz4PGm+4XJrUyNxw9ZRtDm9rRsZ39T
 +KJ4XO9ezqOxP3Swaxs3K/RMe7BwLfiNokTzXkD+cWx5x+YbAsRoodU5eZnP7yw3SvjoGu+
 M/tpfzITGTeK0ojL84PT/Lb4EbA1sIsDTCDjrtlNJETKR2ZSUy5pg6lX2M1r2CEXntAkDD6
 tsOVzy0Lodr4a7xtcw22g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tfJTh7TJx6s=:/so0NC1s4FP6sxWpHf0kwl
 NP3ivw8DZJvT4mTUxKyuYqKF74NSl8ewoZ06V3I+BKBtEK+BvczeDnYMv22fLEY2poMK4U7+k
 tRQtTS08LWsUTMwVYDXXUVOj+V//Y6z7qzjtgbvZXfj/f0n6gzewYVF9XsbA6e1KbG9WD999I
 XFRtAnleNIgAx7Anaf2MTaUSUSxsKzom+iVcW5GTeahTzk/KRbkBrdqASxikrZDxXs252AUDT
 kTm4GXXilFWFVvGsolvrStAB33Nfz39SpoaGaz39P8gnbYp4DScP71jpIJMqfESfcaVWg3X/V
 R4nS5pZPHcDyVcQuZGC0JRoo34wB/2fqMkVlvM3pkk4cniDtSrnm80c4+YAUHtACYIR5/HgA/
 1j1oeOojDiaurRZGRT6fcBytKSj3mDRZasICKHnV2j1jJyktx6orYdQhzq3Ie9X6XHai8RAAk
 lBEf/i4TZkbmoc/n5l5zbjiy7sm0sScm3xQSNXA2Ky5/FEgiB2yBAIpV0l/rCMrr/sbeqomBP
 UslGlUZ3508ZAZNYaJXT1TTL8c0A9E2FWxexGNVX2OO2DW4jzluG8b6Q1gZVZ4Ngo2bWRc+pF
 8k906MkBs2/ho2ldwSeOd4eVanL80EdVUlBnhAZ6Qzi8QvP0V5qLohdYyAgS8CnHgYR5vtQhJ
 nZbeMW4dQu7fpw+pqiHm3aoQ561Z1PlqxqL7rl5rX7GRKYI5Dz/PdZnHSf6DtO5ZFCpv/c1sf
 5opI+qpHCowX6V1SdM9bV44hl5BIs5DLwkmgA1RtzzNJE7xPgikMtm03+Mg6vrs4Yvt4QJg76
 h7wVZ+yWrVkb7eztWX4Oql66o2Qt6aTseopHVpW+WhOTF1UtsL+Ae2Ghts6aK9yLhZuhmeC7f
 kDJS9Kl6DpW6kJzUKOZhfH90lTH5alx8hhsmBx3GKfEWdvDHn/AnSGOvTMwOw7GVVyI0r0ILV
 ZDO32qqEzjbZCBW/t5A9NB7eg/H5AKDBRnNATPNuK/4KqC8NM2IZb2y5FjfmqYmc97kMFlonO
 Hn1SvXTlxmYjReuCyelpiCNrgSfoveHBnqVu4BczfBbUtyts8hF3Ed0TzSSPfSAhAws96PtJO
 wjFt/pnjH3jb3zTFmXLWGOubBxSCtxbZ7R4DeotQEfLqNgqhBKMzWWPqGLxpMTyheC2CJI8rZ
 L77aA=
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 26 Aug 2019 15:05:31 +0200

A null pointer would be passed to a call of the function "kfree" directly
after a call of the function "kzalloc" failed at one place.
Remove this superfluous function call.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/arm/mach-omap2/hsmmc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/mach-omap2/hsmmc.c b/arch/arm/mach-omap2/hsmmc.c
index 14b9c13c1fa0..63423ea6a240 100644
=2D-- a/arch/arm/mach-omap2/hsmmc.c
+++ b/arch/arm/mach-omap2/hsmmc.c
@@ -32,10 +32,8 @@ static int __init omap_hsmmc_pdata_init(struct omap2_hs=
mmc_info *c,
 	char *hc_name;

 	hc_name =3D kzalloc(HSMMC_NAME_LEN + 1, GFP_KERNEL);
-	if (!hc_name) {
-		kfree(hc_name);
+	if (!hc_name)
 		return -ENOMEM;
-	}

 	snprintf(hc_name, (HSMMC_NAME_LEN + 1), "mmc%islot%i", c->mmc, 1);
 	mmc->name =3D hc_name;
=2D-
2.23.0

