Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0FD355C8B9
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jun 2022 14:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237533AbiF0Lsz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Jun 2022 07:48:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238361AbiF0LsV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 Jun 2022 07:48:21 -0400
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63462FD10
        for <linux-omap@vger.kernel.org>; Mon, 27 Jun 2022 04:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1656330041;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=6gF+EtlMk3gTGWSABVOVEZv/1/nvZ6L2CYZCHCa/pVE=;
    b=WyTM3I+wnCu0BLkmHa/A4LLD7ymjUaOUKVf5tJj9LM8K10X1S2HUCZvt+SC+quTOsO
    MUVuVUQwLKz9SZdyOJrO2Ye7RONI9FMQKZYphhPyWsvhNeIClkAolNp9vQLgBPh+Kk4U
    XA2Mj/YiMjbW61rY71EzMpl+sVaaWX+cfY1vqURGjiSn166zC91Q26n8tNpP2MmrqBUj
    R/R2acqtQ927qfXAqSq3lFzeyo7fSmBJqe2JNiijeZauqqVpAAUKusuiwuMILl0owevB
    rpAgTxP7wC21UZ5YdEdKx2m/IrqJAelBml76syi+pcnh80vPE6MFXSo67Jp/7Jl2BCkh
    Fpmw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw43tlAA="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.46.0 DYNA|AUTH)
    with ESMTPSA id qc786ey5RBeeCnf
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Mon, 27 Jun 2022 13:40:40 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: Pandora audio using machine_is_omap3_pandora() check
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <Yrl92RILZwhQOP+e@atomide.com>
Date:   Mon, 27 Jun 2022 13:40:40 +0200
Cc:     Grazvydas Ignotas <notasas@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        alsa-devel@alsa-project.org,
        linux-omap <linux-omap@vger.kernel.org>,
        Stefan Leichter <sle85276@gmx.de>, Grond <grond66@riseup.net>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B6EFBA88-2311-4455-82CB-3E5382C92B4E@goldelico.com>
References: <Yrl92RILZwhQOP+e@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3445.104.21)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

> Am 27.06.2022 um 11:52 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> Hi Grazvydas,
>=20
> Arnd noticed that pandora audio is using machine_is_omap3_pandora() =
check
> that never succeeds for devicetree booting machines. Looks like this =
has
> been broken at some point many years ago with the devicetree =
conversion.
>=20
> Does anybody have an interest in fixing this driver?

we already have fixes by Stefan Leichter and Grond here (incl. removing =
any call to machine_is_omap3_pandora):

	=
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dshortlog;h=3Drefs/head=
s/letux/sound-soc

But I don't know who can volunteer to run this series through the =
upstreaming discussions
and do regression tests (AFAIR the Pandora of Grond is broken and he has =
no replacement).

BR,
NIkolaus=
