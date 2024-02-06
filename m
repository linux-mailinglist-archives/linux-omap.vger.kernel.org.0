Return-Path: <linux-omap+bounces-506-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C580684AEEB
	for <lists+linux-omap@lfdr.de>; Tue,  6 Feb 2024 08:20:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 353D11F24705
	for <lists+linux-omap@lfdr.de>; Tue,  6 Feb 2024 07:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0960B128818;
	Tue,  6 Feb 2024 07:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mistralsolutions.com header.i=@mistralsolutions.com header.b="fNvBliSs"
X-Original-To: linux-omap@vger.kernel.org
Received: from egress-ip12b.ess.de.barracuda.com (egress-ip12b.ess.de.barracuda.com [18.185.115.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5C41E890
	for <linux-omap@vger.kernel.org>; Tue,  6 Feb 2024 07:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.185.115.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707204011; cv=none; b=AeZysfOPeIpxTss3VnzDO52SjYoGTKL9jmK4U3glZD2QMl4MAZUEhYftufJ6ijtIui6vFQ95ixYWYa/A/7bHvIQf61pqzKpofNaO0nmttxCrpsy3cRWWMsUTny2jIBiUxXXcpZJP1fktzDFRRAErpxsdM3NHuAbelBGChxnA8S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707204011; c=relaxed/simple;
	bh=RgPxP5/l8V4ZifiHFdU9QhIHaI5FNg+v9p7lwU6/BHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pDQyIg6Q8PhQUYGZorH//Lhw/VAoLHZH9th/BgpXxqRNjSIKfbKnrvm8VLofm+8vGLPfpTcaaC4omqdg48I6QimOLPYmwUxgncO+j9APf8njALzmabuKIEzaV31VxD72dPhG4hCUokT8WqKaVByi8jnNW5eYZTgtxltCOa+NRnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mistralsolutions.com; spf=pass smtp.mailfrom=mistralsolutions.com; dkim=pass (1024-bit key) header.d=mistralsolutions.com header.i=@mistralsolutions.com header.b=fNvBliSs; arc=none smtp.client-ip=18.185.115.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mistralsolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mistralsolutions.com
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199]) by mx-outbound40-107.eu-central-1c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 06 Feb 2024 07:20:06 +0000
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2d0908edbd0so4006341fa.2
        for <linux-omap@vger.kernel.org>; Mon, 05 Feb 2024 23:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google; t=1707204005; x=1707808805; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1EfW+Jop+6OtJZdK61lMyoMmAch2Wo7mDs0McyNWYJM=;
        b=fNvBliSsoWwsv9J5+phZ9E3WrQYsRTOnldhSFxrQlb2w3WSWeVaEoORDaB74sLQyDx
         mQ4RpnD0qcPZdLG4cfIyuXFpsmKQoiLvsrnjsqIOZrm3M14GKRT9iljh0VmLFeADQNV5
         oH9gNmm4KjzaanoBwyt7qWhzMq1LkV466rxeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707204005; x=1707808805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1EfW+Jop+6OtJZdK61lMyoMmAch2Wo7mDs0McyNWYJM=;
        b=Z/ZCZ7kPJLfsdwuNt0I23dTyzEZB4Zja0V5R15o0N8ppFDiu+1r3dZBRlPQR4V5t3V
         4wmZuiBFhAs77Hbac5wAqJFlIn91UU6AwfgE343iRjxSwcyevD6inrsRCGNxyggqohJg
         jZrVk+O/26MSHE4WCl5P8RXbu63/Lu3pA2+1Vx05Lj5LOTmVAdjZxl7XUQLQ2zoLqLLS
         L2t+iHv951kdvDzwUeyIStqkhKJj/LL308pW9fNQAVTLfWbEJsEkyc9f+/4D1L3WnX2J
         uxvAaKXOLkLeYXwSsm27U/LSikfyI86kj9iQHALAvPTamyrop11V+lmn0hjDpMYEK239
         XdSg==
X-Gm-Message-State: AOJu0Yzziypeq1oMtpU4WZBPp84CIDsOiuXESS4tiZoWEuUQd+J0enTY
	Ma59Bxn5A3wp2SKKKC22mXrAbXGdvrv8NCiuddZlT/KHEp7VibXzRAPBaUfAAtALAzDdb+0LcXi
	X21iyBfdF3nMBOcXzjAQxPGGVXCFVmx/lAFaeWMZYHbp49LSTww2S+J9LvJ9KDUXoj5QabJewOs
	CaFkQvCCxo0l/tlPTuVhlg3Jr617pmV3w39Jzlr86icA3Wez8OMIhBFoOvIzta/45JHeM7
X-Received: by 2002:a05:6512:6c9:b0:511:5362:e5a1 with SMTP id u9-20020a05651206c900b005115362e5a1mr1743589lff.4.1707204005503;
        Mon, 05 Feb 2024 23:20:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEH5gmjFY6vp7J9Mw07UIJ3Z5V5xL4NnCZiImByeoPo/ELcgyj2fqrLnQOiVbHK7t5/o6m7nA+tqQFTj2U9FM=
X-Received: by 2002:a05:6512:6c9:b0:511:5362:e5a1 with SMTP id
 u9-20020a05651206c900b005115362e5a1mr1743570lff.4.1707204005124; Mon, 05 Feb
 2024 23:20:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206005928.15703-1-sinthu.raja@ti.com> <20240206005928.15703-2-sinthu.raja@ti.com>
 <2ffdca7f-f865-b719-b701-9ed4716da71a@ti.com>
In-Reply-To: <2ffdca7f-f865-b719-b701-9ed4716da71a@ti.com>
From: Sinthu Raja M <sinthu.raja@mistralsolutions.com>
Date: Tue, 6 Feb 2024 12:49:53 +0530
Message-ID: <CAEd-yTSXJdm0GQfA1HxHp7ACaHt7SdhYNepbwLtmc7PJETTzpg@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] net: ethernet: ti: cpsw_new: enable mac_managed_pm
 to fix mdio
To: Ravi Gunasekaran <r-gunasekaran@ti.com>
Cc: Denis Kirjanov <dkirjanov@suse.de>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Roger Quadros <rogerq@kernel.org>, linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
	Sinthu Raja <sinthu.raja@ti.com>, stable@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BESS-ID: 1707204005-310347-12437-464-1
X-BESS-VER: 2019.1_20240206.0113
X-BESS-Apparent-Source-IP: 209.85.208.199
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKViYGZqZAVgZQ0NLIPDExxcAyzc
	zMONHc2MAwycgw1SjZ0DwlzTLJwDJRqTYWAC+z3dhBAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.254017 [from 
	cloudscan20-104.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status:1

On Tue, Feb 6, 2024 at 11:31=E2=80=AFAM Ravi Gunasekaran <r-gunasekaran@ti.=
com> wrote:
>
>
>
> On 2/6/24 6:29 AM, Sinthu Raja wrote:
> > From: Sinthu Raja <sinthu.raja@ti.com>
> >
> > The below commit  introduced a WARN when phy state is not in the states=
:
> > PHY_HALTED, PHY_READY and PHY_UP.
> > commit 744d23c71af3 ("net: phy: Warn about incorrect mdio_bus_phy_resum=
e() state")
> >
> > When cpsw_new resumes, there have port in PHY_NOLINK state, so the belo=
w
> > warning comes out. Set mac_managed_pm be true to tell mdio that the phy
> > resume/suspend is managed by the mac, to fix the following warning:
> >
> > WARNING: CPU: 0 PID: 965 at drivers/net/phy/phy_device.c:326 mdio_bus_p=
hy_resume+0x140/0x144
> > CPU: 0 PID: 965 Comm: sh Tainted: G           O       6.1.46-g247b2535b=
2 #1
> > Hardware name: Generic AM33XX (Flattened Device Tree)
> >  unwind_backtrace from show_stack+0x18/0x1c
> >  show_stack from dump_stack_lvl+0x24/0x2c
> >  dump_stack_lvl from __warn+0x84/0x15c
> >  __warn from warn_slowpath_fmt+0x1a8/0x1c8
> >  warn_slowpath_fmt from mdio_bus_phy_resume+0x140/0x144
> >  mdio_bus_phy_resume from dpm_run_callback+0x3c/0x140
> >  dpm_run_callback from device_resume+0xb8/0x2b8
> >  device_resume from dpm_resume+0x144/0x314
> >  dpm_resume from dpm_resume_end+0x14/0x20
> >  dpm_resume_end from suspend_devices_and_enter+0xd0/0x924
> >  suspend_devices_and_enter from pm_suspend+0x2e0/0x33c
> >  pm_suspend from state_store+0x74/0xd0
> >  state_store from kernfs_fop_write_iter+0x104/0x1ec
> >  kernfs_fop_write_iter from vfs_write+0x1b8/0x358
> >  vfs_write from ksys_write+0x78/0xf8
> >  ksys_write from ret_fast_syscall+0x0/0x54
> > Exception stack(0xe094dfa8 to 0xe094dff0)
> > dfa0:                   00000004 005c3fb8 00000001 005c3fb8 00000004 00=
000001
> > dfc0: 00000004 005c3fb8 b6f6bba0 00000004 00000004 0059edb8 00000000 00=
000000
> > dfe0: 00000004 bed918f0 b6f09bd3 b6e89a66
> >
> > Cc: <stable@vger.kernel.org> # v6.0+
> > Fixes: 744d23c71af3 ("net: phy: Warn about incorrect mdio_bus_phy_resum=
e() state")
>
> In v1, you received a comment to add the fixes tag. The reference stmmac =
patch also points
> to this commit as Fixes tag. But as Paolo pointed out in v2, this is not =
the right
> fixes tag for your patch series.
>
> I did a git blame on few drivers where PHY is managed by MAC. These have
> Fixes: fba863b81604 ("net: phy: make PHY PM ops a no-op if MAC driver man=
ages PHY PM")

Thanks, Ravi for pointing this out.
But the warning message was caused only after the below commit had been add=
ed.
744d23c71af3 ("net: phy: Warn about incorrect mdio_bus_phy_resume() state")

With the below commit the warning didn't pop up.
fba863b81604 ("net: phy: make PHY PM ops a no-op if MAC driver manages PHY =
PM")
That is the reason I have not changed the Fixes tag.

Let's wait for Paolo's comment on this Fixes: fba863b81604 ("net: phy:
make PHY PM ops a no-op if MAC driver manages PHY PM")

> which seems to be more appropriate, as this is the commit that introduced=
 the
> 'mac_managed_pm' flag.
>
> I have Cc'ed Paolo in this reply. But in future, please take care of addi=
ng the people
> who provided review comments in To/Cc when sending reworked patch/series.

Noted.

Regards,
Sinthu Raja

>
> > Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> > ---
> >
> > Changes in V3:
> >       - No Change
> >
> > Changes in V2:
> >       - Add fixes tag.
> >
> >  drivers/net/ethernet/ti/cpsw_new.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/net/ethernet/ti/cpsw_new.c b/drivers/net/ethernet/=
ti/cpsw_new.c
> > index 498c50c6d1a7..087dcb67505a 100644
> > --- a/drivers/net/ethernet/ti/cpsw_new.c
> > +++ b/drivers/net/ethernet/ti/cpsw_new.c
> > @@ -773,6 +773,9 @@ static void cpsw_slave_open(struct cpsw_slave *slav=
e, struct cpsw_priv *priv)
> >                       slave->slave_num);
> >               return;
> >       }
> > +
> > +     phy->mac_managed_pm =3D true;
> > +
> >       slave->phy =3D phy;
> >
> >       phy_attached_info(slave->phy);
>
> --
> Regards,
> Ravi



--
With Regards
Sinthu Raja

