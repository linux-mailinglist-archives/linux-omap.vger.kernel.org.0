Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2057A70E060
	for <lists+linux-omap@lfdr.de>; Tue, 23 May 2023 17:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233132AbjEWPYc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 May 2023 11:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237131AbjEWPYc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 23 May 2023 11:24:32 -0400
X-Greylist: delayed 168 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 23 May 2023 08:24:28 PDT
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF77E11A
        for <linux-omap@vger.kernel.org>; Tue, 23 May 2023 08:24:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684855284; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=qb7CDP+J0CLXmwav9iOcVtNeXjZbCap9fwoZmoAYx5LAhRDWw1rYUnfiBVbid1vZF3
    k7DGB/4Vf2aQPXWdyN7SsvXC56V6By8HxNbtrai+qIuWyDlK/CJo4ex3XGq5LHOM7loA
    TUR8dC3fYnjhkTBwoNEJrlOpsPKg1LGadfmi+vwZa+8km5Czf5pDMXX3002KipAJ2Kuv
    JkoPRGe9dn6TcSeWDXusdEwVSAO4h8WYAxGUjD6I1Nz84Xv9DmT9mJEMha8wCtGvVsfH
    9gHJvr8nDLOXWD0Kw0SFubZjk59Bqs8nhbpbDi3ZrZHB7dJymhh8LrKt5N9Z+8SCFqyN
    Lhlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1684855284;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:To:Cc:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=IOS/bp7pfcYQ83YyadP71rdL+gJMFknhqTj1Z8e1ZCA=;
    b=HSvaekxXGxD+2QsGQFz6MtkzzO/vKFgWZ56bfuVR8Z5HOGrRcfmsaR42lTRCwWiG7J
    n3kcSDVt1TwznKHNy7i3BTaWy36pxwrlyNjbWh02pLG+bU7lzKZ1DYIirpG7roWx0+DD
    Ok6EloiJSY7TGliosSHw+BLPCt2U42rMjCqqU3LVmVOkQO2Xqph00kcdJn/oJQg1PVnn
    AQLNgaQ3xNKy4uUS7TUP7x4ATbVktnBYa1nl/BXl/LCNFYwnxEWl+zNV2nKCiDc4qKk+
    P71yko/4dFkdx/idZPFqitQHRfmyvCB/7/EkCk2nXm5r9Z2cTQSJsdgG8Y7WO3T0VTMU
    kZRA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1684855284;
    s=strato-dkim-0002; d=goldelico.com;
    h=Message-Id:To:Cc:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=IOS/bp7pfcYQ83YyadP71rdL+gJMFknhqTj1Z8e1ZCA=;
    b=UzhJUcDPKJ2/s7Xu70ABsIC0518YKCBaMmvlBTuDRpg+V01a8HNEoQ1wL+0ziSL5n4
    AxDRi0t3Fxh+hlOu3uxWY837DzLK3/BrjLXMPTxCCJfWdE7NmOcN4cMUetvhxJo+H0e1
    kEFtFzJwKFlBadUxNlhHMbcjCwJy42sgBqXDp2XdFk0/Cd1Hm3yeu6tPtfahqoBp1TF3
    Da9wvhXpdksL3yQtoaMgDvZwQKJ2uk1A78iGzv+na1ivY2luoi0hnZb5IRZ0C6ueci97
    1OsrgkmjFC+opqenPC3+IGOnKTp51sABTVcpeVn7lRKtjOpiJl1g2QeqFTimxN8a1Ae/
    uKvw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1684855284;
    s=strato-dkim-0003; d=goldelico.com;
    h=Message-Id:To:Cc:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=IOS/bp7pfcYQ83YyadP71rdL+gJMFknhqTj1Z8e1ZCA=;
    b=CvtLp++w0LdgLqcoHw0JzMrGpPtj83qcLqhOAHqsYQBNT+poC/NCuKvVulu/ZbCTjR
    boA4S3KX5yDZtj68TACg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Apz9PSN6LgsXcGYk/8="
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 49.4.0 DYNA|AUTH)
    with ESMTPSA id C9fe35z4NFLMefF
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Tue, 23 May 2023 17:21:22 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Date:   Tue, 23 May 2023 17:21:22 +0200
Subject: OMAP4/5 AESS on v6.4
Cc:     linux-omap@vger.kernel.org, Letux-kernel@openphoenux.org
To:     Tony Lindgren <tony@atomide.com>,
        =?utf-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Message-Id: <FFF13275-327A-4E3C-95E5-88B6A376F582@goldelico.com>
X-Mailer: Apple Mail (2.3445.104.21)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony and Peter,
I have upgraded my WIP tree to v6.4-rc3 now.

It is almost working, firmware can be built, and is loaded, subdevices =
are presented, graph
has been verified against the working 3.15 version, legacy sound works, =
amixer settings are
fine, etc.

The last remaining issue (before the next reveals itself) is that the AE =
DSP isn't running.
Playing a sound gets stuck in wait_for_avail() in sound/core/pcm_lib.c =
obviously waiting for=20
some interrupt or DMA trigger from the DSP.

Kernel log/user-space symptoms are:

[   36.957956] omap-abe-twl6040 sound: playback write error (DMA or IRQ =
trouble?)
play WARN alsa: Input/output error

So it may either be a clocking or power issue or something with =
initialization.
Very difficult to find. Also symptomatic seems to be that I can hex-dump =
the /sys/kernel/debug
files for cmem, dmem, and smem but not pmem.


Therefore I am currently going once again through all questionable code =
where I
had noted a FIXME to tell that it is obviously not compatible to modern
kernels and has not yet been fixed.


One such place is

=
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dblob;f=3Dsound/soc/ti/=
aess/omap-aess-pcm.c;h=3De9c8b9a00f032f336cac8cbb7e441ce8a7476507;hb=3D74d=
b6d179bad60cdad29a8704f9e606f8cffccd3#l673

where there is a "context-lost mechanism" which was removed in v4.18.

Any ideas what that "context lost" is or how it can be fixed in modern =
kernels?


You may also try or review the full tree:

=
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dshortlog;h=3Drefs/head=
s/aess-6.4-rc3

I haven't tried that as a stand-alone without my other local Letux =
patches for my
devices, but I think it can run at least on PandaES and omap5uevm after =
configuring
omap2plus_defconfig.

Building firmware is best done on the device and running a script like =
this one:

=
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dblob;f=3DLetux/root/bu=
ild-aess-fw;h=3D0bfe59559e5395fb1e5ad32bbbac676d7665aa22;hb=3Drefs/heads/l=
etux-current

This clones the kernel git repo and tries to build the firmware on the =
target device.
I have only tested on Debian 9.13. Other releases may reveal subtle =
conflicts in system
include files...


Any help (also by readers) to get this beast finally working is welcome.

Best regards,
Nikolaus

