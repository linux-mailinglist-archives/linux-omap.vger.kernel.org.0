Return-Path: <linux-omap+bounces-2340-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1999B99423E
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2024 10:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92B4A1F224E2
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2024 08:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 055C21F4FA3;
	Tue,  8 Oct 2024 08:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="obtu8m6B";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="SQuWrrNc"
X-Original-To: linux-omap@vger.kernel.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890841F4724;
	Tue,  8 Oct 2024 08:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728375117; cv=pass; b=YYPLgwCc8RII+qOfx2ikcPK9pn+4UQVtihVrbBcizmirlT9ykWWgA5tCB8gsJSZpgUMtrKevqJZIZBr9KQy0EjoWTz3fn+KjzhAMrnTL0ISZnzBzGt+jYS03OMdZwIhRnHg09YPreFcYw0xA3PtHd5dWh+OLFfwvQc/TWzbsDLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728375117; c=relaxed/simple;
	bh=h9i0o/1q0Gf4jw4N1lgAM4ETvwOBlfdJyKqa7KZdD8A=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=PyPAIPDjc0CsZ/li3VR8SlxuSFAi3e+RHrm/T5Fe1WVkb4zXd0cZ8X2wjIK2TOrsSyWy+ot+zBiUXQzeEPW0NHlYj7Fgs+B0xCbDtzqpia7D4pJhttGJ7hZR2lGlrkWe/vM+E3WShG2MsrycqBD2ZUjuiigqAgJoDCe/DmvDJGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=obtu8m6B; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=SQuWrrNc; arc=pass smtp.client-ip=85.215.255.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1728374918; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=bm0fcqklE/r1IgDmhc0hOwQBIvQT++428OZtvcJVD7E/l717XzpwtzYZGqbSmABO0P
    P8+y4T4JumnPwCNo4pzUCMO9BDF3Wf9IhoxYJnb97UpyPjL/JgrePS1HN9cXVPIiaJb+
    VlfSI6ZvmeoDEaJbUXYoBfEEFMnXlmw6ySa4rKkr7KZ1kuAguCkeg0qrafYdJI7n1SIP
    XZDOgJUUAupHjfdb/DcXUj+yIjLQtEIfQ9t2iSuf/xtFJAcGATOuneGJBzugnXI7kBz6
    Psh5ROedv9y898QM1Fu2wd8VemT6q6uSi+a6n4Fi0Y2aT0gGQuwrvPkD3GMOrc5cWfG4
    Vzlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1728374918;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=yKl5OWSMF42JLcdBC+gk/wIRhgqjVkOOCGpY66MSD24=;
    b=T2cyx6JfBYhM9xpkXyUKKGz1sRGa/pQ4r2nQXABvtAIvfWsVCdo9mI9Kbu0axixk+I
    nAtPNPlGuaupijyurFFz596O1g1FqBNfM171nnm7fDRcwR9Bsj9b2P8O4H2vG2NANAWk
    eT+ti3V+LABSpwjMnMAKAh8kM3CHUKVXx4ORNL3g3aABPjlmZVtd1CuIagV/fg8/rXIT
    oY4U1Eyhl8etNDVdAvElc6j22EoIRdtoJY6zzXmqkux8VchfpGPVc7Z1aOKSWfUk3JOG
    n2V9THO2ly9zwfqKXGQldcxXRpkHPOfivEumHe2tmBppesubt3D9I4zj/bl+zTILR0RQ
    OQ3A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1728374918;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=yKl5OWSMF42JLcdBC+gk/wIRhgqjVkOOCGpY66MSD24=;
    b=obtu8m6BlrjbH7r7tE4+p43IuVstZ8OtkfKft4j+27uV97mlnwVZ5+ib5tWP4Cbgup
    JYZei2sWmvHz3ufiMmrJ2po86MZH8Oc8g0yh0dTeHfMnz1tCrKuiTKMKEWTLJ6XM/RXQ
    Gd0mEmzoBs//pErxhuuMJ3PoGvrbpTJyGC0POq+Ib4xAw8wQnDuMITeQZBgbvpt8+yjR
    r+7s3z34s2vgQb82wawcLMU6KjS46nXxRiqvQ5Zs5jfOTT4+Bq+36piSYmlcKACCsHDg
    CKisjTWmaLSgcBsu3uZM6YuUk7xwWQgbatTEpObqY4MmJVnWJfY3g4kQefwXeU6xnj+U
    8iaQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1728374918;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=yKl5OWSMF42JLcdBC+gk/wIRhgqjVkOOCGpY66MSD24=;
    b=SQuWrrNc1LHH7eQ7O52JWEyqERGeO7Cajj6O7Rb5qZO6jGgt5ZBuZuh/zceIkKsEx6
    bhTobvldIELt8ZwS9rAA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yfzkZ"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.7 DYNA|AUTH)
    with ESMTPSA id Qd0dc209888bWCN
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Tue, 8 Oct 2024 10:08:37 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: BUG: "iommu: Retire bus ops" breaks omap-iommu and omap3isp
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20241007121543.GM1365916@nvidia.com>
Date: Tue, 8 Oct 2024 10:08:27 +0200
Cc: Robin Murphy <robin.murphy@arm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lu Baolu <baolu.lu@linux.intel.com>,
 Jerry Snitselaar <jsnitsel@redhat.com>,
 Joerg Roedel <jroedel@suse.de>,
 tony Lindgren <tony@atomide.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <66572BFA-4501-4087-8B2D-83DB30247CFC@goldelico.com>
References: <A7C284A9-33A5-4E21-9B57-9C4C213CC13F@goldelico.com>
 <20241007121543.GM1365916@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
X-Mailer: Apple Mail (2.3776.700.51.11.1)

Hi Jason,

> Am 07.10.2024 um 14:15 schrieb Jason Gunthorpe <jgg@nvidia.com>:
>=20
> On Sun, Oct 06, 2024 at 09:40:00AM +0200, H. Nikolaus Schaller wrote:
>> Hi,
>>=20
>> I found that the camera on our OMAP3 based system (GTA04) stopped =
working with v6.8-rc1.
>> There was no bug in the camera driver but the OMAP3 ISP (image signal =
processor) emits
>>=20
>> [   14.963684] omap3isp 480bc000.isp: failed to create ARM IOMMU =
mapping
>> [   15.010192] omap3isp 480bc000.isp: unable to attach to IOMMU
>> [   15.023376] omap3isp 480bc000.isp: isp_xclk_set_rate: cam_xclka =
set to 24685714 Hz (div 7)
>> [   15.065399] omap3isp: probe of 480bc000.isp failed with error -12
>>=20
>> Deeper analyses lead to this patch breaking operation. It is not =
fixed up to v6.12-rc1.
>>=20
>> What seems to happen (in 6.8-rc1 code):
>>=20
>> - omap_iommu_probe() passes &omap_iommu_ops to =
iommu_device_register()
>> - iommu_device_register() stores the ops in iommu->ops (only)
>> - __iommu_probe_device tries to read the ops from some fw_spec but =
not iommu->ops
>=20
> Maybe like this?
>=20
> @@ -1233,6 +1233,12 @@ static int omap_iommu_probe(struct =
platform_device *pdev)
>               err =3D iommu_device_register(&obj->iommu, =
&omap_iommu_ops, &pdev->dev);
>               if (err)
>                       goto out_sysfs;
> +               /*
> +                * omap has a DT reprensetation but can't use the =
common DT
> +                * code. Setting fwnode to NULL causes probe to be =
called for
> +                * every device.
> +                */
> +               obj->iommu.fwnode =3D NULL;
>               obj->has_iommu_driver =3D true;
>       }

Doesn't seem to solve the problems:

root@letux:~# uname -a
Linux letux 6.8.0-rc1-letux+ #19506 SMP PREEMPT Tue Oct  8 08:48:26 CEST =
2024 armv7l GNU/Linux
root@letux:~# dmesg|fgrep iommu
[    0.402862] iommu: Default domain type: Translated
[    0.402893] iommu: DMA domain TLB invalidation policy: strict mode
[    0.405303] omap-iommu 480bd400.mmu: 480bd400.mmu registered
[    0.405944] platform 480bc000.isp: Adding to iommu group 0
[   24.829071] omap3isp 480bc000.isp: iommu configuration for device =
failed with -ETIMEDOUT
[   24.880920] omap-iommu 480bd400.mmu: 480bd400.mmu: version 1.1
root@letux:~# dmesg|fgrep isp
[    0.000000] OMAP3630/DM3730 ES1.2 (l2cache iva sgx neon isp =
192mhz_clk)
[    0.405944] platform 480bc000.isp: Adding to iommu group 0
[   12.349334] omapdss_dss 48050000.dss: bound 48050400.dispc (ops =
dsi_vc_flush_receive_data [omapdrm])
[   24.821441] omap3isp 480bc000.isp: deferred probe timeout, ignoring =
dependency
[   24.829071] omap3isp 480bc000.isp: iommu configuration for device =
failed with -ETIMEDOUT
[   24.887329] omap3isp 480bc000.isp: supply vdd-csiphy1 not found, =
using dummy regulator
[   24.928680] omap3isp 480bc000.isp: supply vdd-csiphy2 not found, =
using dummy regulator
[   24.951904] omap3isp 480bc000.isp: Revision 15.0 found
[   24.958160] omap3isp 480bc000.isp: failed to attach device to VA =
mapping
[   24.994232] omap3isp 480bc000.isp: unable to attach to IOMMU
[   25.013671] omap3isp: probe of 480bc000.isp failed with error -16
root@letux:~#

I'll dig deeper.

BR and thanks,
Nikolaus=

