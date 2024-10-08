Return-Path: <linux-omap+bounces-2347-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6308799542A
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2024 18:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE7E0B293D6
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2024 16:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3705A1DEFE6;
	Tue,  8 Oct 2024 16:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="KqGTt1PE";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="KZP2TNzT"
X-Original-To: linux-omap@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D959C17578
	for <linux-omap@vger.kernel.org>; Tue,  8 Oct 2024 16:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728404043; cv=pass; b=L7hUFwvOctsCcY/CCEsZS/ZQQi2XgeuvEaEJLF3iPiE97kurHaTs4vTMtAbMRt+eYpQtdG7JP4twfEUL99yaqxqB0yc+HvCKD71h4Q0UR0Fj68YdUSGzovVZvR9R9fyTR2tjTOMwAfGAqqEyPWg5UVXxDtS8DEiFePwt/cFZ1x8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728404043; c=relaxed/simple;
	bh=HFUbGUYayJ5EBTvhLi9PVxdHbD8i/UBxGxvi0xjA9HY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=aaPh0ovfZRHpPp5nwqsbfQlO/1TNymI2AHgXf8nKiFse+qVZ52iSBLdtCLKxh9Exn0cLUY3Ahwxi8wlT5rn0Z42wblR2zJ/LmtuNylsJqdJFbSKPfC7UK5a7gIYHHdxN1fa/qBVe3ezGIchvFXVFVdiwW78rrVD34jSA32bcKpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=KqGTt1PE; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=KZP2TNzT; arc=pass smtp.client-ip=81.169.146.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1728404020; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=lbsO6hAgaI/Z1RqaRr7EDgIGugzKF0AgvTPExT3S3VtINxO3r9j/tpJikUEjcSVdE1
    nVkP2CnWuqX+JQ6c4gKGN9yXa/NIwejpKFYGz8Srd645i0ZI/Met9CfzjnO5rxDepIK2
    bTrlEb7+ZwWVYBzl8jkWB7WX0gQijtxbPe5fJtywfcN9549F8oSbur5h+d6Ke45rwTsq
    mV1FPNpkfdh0y/Nfx491UqqvPPR44EOUwJ7n9vfDFi4ZuoOvbiHlKAO4gnuspc5G0LYq
    G/IGVg3KlQLGUN34TDxxVrLkH7qzU3bqWtxYtb5/YnAuEo4wwg5+MXgKuluutUdXELBY
    GmRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1728404020;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=muRRFBS233rXbkrS27EZFeOnSjKr5MDVsTRN47Cx9kg=;
    b=Wtqv+Cdk64iHZ46vRV5JxnFMIZHk8OQW+Ie+gseHStBvXhhtD1+MrGbPDXxH1t1R/d
    j7jFZKA89/LVe8UGOaIjO5niS3saZHf8YwS3QaGWexjFeGPzqvVHWmRgw9EXqHxDFy94
    DmZZmZW/ZNq4P4yX4XUldIh1RLUe8fendeCUHxPGtIVnRpYvH96XeWodT0X+N4c4MY1O
    iuvrtUgL3UrFeNmg0h7FpEZ1elWDljdxH1IiwIfcDcIPd0S0nV4SfDgB6+zRlHNWtEra
    6/Js9WJccVh1gwzPcfRXbVi4xHjWOLXN21O1oh7KTgvaj1v3p62OunbdM56OKmY4/Bi+
    oEVw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1728404020;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=muRRFBS233rXbkrS27EZFeOnSjKr5MDVsTRN47Cx9kg=;
    b=KqGTt1PE94iRTlI39VRiEhMTUKgp6XRT8VXS4cUzlNK/yLgl8QFNDvZ0D4Vf7W+3+x
    sSlt2TjXiDKvzY5a6j1RlrUCO2IqjPH15BgKvAhn0JCNapxbDb70aMy0r3D9k36F5Btl
    LmY+OIRBfT77CP4TUsxA1Ifwdx9xKA99ePnfCn+iCKWEYUF8Y2/D+yXhTWyw1zJLj7ah
    QfjmLS8qOPtEmQUHURRLGwXCDXKzyeI4hXh9FUryX8D4ljxTPLRF0D2EvQ5pb7P9uUhS
    oBRCzISOSPa1puGydIESW1I0B6mFeqixnYUyHmMDoV2ZtwDTZ83JMpCaX1CTdlLlgn6a
    TQ9g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1728404020;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=muRRFBS233rXbkrS27EZFeOnSjKr5MDVsTRN47Cx9kg=;
    b=KZP2TNzTGhmx755r/i0Fjs0QoV1PVhO0KRbwdSUEKnBOiPVBF5/+8dpRcgHKOfBf3O
    cVwDg8a1TFHgKDWd7BCQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yfzkZ"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.7 DYNA|AUTH)
    with ESMTPSA id Qd0dc2098GDeYub
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Tue, 8 Oct 2024 18:13:40 +0200 (CEST)
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
In-Reply-To: <10d3a86c-d7a8-4ac5-8ad3-010a91c0a25f@arm.com>
Date: Tue, 8 Oct 2024 18:13:29 +0200
Cc: joro@8bytes.org,
 will@kernel.org,
 iommu@lists.linux.dev,
 Jason Gunthorpe <jgg@nvidia.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Beleswar Padhi <b-padhi@ti.com>,
 Andreas Kemnade <andreas@kemnade.info>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FCFEB115-846A-4577-A489-D1537AC77DEA@goldelico.com>
References: <c44545c6d07c65d89daa297298c27bb0f15c8b84.1728393458.git.robin.murphy@arm.com>
 <2863ACA9-2836-49F6-9D85-749CE480804D@goldelico.com>
 <10d3a86c-d7a8-4ac5-8ad3-010a91c0a25f@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
X-Mailer: Apple Mail (2.3776.700.51.11.1)

Hi Robin,

> Am 08.10.2024 um 16:00 schrieb Robin Murphy <robin.murphy@arm.com>:
>=20
> On 08/10/2024 2:32 pm, H. Nikolaus Schaller wrote:
>> Hi Robin,
>>> Am 08.10.2024 um 15:17 schrieb Robin Murphy <robin.murphy@arm.com>:
>>>=20
>>> The OMAP driver still has its own traditional firmware parsing and
>>> instance handling in omap_iommu_probe_device(), rather than using =
the
>>> generic fwnode-based paths. However, it also passes a hwdev to
>>> iommu_device_register(), thus registering a fwnode for each ops
>>> instance, wherein __iommu_probe_device() then fails to find matching =
ops
>>> for a client device with no fwspec and thus a NULL iommu_fwnode.
>>>=20
>>> Since omap-iommu is not known to coexist with any other IOMMU =
hardware
>>> and shares the same ops between all instances, we can reasonably =
remove
>>> the hwdev/fwnode registration to put it back into "legacy" mode =
where
>>> the ops are effectively global and ->probe_device remains =
responsible
>>> for filtering individual clients.
>>>=20
>>> Reported-by: Beleswar Padhi <b-padhi@ti.com>
>>> Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
>>> Fixes: 17de3f5fdd35 ("iommu: Retire bus ops")
>>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>>> ---
>>> drivers/iommu/omap-iommu.c | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>=20
>>> diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
>>> index c9528065a59a..425ae8e551dc 100644
>>> --- a/drivers/iommu/omap-iommu.c
>>> +++ b/drivers/iommu/omap-iommu.c
>>> @@ -1230,7 +1230,7 @@ static int omap_iommu_probe(struct =
platform_device *pdev)
>>> if (err)
>>> return err;
>>>=20
>>> - err =3D iommu_device_register(&obj->iommu, &omap_iommu_ops, =
&pdev->dev);
>>> + err =3D iommu_device_register(&obj->iommu, &omap_iommu_ops, NULL);
>> Thanks for this proposal, but this prevents my OMAP3 system =
completely
>> from booting (at least with v6.8-rc1):
>> ## Booting kernel from Legacy Image at 82000000 ...
>>    Image Name:   Linux-6.8.0-rc1-letux+
>>    Image Type:   ARM Linux Kernel Image (uncompressed)
>>    Data Size:    6491520 Bytes =3D 6.2 MiB
>>    Load Address: 80008000
>>    Entry Point:  80008000
>>    Verifying Checksum ... OK
>> ## Flattened Device Tree blob at 81c00000
>>    Booting using the fdt blob at 0x81c00000
>>    Loading Kernel Image ... OK
>>    Using Device Tree in place at 81c00000, end 81c1fe8e
>> Starting kernel ...
>> --- no further reaction --
>=20
> Urgh... is it possible to get earlycon/ealyprintk output on this =
platform?

Ah, my mistake. earlycon did reveal a NULL pointer dereference coming =
from that
I have added some printk() to iommu_device_register() and friends. And =
one
assumed that hwdev is not a NULL pointer and we can print =
hwdev->kobj.name...

>=20
> As a stab in the dark by inspection, there might potentially be some =
interaction with "iommu: Move bus setup to IOMMU device registration" as =
well, for which the additional diff below might help...
>=20
> Thanks,
> Robin.
>=20
> ---->8----
> diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
> index 425ae8e551dc..9112178e22d8 100644
> --- a/drivers/iommu/omap-iommu.c
> +++ b/drivers/iommu/omap-iommu.c
> @@ -1691,7 +1691,8 @@ static struct iommu_device =
*omap_iommu_probe_device(struct device *dev)
> if (!oiommu) {
> of_node_put(np);
> kfree(arch_data);
> - return ERR_PTR(-EINVAL);
> + /* Not fatal, will re-probe once the right instance registers itself =
*/
> + return ERR_PTR(-ENODEV);
> }
>=20
> tmp->iommu_dev =3D oiommu;

Now I can boot with both patches applied (and Jason's patch and my =
printk removed),
but there is still (exactly the same as with Jason's patch):

root@letux:~# uname -a
Linux letux 6.8.0-rc1-letux+ #19517 SMP PREEMPT Tue Oct  8 17:23:11 CEST =
2024 armv7l GNU/Linux
root@letux:~# dmesg|fgrep iommu
[    0.700195] iommu: Default domain type: Translated
[    0.705078] iommu: DMA domain TLB invalidation policy: strict mode
[    0.728393] platform 480bc000.isp: Adding to iommu group 0
[    0.734161] omap-iommu 480bd400.mmu: 480bd400.mmu registered
[   23.565216] omap3isp 480bc000.isp: iommu configuration for device =
failed with -ETIMEDOUT
[   23.605102] omap-iommu 480bd400.mmu: 480bd400.mmu: version 1.1
root@letux:~# dmesg|fgrep isp
[    0.000000] OMAP3630/DM3730 ES1.2 (l2cache iva sgx neon isp =
192mhz_clk)
[    0.728393] platform 480bc000.isp: Adding to iommu group 0
[   11.472045] omapdss_dss 48050000.dss: bound 48050400.dispc (ops =
dsi_vc_flush_receive_data [omapdrm])		<-- false positive of =
fgrep
[   23.557586] omap3isp 480bc000.isp: deferred probe timeout, ignoring =
dependency
[   23.565216] omap3isp 480bc000.isp: iommu configuration for device =
failed with -ETIMEDOUT		<-- duplicate with fgrep iommu
[   23.625183] omap3isp 480bc000.isp: supply vdd-csiphy1 not found, =
using dummy regulator
[   23.657135] omap3isp 480bc000.isp: supply vdd-csiphy2 not found, =
using dummy regulator
[   23.665832] omap3isp 480bc000.isp: Revision 15.0 found
[   23.700073] omap3isp 480bc000.isp: failed to attach device to VA =
mapping
[   23.724182] omap3isp 480bc000.isp: unable to attach to IOMMU
[   23.731262] omap3isp: probe of 480bc000.isp failed with error -16
root@letux:~#=20

The -ETIMEDOUT seems to come from of_iommu_configure().

I also did now run the same with v6.7 to compare timing and message =
sequence:

root@letux:~# uname -a
Linux letux 6.7.0-letux+ #19518 SMP PREEMPT Tue Oct  8 17:48:27 CEST =
2024 armv7l GNU/Linux
root@letux:~# dmesg|fgrep iommu
[    0.412078] iommu: Default domain type: Translated
[    0.412109] iommu: DMA domain TLB invalidation policy: strict mode
[    0.415008] platform 480bc000.isp: Adding to iommu group 0
[    0.415191] omap-iommu 480bd400.mmu: 480bd400.mmu registered
[   11.046630] omap-iommu 480bd400.mmu: 480bd400.mmu: version 1.1
root@letux:~# dmesg|fgrep isp
[    0.000000] OMAP3630/DM3730 ES1.2 (l2cache iva sgx neon isp =
192mhz_clk)
[    0.415008] platform 480bc000.isp: Adding to iommu group 0
[   10.885711] omap3isp 480bc000.isp: supply vdd-csiphy1 not found, =
using dummy regulator
[   10.953338] omap3isp 480bc000.isp: supply vdd-csiphy2 not found, =
using dummy regulator
[   11.025482] omap3isp 480bc000.isp: Revision 15.0 found
[   11.084014] omap3isp 480bc000.isp: hist: using DMA channel dma0chan15
[   11.150695] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP =
CCP2 was not initialized!
[   11.162109] omap3isp 480bc000.isp: isp_xclk_set_rate: cam_xclka set =
to 24685714 Hz (div 7)
[   11.199523] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP =
CSI2a was not initialized!
[   11.291931] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP =
CCDC was not initialized!
[   11.321807] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP =
preview was not initialized!
[   11.393188] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP =
resizer was not initialized!
[   11.425109] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP =
AEWB was not initialized!
[   11.434082] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP =
AF was not initialized!
[   11.534820] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP =
histogram was not initialized!
[   11.565155] omap3isp 480bc000.isp: parsing parallel interface
[   12.589965] omapdss_dss 48050000.dss: bound 48050400.dispc (ops =
dsi_vc_flush_receive_data [omapdrm])
root@letux:~#=20

Interestingly, there is no -ETIMEOUT and initialization start much =
earlier.

BR and thanks,
Nikolaus


