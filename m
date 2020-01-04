Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51CCC13017A
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2020 09:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgADIqk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 4 Jan 2020 03:46:40 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:13020 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbgADIqj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 4 Jan 2020 03:46:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1578127595;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=UWVRejdunrkDKbpqDDbnRO05NzpDbjt3y5Cqwl1kzWw=;
        b=oXwq6jH1MNyGBHHGF7wdwE3B9Irl1+ZU2X3pdv3v5KRh16HfBuS41vLnARHiobiuEM
        xme76/UVDQjp6isy/fTSnFRljhGed7UAcyLJuY4McUk/F9h00sgbvQQjd+xzej9EP5HF
        5De8e20RG8zERkGqiSFQOPIqFlBXsAvCOlvd8VFXn51wSjC+ajJ2gHuKOMBN43Py6xCI
        C/1nP4oiIXISC595TyndysUZJ5H3EpyC05cWaBmUiIi8rAZUhks2w2wjC12cHTFRSSuh
        R/4f7hhIYHSuDsPCCTrdrIsi6MxfnJiZp50S8t6uRWwpV8XU6Hfc7TpQJ1uiDxRCw44N
        bPSA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDVCVXAYOHw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.1.3 DYNA|AUTH)
        with ESMTPSA id a09dafw048kPPIu
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sat, 4 Jan 2020 09:46:25 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH] mtd: onenand: omap2: Pass correct flags for prep_dma_memcpy
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200104073453.16077-1-peter.ujfalusi@ti.com>
Date:   Sat, 4 Jan 2020 09:46:23 +0100
Cc:     kyungmin.park@samsung.com,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        linux-mtd@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9EB362B8-EA81-445C-9FD7-29ABB890100C@goldelico.com>
References: <20200104073453.16077-1-peter.ujfalusi@ti.com>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 04.01.2020 um 08:34 schrieb Peter Ujfalusi <peter.ujfalusi@ti.com>:
>=20
> The commit converting the driver to DMAengine was missing the flags =
for
> the memcpy prepare call.
> It went unnoticed since the omap-dma drive was ignoring them.

s/drive/driver/

>=20
> Fixes: 3ed6a4d1de2c5 (" mtd: onenand: omap2: Convert to use dmaengine =
for memcp")
> Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
> Hi,
>=20
> Aaro reported [1] a failure on omap2-onenand pointing to
> 4689d35c765c696bdf0535486a990038b242a26b. It looks like the root cause =
is the
> conversion of omap2-onenand to DMAengine which missed the flags.
>=20
> Basically the client is waiting for a callback without asking for it. =
This
> certainly causes timeout.
>=20
> I have not tested the patch, but it should fix the issue.

makes the gta04a5one.dts work again.

Tested-by: H. Nikolaus Schaller <hns@goldelico.com>

BR and thanks!
Nikolaus

>=20
> [1] =
https://lore.kernel.org/lkml/20200103081726.GD15023@darkstar.musicnaut.iki=
.fi/
>=20
> drivers/mtd/nand/onenand/omap2.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/onenand/omap2.c =
b/drivers/mtd/nand/onenand/omap2.c
> index edf94ee54ec7..71a632b815aa 100644
> --- a/drivers/mtd/nand/onenand/omap2.c
> +++ b/drivers/mtd/nand/onenand/omap2.c
> @@ -328,7 +328,8 @@ static inline int =
omap2_onenand_dma_transfer(struct omap2_onenand *c,
> 	struct dma_async_tx_descriptor *tx;
> 	dma_cookie_t cookie;
>=20
> -	tx =3D dmaengine_prep_dma_memcpy(c->dma_chan, dst, src, count, =
0);
> +	tx =3D dmaengine_prep_dma_memcpy(c->dma_chan, dst, src, count,
> +				       DMA_CTRL_ACK | =
DMA_PREP_INTERRUPT);
> 	if (!tx) {
> 		dev_err(&c->pdev->dev, "Failed to prepare DMA =
memcpy\n");
> 		return -EIO;
> --=20
> Peter
>=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

