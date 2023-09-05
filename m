Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41C0B792487
	for <lists+linux-omap@lfdr.de>; Tue,  5 Sep 2023 17:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230412AbjIEP7I (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Sep 2023 11:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354567AbjIEMmb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Sep 2023 08:42:31 -0400
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE2D71BE
        for <linux-omap@vger.kernel.org>; Tue,  5 Sep 2023 05:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693917727; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=YdKCAElC1SYzTPA9ihPx0I2Du3dyqJJVTLe6uzQx0dgzqkC3uex73us7fkSPkXso2V
    y58w/k9wv+fsgr8gPcplVMWVq1aXpXhlbR96sFdWDNgI8Vf9p6DArHsTqliNlAJlPz9x
    aUqvJcycT0+veIRqxqiAISVZ+mxNakECih5WgGUwGjz9p3Yy16Rfz0NWovc+xubVAsqU
    BbuQd7utoxar4kpQF8NSmTB1rF251BQFcOBqCnjyGiQmZF6t3zCatWWJbGtp6in1ATWA
    V+Zyq2vL+DhixM04DNhosrswpW7nLfcY69iSyDMdGQrIAZtv6JStQlJuwtrLemjgnzRL
    czdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1693917727;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=153qEIZo+3AMPvrL2rhMrxAFSmFWb8hProXBMCL6AGk=;
    b=PQbMMtqvU68k/7xtd6qzuWr5RWPLEQIh+z9A0TBeWBT7MbtwsJpTLrlCcL+lBCC9/3
    JoM6QT+NToFOywJWmjn/rhxuupo49SCZBGpjPuYbm9HOxmzUJUWq6EAnHXGE1gH3qP/x
    spdrIozBolg/XbVjo+9iw5gn8nVr0/rYlloRVWrZRrmaxLbkx1FptkeC4q8oLXG+Ht53
    74K4sxOwsB80wmurbbt3+zwiCuVI7uOy7cijjFo8G7jP4vnXFqory1sfnSzUMRT+iYmD
    GO8ue5hIwXBpBR2eCgASMRtTXXAVwkgLd5rV0P2SzwMMsVSfYtPlUKE6PB59f0SyzFDs
    g2lQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1693917727;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=153qEIZo+3AMPvrL2rhMrxAFSmFWb8hProXBMCL6AGk=;
    b=mGo/a3UAusmPFIok/eorZcPZjs+UAGi/02x/WO+C17Z1laNhgMwO3MmiFBgooraVOY
    OLyXgcTfNhnnhXpBSGv/MfpPJrP6aFvDIjxXDRi9GxJfrPecpCFBMhe/+CoE8zDvqdRl
    qjLUO1LoCckuGBUnbjuFmBnIHRRDLRlt4045wv0Aly0jGL+Ouq8QYh1/do9/EQswbGZS
    AkxgJtKFCQo+rVVwXZXIRvu234t3yBNi5u3jUdpInzzoz2N7PTdo4PPOA95289cjeBtD
    favrqQzm1cvGvsXlY8340ep5P9W/B4BSDCC5ekrhpDdk1j+7g7PIy+WS5Ytt+B36H6td
    slxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1693917727;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=153qEIZo+3AMPvrL2rhMrxAFSmFWb8hProXBMCL6AGk=;
    b=Iu/lxKXoqvrFXPS6Tom0ANlXM+jD2nR9EJTxMpeDN+Mk7qulRe7jilS9tV03Jq28GV
    REvzlCHndHO/5fDQdxDw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Apz9PSN6LgsXcGZizY="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 49.8.2 DYNA|AUTH)
    with ESMTPSA id 04cbadz85Cg3LWW
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Tue, 5 Sep 2023 14:42:03 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.4\))
Subject: Re: ABE/AESS on modern kernel: clocks, hwmods etc.
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20230905061208.GW11676@atomide.com>
Date:   Tue, 5 Sep 2023 14:42:03 +0200
Cc:     Andreas Kemnade <andreas@kemnade.info>,
        =?utf-8?Q?Patrik_Dahlstr=C3=B6m?= <risca@dalakolonin.se>,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        linux-omap@vger.kernel.org,
        =?utf-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9CF135C5-85B6-47CC-985C-FE6F4B24407D@goldelico.com>
References: <45F44D32-E846-4A53-BA20-9C78CD4411F3@goldelico.com>
 <ZO4SWw/rbJH5Dpbq@dalakolonin.se>
 <A029FB33-9FBB-4CE5-92D5-597E10B3A032@goldelico.com>
 <ZPH5Yr3w7ruN/io0@dalakolonin.se>
 <05B47ED4-CA2C-4754-ABB1-0591E9018E57@goldelico.com>
 <ZPLYG16mwiwt9G9R@dalakolonin.se>
 <CB775A6F-FDB6-4639-B386-8E8BEE4CD88C@goldelico.com>
 <20230902122635.2482b0cf@aktux> <20230904063432.GV11676@atomide.com>
 <03375B42-C86E-4B37-98C2-C1FBA7AB68B6@goldelico.com>
 <20230905061208.GW11676@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3696.120.41.1.4)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

> Am 05.09.2023 um 08:12 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> The key observation is that the abe_iclk references in the DTS seem to =
be nowhere referenced
>> (which may or may not be an issue):
>>=20
>> =
https://github.com/goldelico/letux-kernel/blob/letux/aess-v12/arch/arm/boo=
t/dts/ti/omap/omap44xx-clocks.dtsi#L509
>> =
https://github.com/goldelico/letux-kernel/blob/letux/aess-v12/arch/arm/boo=
t/dts/ti/omap/omap54xx-clocks.dtsi#L161
>=20
> So I guess the ick is in the dts the ocp_abe_iclk@528 for omap4 and
> abe_iclk@528 for omap5. Seems like the driver should request them, I =
recall
> that the interconnect target module does not need the ick to access =
sysc
> and revision registers.

Yes, that is what I suspect but I don't know how to request them.

>=20
>> The branch where all changes are sitting can be inspected here:
>>=20
>> =
https://github.com/goldelico/letux-kernel/commits/letux/aess-v12?after=3D5=
67e9011a67f4ed0824c2989a5d5f73ca0139461+63&branch=3Dletux%2Faess-v12&quali=
fied_name=3Drefs%2Fheads%2Fletux%2Faess-v12
>>=20
>> They are all tagged ARM: DTS: omap4 or omap5.
>=20
> Hmm the "we don't need separate target modules" patch is wrong, the =
modules
> may have separate clocks and power domains, and flushing a posted =
write to

According to several TRM versions this is only one module (the Audio =
Engine AE module) which provides these RAM areas.
"The AE subsystem includes an AE and has the following on-chip memories =
available: 64-KiB data memory (DMEM); 6-KiB coefficient memory (CMEM); =
8-KiB program memory (PMEM); and 18-KiB sample memory (SMEM)."
"Figure 13-1. Audio Back End" seems to integrate the whole AE into a =
single (target) module being part of the ABE together with McPDM, McBSP, =
WDT, GPTIMER.

There seems to be no separate dmem, cmem, smem, pmem modules which need =
hwmod or sysc control.

See also Table "Table 2-8. ABE DSP Memory Space Mapping" in the OMAP5432 =
TRM where DMEM and CMEM are called "Memory".
But you are right the SMEM and PMEM are called "Module" like for example =
MCBSP2. But there is also an AESS configuration "module".

Finally "Table 3-243. CD_ABE Modules Clocks Association" seems to be =
quite cleart that there is AESS_GFCLK and ABE_GICLK.
And clocks for all other modules - but no special ones for the memory =
blocks.

Maybe "Table 3-245. CD_ABE Modules Clock-Management Modes and Control" =
and "Table 3-246. CD_ABE Modules Slave Clock-Management Modes and =
Control"
give more hints about the CLKCTRL we need:

CM_ABE_AESS_CLKCTRL[18] STBYST
CM_ABE_AESS_CLKCTRL[17:16] IDLEST
CM_ABE_L4_ABE_CLKCTRL[17:16] IDLEST
CM_ABE_AESS_C LKCTRL[1:0] MODULEMODE
CM_ABE_L4_ABE_ CLKCTRL[1:0] MODULEMODE=20

Table "Table 3-1074. ABE_CM_CORE_AON Register Mapping Summary" (all from =
OMAP5 TRM) also may be helpful.

> one module does not flush write to the other module. This can lead =
into hard
> to track down bugs accessing separate modules. The dts module data I
> generated from the hardware AP registers for each SoC so the module =
ranges
> should be correct.

Finally all this was based on some 3.15 DTS entry by TI which has a =
single ti,hwmods =3D "aess"; entry.

I have not found a link to the original but have a copy in our tree:

=
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dcommit;h=3Dca9ee953210=
4eac5cfee1bd77a2bf6296cbec648

It seems to be impossible to handle this with multiple target-modules.

>=20
>> Hope this helps. Otherwise we have to prepare a cleaned up version of =
the DTS changes as a patch series.
>=20
> Yeah nice,

I have done this so that only the AESS specific DTS changes remain and I =
will post a short RFC series soon.
This should make it easier for doing reviews.

BR and thanks,
Nikolaus

