Return-Path: <linux-omap+bounces-2498-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFD39B3C2B
	for <lists+linux-omap@lfdr.de>; Mon, 28 Oct 2024 21:46:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F7761C21872
	for <lists+linux-omap@lfdr.de>; Mon, 28 Oct 2024 20:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D161DE4DC;
	Mon, 28 Oct 2024 20:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="oXvXRNnn";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="9i3butY1"
X-Original-To: linux-omap@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D7B18E03D;
	Mon, 28 Oct 2024 20:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730148408; cv=pass; b=M1gGn4aYXumMyuEOfeAQVI/FU/q5dKpePu2zpPWLtny9HmHXsXzA6sqPRZpyxnnszpjluGbfWrV1itdnPVguTqmxcX8r3DECmdd/bFq16T5Iz6xRxhXmChGCAiwboKs8ArDggN27eyIMnSkg2TREnMYG39+4DzNElFLJAbRDbL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730148408; c=relaxed/simple;
	bh=EQc5Hcq8F1xi6Djfdhy06Tpq0LJz7ARt5WkuSiyB5qg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=uQQIcXiKfuri8HMp4+DGViReh87Ef+gpCj2hgoR/546k6r169ITQ2Z80MTmOHnitkPDDOjp00+F0pTjsQ3UYkKlAxuin7mexC/AvOPjvJdfdTn3iT+N9dUUw/wfe/IES05pFDd+vOVg15yWAlm9pxvOjggbBBrv/Dksg73goBPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=oXvXRNnn; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=9i3butY1; arc=pass smtp.client-ip=85.215.255.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1730148399; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=NcDlSnE57617bMfC3xbE4wCADkegivbFIpctkNNfLTdPN8MD6NjCZJ7cVZcw5H09KN
    lURcLTjgyYYnmBTct3UCVXnnvX9/EqZzj+68M4ym2PZ6SvLXAa7uyjNfVoaNq+9EKTtW
    1UpqawFQZI0QPVCCkkxE8fywAyoo26bwL5a0CmW4BvwbCOP2UDvTLAIgdv5T3O51HtNa
    1+YCExkWk8G8JmATjBKrncYefw4gqq/UMAP5/jdNFTRE7Gz/84+pPSQsnN+psVB+nhSM
    Ljs8Ni8mZPcOjSK0Qn3j0odgM07ivUIYR7z8lOfqxk/aemZoKfgQLN5lGduz/ZzWGPxH
    7fTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1730148399;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=/DBUgSl/fXm+QxrXuouOBjRsFk/JryARzx/x5XkmPtY=;
    b=D2qMT3rfnzLRD9I+8sFDPHdBb141fsgyVYpB7svT/lQ6Or0DqDZB41DsCSQbi0PMW9
    4NiyQtnB8LneWFaByNn32bpCvUQT1TebaRu/yjEa7d7ry4tzdLlqTLjUrWzxYh70pSFO
    oV5EFUFeLVhwGN4q8A8zwPMhKA4bq/HpwsFlcoBZZKKZG0hUbaZ3//pfuzN5uBLH9ZSt
    RsMdjxxhLLl4/7EcH8qwjFSr6y9BML4teiLnYEFADaV2tURanT8jaJ3RwpBO+ROF5iS2
    3o0qE83XqetjTYLMikdCgY2I37nS+11wsAc9c0HPdI8qHWuzlXKF8dglL3I8mxgoHsBJ
    uD4w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1730148399;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=/DBUgSl/fXm+QxrXuouOBjRsFk/JryARzx/x5XkmPtY=;
    b=oXvXRNnnDlh4EFDy2Jm1FVHTocq5/AgpOU3R7hx5Akyf98y4YaXDkiqhRayK1COrG3
    aMkhVqhhEAVnwiId/XNd/Ar09Y22xOs5/ZiPXorjow7sLa6LJJjIA5H339Ks7dXXfp7C
    DglorPhpHRUwqVZ2o7zoBf1QZ9Y8kylZiz09PhMGrqUD2bvAYY4cL8DrLfpAH7cJzTfg
    t9pczeIH8rKvg5KcvuLKm8sxDi1PX0tDM0Gi+L1gEUnW2TnL3l7rjIeUrhYl/pdb3cfV
    Nl1jmDLT47FLeOb9vCCnuOQUYsZHNugKkkUzFX+zrNogZvvbVpfLZ6So1JL18+Jhs5UV
    +QCw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1730148399;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=/DBUgSl/fXm+QxrXuouOBjRsFk/JryARzx/x5XkmPtY=;
    b=9i3butY11/2LpbfRMpDFkRYu3cQJmGU4qAx1SU+Em6HF1Va5Lmn2V918alzfwLvrpn
    meRjg6YjhVAq6ep/V0Bw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV3ZoNnMiNdxeutsfZzRfx7IXe+fc9o4UKxSY="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.11 AUTH)
    with ESMTPSA id Qb7e4009SKkcK9Y
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Mon, 28 Oct 2024 21:46:38 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH 0/4] Fix omap-iommu bitrot
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <cover.1730136799.git.robin.murphy@arm.com>
Date: Mon, 28 Oct 2024 21:46:27 +0100
Cc: joro@8bytes.org,
 will@kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 mchehab@kernel.org,
 andersson@kernel.org,
 mathieu.poirier@linaro.org,
 Beleswar Padhi <b-padhi@ti.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 iommu@lists.linux.dev,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <831CC29D-3B89-4091-8145-0E310FF838CB@goldelico.com>
References: <cover.1730136799.git.robin.murphy@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
X-Mailer: Apple Mail (2.3776.700.51.11.1)

Hi Robin,

> Am 28.10.2024 um 18:58 schrieb Robin Murphy <robin.murphy@arm.com>:
>=20
> Hi all,
>=20
> It seems omap-iommu hasn't had enough mainline users to avoid =
bitrotting
> through the more recent evolution of the IOMMU API internals. These
> patches attempt to bring it and its consumers sufficiently up-to-date
> to work again, in a manner that's hopefully backportable. This is
> largely all written by inspection, but I have managed to lightly boot
> test patch #3 on an OMAP4 Pandaboard to confirm iommu_probe_device()
> working again.
>=20
> This supersedes my previous patch[1]. Patches #1 and #2 are =
functionally
> independent, and can be applied directly to their respective trees if
> preferred.

I can confirm that this series works on omap3 with v6.12-rc5 and
Camera is back to the GTA04.

So you can add:
Tested-by: H. Nikolaus Schaller <hns@goldelico.com>

BR and thanks,
Nikolaus

root@letux:~# dmesg|fgrep iommu
[    0.522613] iommu: Default domain type: Translated
[    0.522644] iommu: DMA domain TLB invalidation policy: strict mode
[    0.525177] omap-iommu 480bd400.mmu: 480bd400.mmu registered
[   10.752563] omap3isp 480bc000.isp: Adding to iommu group 0
[   10.811218] omap-iommu 480bd400.mmu: 480bd400.mmu: version 1.1
[   11.039489] omap-iommu 480bd400.mmu: 480bd400.mmu: version 1.1
root@letux:~# dmesg|fgrep .isp
[   10.752563] omap3isp 480bc000.isp: Adding to iommu group 0
[   10.841522] omap3isp 480bc000.isp: supply vdd-csiphy1 not found, =
using dummy regulator
[   10.948577] omap3isp 480bc000.isp: supply vdd-csiphy2 not found, =
using dummy regulator
[   10.990814] omap3isp 480bc000.isp: Revision 15.0 found
[   11.089324] omap3isp 480bc000.isp: hist: using DMA channel dma0chan15
[   11.115905] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP =
CCP2 was not initialized!
[   11.168792] omap3isp 480bc000.isp: isp_xclk_set_rate: cam_xclka set =
to 24685714 Hz (div 7)
[   11.220062] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP =
CSI2a was not initialized!
[   11.291748] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP =
CCDC was not initialized!
[   11.362152] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP =
preview was not initialized!
[   11.404266] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP =
resizer was not initialized!
[   11.485687] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP =
AEWB was not initialized!
[   11.520874] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP =
AF was not initialized!
[   11.574981] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP =
histogram was not initialized!
[   11.594268] omap3isp 480bc000.isp: parsing parallel interface
[  106.102905] omap3isp 480bc000.isp: -------------CCDC Register =
dump-------------
[  106.110595] omap3isp 480bc000.isp: ###CCDC PCR=3D0x00000000
[  106.116973] omap3isp 480bc000.isp: ###CCDC SYN_MODE=3D0x00031704
[  106.123657] omap3isp 480bc000.isp: ###CCDC HD_VD_WID=3D0x00000000
[  106.129974] omap3isp 480bc000.isp: ###CCDC PIX_LINES=3D0x00000000
[  106.136810] omap3isp 480bc000.isp: ###CCDC HORZ_INFO=3D0x000004ff
[  106.143615] omap3isp 480bc000.isp: ###CCDC VERT_START=3D0x00000000
[  106.149932] omap3isp 480bc000.isp: ###CCDC VERT_LINES=3D0x000003ff
[  106.156799] omap3isp 480bc000.isp: ###CCDC CULLING=3D0xffff00ff
[  106.163299] omap3isp 480bc000.isp: ###CCDC HSIZE_OFF=3D0x00000a00
[  106.169616] omap3isp 480bc000.isp: ###CCDC SDOFST=3D0x00000000
[  106.176086] omap3isp 480bc000.isp: ###CCDC SDR_ADDR=3D0x40000000
[  106.182708] omap3isp 480bc000.isp: ###CCDC CLAMP=3D0x00000010
[  106.188598] omap3isp 480bc000.isp: ###CCDC DCSUB=3D0x00000000
[  106.195068] omap3isp 480bc000.isp: ###CCDC COLPTN=3D0xbb11bb11
[  106.201507] omap3isp 480bc000.isp: ###CCDC BLKCMP=3D0x00000000
[  106.207550] omap3isp 480bc000.isp: ###CCDC FPC=3D0x00000000
[  106.213684] omap3isp 480bc000.isp: ###CCDC FPC_ADDR=3D0x00000000
[  106.219909] omap3isp 480bc000.isp: ###CCDC VDINT=3D0x03fe02aa
[  106.226409] omap3isp 480bc000.isp: ###CCDC ALAW=3D0x00000006
[  106.232696] omap3isp 480bc000.isp: ###CCDC REC656IF=3D0x00000000
[  106.238830] omap3isp 480bc000.isp: ###CCDC CFG=3D0x00008800
[  106.244964] omap3isp 480bc000.isp: ###CCDC FMTCFG=3D0x00000000
[  106.251434] omap3isp 480bc000.isp: ###CCDC FMT_HORZ=3D0x00000000
[  106.257568] omap3isp 480bc000.isp: ###CCDC FMT_VERT=3D0x00000000
[  106.264251] omap3isp 480bc000.isp: ###CCDC PRGEVEN0=3D0x00000000
[  106.271606] omap3isp 480bc000.isp: ###CCDC PRGEVEN1=3D0x00000000
[  106.285400] omap3isp 480bc000.isp: ###CCDC PRGODD0=3D0x00000000
[  106.301147] omap3isp 480bc000.isp: ###CCDC PRGODD1=3D0x00000000
[  106.307220] omap3isp 480bc000.isp: ###CCDC VP_OUT=3D0x00000000
[  106.326019] omap3isp 480bc000.isp: ###CCDC LSC_CONFIG=3D0x00006600
[  106.340087] omap3isp 480bc000.isp: ###CCDC LSC_INITIAL=3D0x00000000
[  106.358001] omap3isp 480bc000.isp: ###CCDC LSC_TABLE_BASE=3D0x00000000
[  106.372985] omap3isp 480bc000.isp: ###CCDC =
LSC_TABLE_OFFSET=3D0x00000000
[  106.379882] omap3isp 480bc000.isp: =
--------------------------------------------
[  118.617980] omap3isp 480bc000.isp: OMAP3 ISP AEWB: user wants to =
disable module.
[  118.626068] omap3isp 480bc000.isp: OMAP3 ISP AEWB: module is being =
disabled
[  118.633392] omap3isp 480bc000.isp: OMAP3 ISP AF: user wants to =
disable module.
[  118.641937] omap3isp 480bc000.isp: OMAP3 ISP AF: module is being =
disabled
[  118.649627] omap3isp 480bc000.isp: OMAP3 ISP histogram: user wants to =
disable module.
[  118.658508] omap3isp 480bc000.isp: OMAP3 ISP histogram: module is =
being disabled
root@letux:~#=20



