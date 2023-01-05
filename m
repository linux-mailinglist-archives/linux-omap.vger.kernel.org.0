Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12D9A65F40F
	for <lists+linux-omap@lfdr.de>; Thu,  5 Jan 2023 20:02:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234942AbjAETCB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Jan 2023 14:02:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235428AbjAETB4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Jan 2023 14:01:56 -0500
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B73A5F91A
        for <linux-omap@vger.kernel.org>; Thu,  5 Jan 2023 11:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1672945295;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=kq2DE4eHLw+YqPUGZIuDS6cHi5aE0w/b7SISiqmqrfE=;
    b=EAj4ib6LFyC/WdtDeNpvHrv0mUokGfGpWE2wNIf9JNvr3dl8LXgpEoXkotdDBZEen/
    7ZzUEajGpnx5/jahOLtO50UUvVlZzwXY5wJx8FlX9tZgMZVf8wbSDO2siHnYl0dzvVZP
    moytE2ONsEi5Pypc0S5OTB1kktDwxmvwXfUtziE5H17pQnEjnE8/49Un71/2XIm+H/cC
    1e9nXzsrpupaBk6vfZodvlh5eoqfUmXXgrYl8RuUYnVSJTntnv2OZfULLn/lg6+rB4YP
    RBX8bOYrQDY3VBQpSrqrRjKso9g4noVQrwvsjxq9nCnzng0xPfMQaKF7Y8cREkdia+xZ
    0ecQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qviAxtjc36i2p72eh02FZ+tEZkCQabrcLjvb4nHbrziwqg="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2001:9e8:a5d7:d300:70e1:3885:7db6:bf58]
    by smtp.strato.de (RZmta 48.2.1 AUTH)
    with ESMTPSA id D06834z05J1ZCnD
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Thu, 5 Jan 2023 20:01:35 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: omap_hsmmc RX DMA errors
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAHCN7xJT+1XP-LHyzj0GB5rDnVP+EgGmUVb6h4uTJA4bVE1yPg@mail.gmail.com>
Date:   Thu, 5 Jan 2023 20:01:34 +0100
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4851F940-574B-43A7-9CBC-26B9485EB2F3@goldelico.com>
References: <CAHCN7xJT+1XP-LHyzj0GB5rDnVP+EgGmUVb6h4uTJA4bVE1yPg@mail.gmail.com>
To:     Adam Ford <aford173@gmail.com>
X-Mailer: Apple Mail (2.3445.104.21)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Adam,
happy new year!

> Am 05.01.2023 um 18:54 schrieb Adam Ford <aford173@gmail.com>:
>=20
> I am trying to test the 6.0 kernel on an AM3517-EVM, but I am seeing
> some DMA RX errors:
>=20
> [    1.730682] omap_hsmmc 4809c000.mmc: RX DMA channel request failed
> [    1.738403] omap_hsmmc 480b4000.mmc: RX DMA channel request failed

I think I remember there was an issue that more an more devices were =
switched active by default
to use DMA until the 32 channels of an OMAP are filled up. Which =
subsystem is hit by this
limitation may vary and depends if they are properly disabled on the =
specific board DTS.

See: =
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dcommit;h=3D048b9bc86b9=
a080258460c4ab2989660233c4c8c

(I must admit that it is not yet upstreamed).

> I tried changing the omap3.dtsi file to use the newer sdhci-omap
> controller instead of the older hsmmc driver since it has support for
> the omap3.

This would then only be a workaround but not a solution.

> That seemed to fix the issue:
>=20
> [    2.141967] omap-dma-engine 48056000.dma-controller: OMAP DMA =
engine driver
> [    2.183074] mmc1: SDHCI controller on 480b4000.mmc [480b4000.mmc]
> using External DMA
> [    2.184631] mmc0: SDHCI controller on 4809c000.mmc [4809c000.mmc]
> using External DMA
>=20
> Would there be an objection if I migrate the OMAP3.dtsi file to the
> newer driver?  I wasn't sure if there was a reason this family was
> being held back from the newer driver.

AFAIR Tony wanted to retire the older driver anyways.

Best regards,
Nikolaus

