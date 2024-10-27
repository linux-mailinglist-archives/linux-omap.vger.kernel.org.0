Return-Path: <linux-omap+bounces-2490-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CDA9B1F54
	for <lists+linux-omap@lfdr.de>; Sun, 27 Oct 2024 18:15:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8E56B2110F
	for <lists+linux-omap@lfdr.de>; Sun, 27 Oct 2024 17:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9838C2C859;
	Sun, 27 Oct 2024 17:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="iHxDWIpJ";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="9ZzXET1a"
X-Original-To: linux-omap@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B764B640
	for <linux-omap@vger.kernel.org>; Sun, 27 Oct 2024 17:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730049340; cv=pass; b=Fcoc6eX9jgKA+cOQrxzHT5zO6fgqWs24J0Jjy03DcqPvCApmBLvekWuxpAjhZeqaXXPutMNPVu8mzX2nhIR8YWvYueg8ZdqQTaoycGpVSL/ynjUG3N3xXUyDgONVL29BXi7bz9PNMPxF+Z4KsNgRJIzP15NL6kveoM4574L87gs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730049340; c=relaxed/simple;
	bh=13pCcxQ2DalCH27MxNG8lrTw/DRdIS57Udt2uzRsXRs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=o6IzTIuKtCTeitvmndXYAlCCvZxIcnJjkSYiO6oIH3amR7AvKFMBqQ8Qejoj0rFU6HnoOp+WMAmnu22sQ/cn11hSGioxz+JZplj7/Mc5wvrMf94yyPYmt3+UeWDzTTM40IWd0nf2cxR7CARQtVIrQ7Z2/MWpri9/5eDeWXWJqVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=iHxDWIpJ; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=9ZzXET1a; arc=pass smtp.client-ip=81.169.146.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1730049316; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=TjqVk7uLT46E7JMBLJBjzzASxcLZ1+SDpkFvrUeEun2ANFXCtDlus9kqRbOsQIaDcQ
    tvx2pc18AmCcOspFBYb9jPmIIXuG8pjh5uNiLA5SPXSa5CniZY5UvRN3kPHCBBm4h5ib
    U2Ef3dEVpVZxR+Xu+aUf+cWKiyS8PFsW6gTuDrM4Lhw5XYdAYdn1Gwl+4C3IrBKxYzrX
    w2pYQanVgEw9adr/ZJsrCFj0VhiYbwC/3AhonrRpMCPBEtYwNIjD1WPf7fWji9rw0SKz
    /ygE5yB1ipZE3zyc1FwwlAu5UCsO6CfSrG5Aj89MEWjRe+/w4JshxCsmqyTZVh5DtjTI
    6JWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1730049316;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=tI891uCV8rH8Ekry85gmYeaU6ewziferoRWcgKZrRI0=;
    b=meWiVH8VnJRYnzOvNLiXSZ+neKZtDgonyaOzYW4Pg6oz4yI5cMFDirR9TU416mweyh
    7+EARxliSKTAKeITqlzg/e5tD3Ip1DLsGJYBsIhJ4/dzADH5OfZlwL5tOyr1PIgJvJhW
    6jmGrnfjnp9M5roAHL3aRPCO/nDrcGSwuLaWL53r0jmI8YKCcMJ9Wx6/v9AjYJPvoEH+
    xc0xmLQhA+mAcbXpI1OfMYl0xYUQLkaAn8CZRhlmTf/FTYzWwAYi4sDPSUzlgpYKDzFG
    YYjiTF9coHzvfrOtrHQenIAlNUXjWnti6ZgldiucnOR/xIeFrEAXbbHybrjrE+BAaxSE
    mABg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1730049316;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=tI891uCV8rH8Ekry85gmYeaU6ewziferoRWcgKZrRI0=;
    b=iHxDWIpJoLCoKyXyf/faxj2wHQ+HaPNZiUIOkuvSEAoq7mC67HyDwozPqigjlEdi4Z
    9rNGCF08QLLLLrdEvn5aE4V5rKiVVRufAXGSuzrXjp1459IxzE7stp74zfvKttalTy5n
    p0RMTZU8x/NRoumytJkr+suzzUXuYLrZoOc3VJ+AIG77pyVwAsBQvwYMEX+bQQuaOdyC
    r6aTCAJBUKI1SIJY0bXN7OX+asVOVXm4eaR2Vp2ovZ+MtQymMQStigtUlJ28v36dSNpK
    NSphan13VBp/6FTAwAN+bBvD6zvB68F5Mq5I5iupl802+Ck77k9/GWQXMwGT03Hz4fjx
    PCBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1730049316;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=tI891uCV8rH8Ekry85gmYeaU6ewziferoRWcgKZrRI0=;
    b=9ZzXET1aoZ73jIZIBdlvqmgZQF7bpd2gH+zJLkwJ2G578Up273wN7UzBWq1Zhrt28w
    OEVKTSn/IJ/L1QW8beBQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeDsZ"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.11 DYNA|AUTH)
    with ESMTPSA id Qb7e4009RHFFEGP
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Sun, 27 Oct 2024 18:15:15 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH] iommu/omap: Don't register ops by fwnode
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <1a0ff734-73b2-4d73-839b-71e2017ae3c4@arm.com>
Date: Sun, 27 Oct 2024 18:15:05 +0100
Cc: joro@8bytes.org,
 will@kernel.org,
 iommu@lists.linux.dev,
 Jason Gunthorpe <jgg@nvidia.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Beleswar Padhi <b-padhi@ti.com>,
 Andreas Kemnade <andreas@kemnade.info>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C6F2F131-2295-4655-A4E2-600200FD7318@goldelico.com>
References: <c44545c6d07c65d89daa297298c27bb0f15c8b84.1728393458.git.robin.murphy@arm.com>
 <2863ACA9-2836-49F6-9D85-749CE480804D@goldelico.com>
 <10d3a86c-d7a8-4ac5-8ad3-010a91c0a25f@arm.com>
 <FCFEB115-846A-4577-A489-D1537AC77DEA@goldelico.com>
 <5c3ea490-f2f5-49e5-99fd-1dc239aee28d@arm.com>
 <F4A297DC-8EBD-4434-97EA-BFEEBB062042@goldelico.com>
 <1a0ff734-73b2-4d73-839b-71e2017ae3c4@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
X-Mailer: Apple Mail (2.3776.700.51.11.1)

Hi Robin,

> Am 25.10.2024 um 16:27 schrieb Robin Murphy <robin.murphy@arm.com>:
>=20
> On 08/10/2024 8:52 pm, H. Nikolaus Schaller wrote:
>>> Am 08.10.2024 um 20:20 schrieb Robin Murphy <robin.murphy@arm.com>:
>>>> The -ETIMEDOUT seems to come from of_iommu_configure().
>>>=20
>=20
> Hmm, I dug around and found a Pandaboard in the cupboard, and =
ostensibly this seems to work as expected there:
>=20
> 6:12-rc3:
> chu-chu-rocket:~ # dmesg | grep -i iommu
> [    0.628601] iommu: Default domain type: Translated
> [    0.633575] iommu: DMA domain TLB invalidation policy: strict mode
> [    1.636047] omap-iommu 4a066000.mmu: 4a066000.mmu registered
> [    3.265869] omap-iommu 55082000.mmu: 55082000.mmu registered
>=20
> 6.12-rc3 + of_xlate:
> chu-chu-rocket:~ # dmesg | grep -i iommu
> [    0.629577] iommu: Default domain type: Translated
> [    0.634582] iommu: DMA domain TLB invalidation policy: strict mode
> [    1.622802] omap-iommu 4a066000.mmu: 4a066000.mmu registered
> [    3.316009] omap-iommu 55082000.mmu: 55082000.mmu registered
> [    3.329040] omap-rproc ocp:dsp: Adding to iommu group 0
> [    3.335083] omap-iommu 4a066000.mmu: 4a066000.mmu: version 2.0
> [    3.356506] omap-rproc 55020000.ipu: Adding to iommu group 1
> [    3.362396] omap-iommu 55082000.mmu: 55082000.mmu: version 2.1
>=20
> Guess I'm going to have to dig further for an OMAP3 to figure out what =
additional shenanigans that ISP driver is up to... :/

I was able to confirm on 6.12-rc4 ecept a small difference in the last =
lines (ocp:dsp and no version 2.x):

root@letux:~# dmesg|fgrep iommu
[    0.402191] iommu: Default domain type: Translated
[    0.402221] iommu: DMA domain TLB invalidation policy: strict mode
[    0.741607] omap-iommu 4a066000.mmu: 4a066000.mmu registered
[    2.461120] omap-iommu 55082000.mmu: 55082000.mmu registered
[    2.474914] platform ocp:dsp: Adding to iommu group 0
[    2.481719] platform 55020000.ipu: Adding to iommu group 1
root@letux:~#=20

On OMAP3 it is similar. The patch is doing something.

I get this w/o patch:

root@letux:~# dmesg|fgrep iommu
[    0.515808] iommu: Default domain type: Translated
[    0.515808] iommu: DMA domain TLB invalidation policy: strict mode
[    0.528686] omap-iommu 480bd400.mmu: 480bd400.mmu registered
root@letux:~# dmesg|fgrep .isp
[   10.924438] omap3isp 480bc000.isp: supply vdd-csiphy1 not found, =
using dummy regulator
[   10.989044] omap3isp 480bc000.isp: supply vdd-csiphy2 not found, =
using dummy regulator
[   11.082916] omap3isp 480bc000.isp: Revision 15.0 found
[   11.107879] omap3isp 480bc000.isp: failed to create ARM IOMMU mapping
[   11.160736] omap3isp 480bc000.isp: unable to attach to IOMMU
[   11.181640] omap3isp 480bc000.isp: isp_xclk_set_rate: cam_xclka set =
to 24685714 Hz (div 7)
root@letux:~#=20

with patch:

root@letux:~# dmesg|fgrep iommu
[    0.522552] iommu: Default domain type: Translated
[    0.522583] iommu: DMA domain TLB invalidation policy: strict mode
[    0.525543] platform 480bc000.isp: Adding to iommu group 0
[    0.525726] omap-iommu 480bd400.mmu: 480bd400.mmu registered
[   34.422973] omap-iommu 480bd400.mmu: 480bd400.mmu: version 1.1
root@letux:~# dmesg|fgrep .isp
[    0.525543] platform 480bc000.isp: Adding to iommu group 0
[   34.413330] omap3isp 480bc000.isp: deferred probe timeout, ignoring =
dependency
[   34.429412] omap3isp 480bc000.isp: supply vdd-csiphy1 not found, =
using dummy regulator
[   34.446655] omap3isp 480bc000.isp: supply vdd-csiphy2 not found, =
using dummy regulator
[   34.456115] omap3isp 480bc000.isp: Revision 15.0 found
[   34.463165] omap3isp 480bc000.isp: failed to attach device to VA =
mapping
[   34.470306] omap3isp 480bc000.isp: unable to attach to IOMMU
[   34.477661] omap3isp 480bc000.isp: probe with driver omap3isp failed =
with error -16
root@letux:~#=20

Maybe I am missing something from your latest patches. I currently have:

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index c9528065a59af..de14a3cd4b426 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1230,7 +1230,8 @@ static int omap_iommu_probe(struct platform_device =
*pdev)
                if (err)
                        return err;
-               err =3D iommu_device_register(&obj->iommu, =
&omap_iommu_ops, &pdev->dev);
+               err =3D iommu_device_register(&obj->iommu, =
&omap_iommu_ops, NULL);
                if (err)
                        goto out_sysfs;
                obj->has_iommu_driver =3D true;
@@ -1691,7 +1692,8 @@ static struct iommu_device =
*omap_iommu_probe_device(struct device *dev)
                if (!oiommu) {
                        of_node_put(np);
                        kfree(arch_data);
-                       return ERR_PTR(-EINVAL);
+                       /* Not fatal, will re-probe once the right =
instance registers itself */
+                       return ERR_PTR(-ENODEV);
                }
                  tmp->iommu_dev =3D oiommu;

Do you have a link to the patches you have tested?

What I have also compared are the DTS and DTSI files of omap3/36xx and =
omap4/omap4-l4.
Although there are architectural differences I didn't find anything =
significant.
More different is how the omap3-isp vs. omap4-iva is handled.

omap3-isp is a media driver calling arm_iommu_create_mapping() which =
fails.
omap4-iva is a remoteproc driver using a different strategy =
(omap_rproc_of_get_internal_memories ?)
where I do not know details where iommu comes into the game.

Hope this helps.

Best regards,
Nikolaus


