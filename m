Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98BC290F97
	for <lists+linux-omap@lfdr.de>; Sat, 17 Aug 2019 11:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725889AbfHQJB4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 17 Aug 2019 05:01:56 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.165]:16613 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725832AbfHQJB4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 17 Aug 2019 05:01:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1566032513;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=rlNb5vbPE+efC24LfjOSE04VLWb4QNI8n0qETVngfdM=;
        b=Pnf/FduW3jA3ZUVDg8c+L2x6M84x2PA56SpIBCE8APAC8joTcrrBtiZAEV9znFc7DM
        eItR2eA7/y8hwnqWvHLRlmg74c8nhsr52w6JmVCOMNRvTusPYRCtpHBeO9e3tLsNT+JZ
        ty/9rXwcLo2BNroko5u9mwrhBc0ML+pV4Qycj2ziLsIpJ10sriZzeF61SpNQG4f+3Hpl
        2aqZdKAcrNlUpdPc/rkOC8Sx9DwTsg77IJMwdgKQYfmflRZ46IgaqcPIrMAtvjozXnKz
        FNTQuU2TNP8Gm3TWUeKEWmxrIeV2VN4bMBjxhVdZ1t/yHgpyYyk9cnEuG35tk2eKaZUR
        LtgA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBi5wp38sDGQBQKV9qb"
X-RZG-CLASS-ID: mo00
Received: from [192.168.2.7]
        by smtp.strato.de (RZmta 44.26.1 DYNA|AUTH)
        with ESMTPSA id V074e8v7H91gJcq
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Sat, 17 Aug 2019 11:01:42 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: Lay common foundation to make PVR/SGX work without hacks on OMAP34xx, OMAP36xx, AM335x and potentially OMAP4, OMAP5
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAHCN7xJ2kcr7dOFvxTB_PX_62sX_QV5EyeMPHMaPbZ9fXts9pg@mail.gmail.com>
Date:   Sat, 17 Aug 2019 11:01:45 +0200
Cc:     Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        =?utf-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        =?utf-8?Q?Filip_Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        kernel@pyra-handheld.com,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, maemo-leste@lists.dyne.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2ACE0AFF-D929-47AB-BAA9-973DA5DB3A1C@goldelico.com>
References: <CAKpie0TSo-8gmDm9_Zw4Sd+kjVVEomp8yA9Vu8qY2U2AcrQc=w@mail.gmail.com> <8A069D96-C65F-43F5-8F54-20019CFB1A8D@goldelico.com> <d0cbfaaf-813e-8803-f90b-931a38396750@wizzup.org> <3A03FF16-C203-43ED-AEEF-0260F6B3331A@goldelico.com> <3b0a5e78-c4c2-1963-bac7-b49496a1e9b9@wizzup.org> <1F942AAB-1648-46C0-ADD5-90F6898778BE@goldelico.com> <84cac9b8-0eff-33f8-464d-4f8045d7db19@wizzup.org> <BFAA7FA6-A352-476A-99F9-02EA663A6AAD@goldelico.com> <20190814094755.GC52127@atomide.com> <6A6394A6-9D50-4E43-A8E4-716888897AD6@goldelico.com> <20190814131607.GD52127@atomide.com> <CAHCN7xJ2kcr7dOFvxTB_PX_62sX_QV5EyeMPHMaPbZ9fXts9pg@mail.gmail.com>
To:     Adam Ford <aford173@gmail.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Adam,

> Am 17.08.2019 um 01:01 schrieb Adam Ford <aford173@gmail.com>:
>=20
>=20
> Nikolaus,
>=20
> I tested Tony's change and I can confirm that I can read the value
> when enabled.  Should I apply his patches to your branch before I
> test, or is it go too to go as-is?

My branch is currently as-is and not aware of Tony's patches and based =
on v5.3-rc3.
I think I will have to remove some glue code which tries to do the =
platform
reset and enables clocks and replace by pm_runtime_get_sync() before it =
fits
together. Then we can likely remove the omap-pvr-soc-glue branch at =
least
partially and/or replace by Tony's patches before they arrive in =
mainline.

The current status of my branch is that it works on OMAP5/Pyra but a
quick test on BeagleBone or GTA04 did show some reset/clock errors and
it did not more than creating /proc/pvr. pvrsrvctl --start did fail.

Which means that the omap-pvr-soc-glue patches are currently broken
with 5.3-rc3 anyways...

I'll look at it as soon as possible.

> I've got an AM3517, OMAP35 and a
> DM3730.  I am not sure if the AM3517 is even on the radar, but it has
> an sgx530 as well.

Good to know and keep in mind.

BR,
Nikolaus

